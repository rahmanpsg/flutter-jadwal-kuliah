import 'package:jadwal_kuliah/app/app.logger.dart';
import 'package:jadwal_kuliah/enums/periode_semester_type.dart';
import 'package:jadwal_kuliah/models/periode_semester_model.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PeriodeSemesterService with ListenableServiceMixin {
  PeriodeSemesterService() {
    listenToReactiveValues([_ganjil, _genap]);
  }

  final log = getLogger('PeriodeSemesterService');

  static const String tableName = 'periode_semester';
  final _supabase = Supabase.instance.client;

  final ReactiveValue<PeriodeSemesterModel?> _ganjil = ReactiveValue<PeriodeSemesterModel?>(null);
  final ReactiveValue<PeriodeSemesterModel?> _genap = ReactiveValue<PeriodeSemesterModel?>(null);

  PeriodeSemesterModel? get ganjil => _ganjil.value;
  PeriodeSemesterModel? get genap => _genap.value;

  bool _isSync = false;

  Future<void> syncData() async {
    if (_isSync) return;

    await fetchData();

    _isSync = true;
  }

  Future<void> fetchData() async {
    try {
      final response = await _supabase.from(tableName).select();

      log.d("response: $response");

      if (response.isEmpty) {
        _ganjil.value = null;
        _genap.value = null;
        return;
      }

      for (var item in response) {
        final model = PeriodeSemesterModel.fromJson(item);
        if (model.type == PeriodeSemesterType.ganjil) {
          _ganjil.value = model;
        } else if (model.type == PeriodeSemesterType.genap) {
          _genap.value = model;
        }
      }
    } catch (e) {
      log.e(e);
    }
  }

  Future<void> save(PeriodeSemesterModel model) async {
    try {
      await _supabase.from(tableName).upsert(model.toJson());

      if (model.type == PeriodeSemesterType.ganjil) {
        _ganjil.value = model;
      } else if (model.type == PeriodeSemesterType.genap) {
        _genap.value = model;
      }
    } catch (e) {
      log.e(e);
      throw 'Gagal menyimpan data';
    }
  }
}
