import 'package:jadwal_kuliah/app/app.logger.dart';
import 'package:jadwal_kuliah/models/matakuliah_model.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MatakuliahService with ListenableServiceMixin {
  MatakuliahService() {
    listenToReactiveValues([items]);
  }

  final log = getLogger('MatakuliahService');

  static const String tableName = 'matakuliah';
  final _supabase = Supabase.instance.client;

  final _items = ReactiveList<MatakuliahModel>();

  /// List of all data
  List<MatakuliahModel> get items => _items.toSet().toList();

  bool _isSync = false;

  Future<void> syncData() async {
    if (_isSync) return;

    await gets();

    _isSync = true;
  }

  /// Get all data
  Future<List<MatakuliahModel>> gets() async {
    try {
      final response = await _supabase.from(tableName).select<PostgrestList>();

      log.d("response: $response");

      if (response.isEmpty) {
        return [];
      }

      final list = response.map((e) => MatakuliahModel.fromJson(e)).toList();

      _items.clear();

      _items.addAll(list);

      return list;
    } catch (e) {
      log.e(e);
    }

    return [];
  }

  /// Save or update data
  Future<void> save(MatakuliahModel model) async {
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
  Future<void> delete(MatakuliahModel model) async {
    try {
      await _supabase.from(tableName).delete().eq('id', model.id);

      _items.remove(model);
    } catch (e) {
      log.e(e);
      throw 'Gagal menghapus data';
    }
  }
}
