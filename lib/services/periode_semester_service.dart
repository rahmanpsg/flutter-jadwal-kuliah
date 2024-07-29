import 'package:jadwal_kuliah/app/app.logger.dart';
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
}

class PeriodeSemesterModel {
  final String id;
  final String type;
  final int startMonth;
  final int endMonth;

  PeriodeSemesterModel({
    required this.id,
    required this.type,
    required this.startMonth,
    required this.endMonth,
  });

  factory PeriodeSemesterModel.fromJson(Map<String, dynamic> json) {
    return PeriodeSemesterModel(
      id: json['id'],
      type: json['type'],
      startMonth: json['start_month'],
      endMonth: json['end_month'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'start_month': startMonth,
      'end_month': endMonth,
    };
  }
}
