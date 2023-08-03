import 'package:jadwal_kuliah/app/app.logger.dart';
import 'package:jadwal_kuliah/models/fakultas_model.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FakultasService with ListenableServiceMixin {
  FakultasService() {
    listenToReactiveValues([items]);
  }

  final log = getLogger('FakultasService');

  static const String tableName = 'fakultas';
  final _supabase = Supabase.instance.client;

  final _items = ReactiveList<FakultasModel>();

  /// List of all data
  List<FakultasModel> get items => _items.toSet().toList();

  Future<void> syncData() async {
    await gets();
  }

  /// Get all data
  Future<List<FakultasModel>> gets() async {
    try {
      final response = await _supabase.from(tableName).select<PostgrestList>();

      if (response.isEmpty) {
        return [];
      }

      final list = response.map((e) => FakultasModel.fromJson(e)).toList();

      _items.clear();

      _items.addAll(list);

      return list;
    } catch (e) {
      log.e(e);
    }

    return [];
  }

  /// Save or update data
  Future<void> save(FakultasModel fakultas) async {
    try {
      await _supabase.from(tableName).upsert(fakultas.toJson());

      final index = _items.indexWhere((element) => element.id == fakultas.id);

      if (index >= 0) {
        _items[index] = fakultas;
      } else {
        _items.add(fakultas);
      }
    } catch (e) {
      log.e(e);
      throw 'Gagal menyimpan data';
    }
  }

  /// Delete data
  Future<void> delete(FakultasModel fakultas) async {
    try {
      await _supabase.from(tableName).delete().eq('id', fakultas.id);

      _items.remove(fakultas);
    } catch (e) {
      log.e(e);
      throw 'Gagal menghapus data';
    }
  }
}
