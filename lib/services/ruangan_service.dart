import 'package:jadwal_kuliah/app/app.logger.dart';
import 'package:jadwal_kuliah/models/ruangan_model.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RuanganService with ListenableServiceMixin {
  RuanganService() {
    listenToReactiveValues([items]);
  }

  final log = getLogger('RuanganService');

  static const String tableName = 'ruangan';
  final _supabase = Supabase.instance.client;

  final _items = ReactiveList<RuanganModel>();

  /// List of all data
  List<RuanganModel> get items => _items.toSet().toList();

  bool _isSync = false;

  Future<void> syncData() async {
    if (_isSync) return;

    // await _generateDummy();

    await gets();

    _isSync = true;
  }

  // generate dummy
  Future<void> _generateDummy() async {
    final ruanganList = <RuanganModel>[];
    for (var i = 0; i < 20; i++) {
      final model = RuanganModel.create(
        nama: 'Ruangan ${i + 1}',
      );

      ruanganList.add(model);
    }

    await _supabase
        .from('ruangan')
        .insert(ruanganList.map((e) => e.toJson()).toList());
  }

  /// Get all data
  Future<List<RuanganModel>> gets() async {
    try {
      final response = await _supabase.from(tableName).select();

      log.d("response: $response");

      if (response.isEmpty) {
        return [];
      }

      final list = response.map((e) => RuanganModel.fromJson(e)).toList();

      _items.clear();

      _items.addAll(list);

      return list;
    } catch (e) {
      log.e(e);
    }

    return [];
  }

  /// Save or update data
  Future<void> save(RuanganModel model) async {
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
  Future<void> delete(RuanganModel model) async {
    try {
      await _supabase.from(tableName).delete().eq('id', model.id);

      _items.remove(model);
    } catch (e) {
      log.e(e);
      throw 'Gagal menghapus data';
    }
  }
}
