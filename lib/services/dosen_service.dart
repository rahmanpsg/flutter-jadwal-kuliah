import 'package:collection/collection.dart';
import 'package:jadwal_kuliah/app/app.logger.dart';
import 'package:jadwal_kuliah/models/dosen_model.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DosenService with ListenableServiceMixin {
  DosenService() {
    listenToReactiveValues([items]);
  }

  final log = getLogger('DosenService');

  static const String tableName = 'dosen';
  final _supabase = Supabase.instance.client;

  final _items = ReactiveList<DosenModel>();

  /// List of all data
  List<DosenModel> get items => _items.toSet().toList();

  bool _isSync = false;

  Future<void> syncData() async {
    if (_isSync) return;

    await gets();

    // await _generateDummy();

    _isSync = true;
  }

  Future<void> _generateDummy() async {
    final dosenList = <DosenModel>[];
    for (var i = 0; i < 100; i++) {
      final model = DosenModel.create(
        nbm: '${i + 1}',
        nama: 'Dosen ${i + 1}',
      );

      dosenList.add(model);
    }

    await _supabase
        .from('dosen')
        .insert(dosenList.map((e) => e.toJson()).toList());
  }

  /// Get data by id
  DosenModel? getById(String id) {
    return _items.firstWhereOrNull((element) => element.id == id);
  }

  /// Get all data
  Future<List<DosenModel>> gets() async {
    try {
      final response = await _supabase.from(tableName).select();

      log.d("response: $response");

      if (response.isEmpty) {
        return [];
      }

      final list = response.map((e) => DosenModel.fromJson(e)).toList();

      _items.clear();

      _items.addAll(list);

      return list;
    } catch (e) {
      log.e(e);
    }

    return [];
  }

  /// Save or update data
  Future<void> save(DosenModel model) async {
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
  Future<void> delete(DosenModel model) async {
    try {
      await _supabase.from(tableName).delete().eq('id', model.id);

      _items.remove(model);
    } catch (e) {
      log.e(e);
      throw 'Gagal menghapus data';
    }
  }
}
