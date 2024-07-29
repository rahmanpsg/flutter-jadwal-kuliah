import 'package:jadwal_kuliah/app/app.logger.dart';
import 'package:jadwal_kuliah/enums/periode_semester_type.dart';
import 'package:jadwal_kuliah/models/periode_semester_model.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PeriodeSemesterService with ListenableServiceMixin {
  PeriodeSemesterService() {
    listenToReactiveValues([items]);
  }

  final log = getLogger('PeriodeSemesterService');

  static const String tableName = 'periode_semester';
  final _supabase = Supabase.instance.client;

  final _items = ReactiveList<PeriodeSemesterModel>();

  List<PeriodeSemesterModel> get items => _items.toSet().toList();

  bool _isSync = false;

  Future<void> syncData() async {
    if (_isSync) return;

    await gets();

    _isSync = true;
  }

  Future<List<PeriodeSemesterModel>> gets() async {
    try {
      final response = await _supabase
          .from(tableName)
          .select()
          .order('start_month', ascending: true);

      log.d("response: $response");

      if (response.isEmpty) {
        return [];
      }

      final list =
          response.map((e) => PeriodeSemesterModel.fromJson(e)).toList();

      _items.clear();
      _items.addAll(list);

      return list;
    } catch (e) {
      log.e(e);
    }

    return [];
  }

  Future<void> save(PeriodeSemesterModel model) async {
    try {
      await _supabase.from(tableName).upsert(model.toJson());

      final index = _items.indexWhere((element) => element.type == model.type);

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
}
