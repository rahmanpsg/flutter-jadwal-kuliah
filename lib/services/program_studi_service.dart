import 'package:jadwal_kuliah/app/app.logger.dart';
import 'package:jadwal_kuliah/models/program_studi_model.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProgramStudiService with ListenableServiceMixin {
  ProgramStudiService() {
    listenToReactiveValues([items]);
  }

  final log = getLogger('ProgramStudiService');

  static const String tableName = 'program_studi';
  final _supabase = Supabase.instance.client;

  final _items = ReactiveList<ProgramStudiModel>();

  /// List of all data
  List<ProgramStudiModel> get items => _items.toSet().toList();

  Future<void> syncData() async {
    await gets();
  }

  /// Get all data
  Future<List<ProgramStudiModel>> gets() async {
    try {
      final response = await _supabase
          .from(tableName)
          .select<PostgrestList>('*, id_fakultas:id_fakultas(*)');

      log.d("response: $response");

      if (response.isEmpty) {
        return [];
      }

      final list = response.map((e) => ProgramStudiModel.fromJson(e)).toList();

      _items.clear();

      _items.addAll(list);

      return list;
    } catch (e) {
      log.e(e);
    }

    return [];
  }

  /// Save or update data
  Future<void> save(ProgramStudiModel model) async {
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
  Future<void> delete(ProgramStudiModel model) async {
    try {
      await _supabase.from(tableName).delete().eq('id', model.id);

      _items.remove(model);
    } catch (e) {
      log.e(e);
      throw 'Gagal menghapus data';
    }
  }
}
