import 'package:jadwal_kuliah/app/app.logger.dart';
import 'package:jadwal_kuliah/models/kelas_model.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class KelasService with ListenableServiceMixin {
  KelasService() {
    listenToReactiveValues([items]);
  }

  final log = getLogger('KelasService');

  static const String tableName = 'kelas';
  final _supabase = Supabase.instance.client;

  final _items = ReactiveList<KelasModel>();

  /// List of all data
  List<KelasModel> get items => _items.toSet().toList();

  bool _isSync = false;

  Future<void> syncData() async {
    if (_isSync) return;

    await gets();

    _isSync = true;
  }

  /// Get all data
  Future<List<KelasModel>> gets() async {
    try {
      final response = await _supabase
          .from(tableName)
          .select()
          .order('tahun_angkatan')
          .order('id_program_studi')
          .order('jenis', ascending: true);

      log.d("response: $response");

      if (response.isEmpty) {
        return [];
      }

      final list = response.map((e) => KelasModel.fromJson(e)).toList();

      _items.clear();

      _items.addAll(list);

      return list;
    } catch (e) {
      log.e(e);
    }

    return [];
  }

  /// Save or update data
  Future<void> save(KelasModel model) async {
    try {
      await _supabase.from(tableName).upsert(model.toJson());

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
  Future<void> delete(KelasModel model) async {
    try {
      await _supabase.from(tableName).delete().eq('id', model.id);

      _items.remove(model);
    } catch (e) {
      log.e(e);
      throw 'Gagal menghapus data';
    }
  }
}
