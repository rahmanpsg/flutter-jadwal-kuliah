import 'package:jadwal_kuliah/app/app.logger.dart';
import 'package:jadwal_kuliah/models/hari_model.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HariService with ListenableServiceMixin {
  HariService() {
    listenToReactiveValues([items]);
  }

  final log = getLogger('HariService');

  static const String tableName = 'hari';
  final _supabase = Supabase.instance.client;

  final _items = ReactiveList<HariModel>();

  /// List of all data
  List<HariModel> get items => _items.toSet().toList();

  bool _isSync = false;

  Future<void> syncData() async {
    if (_isSync) return;

    await gets();

    _isSync = true;
  }

  /// Get all data
  Future<List<HariModel>> gets() async {
    try {
      final response = await _supabase
          .from(tableName)
          .select()
          .order('created_at', ascending: true);

      log.d("response: $response");

      if (response.isEmpty) {
        return [];
      }

      final list = response.map((e) => HariModel.fromJson(e)).toList();

      _items.clear();

      _items.addAll(list);

      return list;
    } catch (e) {
      log.e(e);
    }

    return [];
  }

  /// Save or update data
  Future<void> save(HariModel model) async {
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
  Future<void> delete(HariModel model) async {
    try {
      await _supabase.from(tableName).delete().eq('id', model.id);

      _items.remove(model);
    } catch (e) {
      log.e(e);
      throw 'Gagal menghapus data';
    }
  }
}
