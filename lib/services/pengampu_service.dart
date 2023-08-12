import 'package:jadwal_kuliah/app/app.logger.dart';
import 'package:jadwal_kuliah/models/pengampu_model.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PengampuService with ListenableServiceMixin {
  PengampuService() {
    listenToReactiveValues([items]);
  }

  final log = getLogger('PengampuService');

  static const String tableName = 'pengampu';
  final _supabase = Supabase.instance.client;

  final _items = ReactiveList<PengampuModel>();

  /// List of all data
  List<PengampuModel> get items => _items.toSet().toList();

  bool _isSync = false;

  Future<void> syncData() async {
    if (_isSync) return;

    await gets();

    _isSync = true;
  }

  /// Get all data
  Future<List<PengampuModel>> gets() async {
    try {
      final response = await _supabase
          .from(tableName)
          .select<PostgrestList>(
            '*, kelas:pengampu_kelas(*)',
          )
          .order('tahun_akademik', ascending: true)
          .order('id_matakuliah', ascending: true)
          .order('id_dosen', ascending: true);

      log.d("response: $response");

      if (response.isEmpty) {
        return [];
      }

      final list =
          response.map((json) => PengampuModel.fromJson(json)).toList();

      _items.clear();

      _items.addAll(list);

      return list;
    } catch (e) {
      log.e(e);
    }

    return [];
  }

  /// Save or update data
  Future<void> save(PengampuModel model) async {
    try {
      await _supabase.from(tableName).upsert(model.toJson());

      await _supabase
          .from('pengampu_kelas')
          .delete()
          .eq('id_pengampu', model.id);

      await _supabase
          .from('pengampu_kelas')
          .upsert(model.kelas.map((kelas) => kelas.toJson()).toList());

      final index = _items.indexWhere((element) => element.id == model.id);

      if (index >= 0) {
        _items[index] = model;
      } else {
        _items.add(model);
      }
    } catch (e) {
      log.e(e);
      throw 'Gagal menyimpan data';
    }
  }

  /// Delete data
  Future<void> delete(PengampuModel model) async {
    try {
      await _supabase.from(tableName).delete().eq('id', model.id);

      _items.remove(model);
    } catch (e) {
      log.e(e);
      throw 'Gagal menghapus data';
    }
  }
}
