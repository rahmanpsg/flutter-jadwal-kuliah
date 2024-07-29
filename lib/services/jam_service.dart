import 'package:flutter/material.dart';
import 'package:jadwal_kuliah/app/app.logger.dart';
import 'package:jadwal_kuliah/extensions/time_of_day_extension.dart';
import 'package:jadwal_kuliah/models/jam_model.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class JamService with ListenableServiceMixin {
  JamService() {
    listenToReactiveValues([items]);
  }

  final log = getLogger('JamService');

  static const String tableName = 'jam';
  final _supabase = Supabase.instance.client;

  final _items = ReactiveList<JamModel>();

  /// List of all data
  List<JamModel> get items => _items.toSet().toList();

  bool _isSync = false;

  Future<void> syncData() async {
    if (_isSync) return;

    await gets();

    _isSync = true;
  }

  /// Get all data
  Future<List<JamModel>> gets({
    bool getAktifOnly = false,
  }) async {
    try {
      final response = await _supabase
          .from(tableName)
          .select()
          .order('mulai', ascending: true);

      log.d("response: $response");

      if (response.isEmpty) {
        return [];
      }

      final list = response.map((e) => JamModel.fromJson(e)).toList();

      _items.clear();

      _items.addAll(list);

      if (getAktifOnly) {
        return list.where((element) => element.aktif).toList();
      }

      return list;
    } catch (e) {
      log.e(e);
    }

    return [];
  }

  Future<void> generateJam({
    required TimeOfDay start,
    required TimeOfDay end,
    required Duration duration,
  }) async {
    try {
      _items.clear();

      final list = <JamModel>[];

      var time = start;

      while (time.isBefore(end)) {
        final mulai = time;
        final selesai = time.add(duration);

        list.add(JamModel.create(
          mulai: mulai,
          selesai: selesai,
          aktif: true,
        ));

        time = time.add(duration);
      }

      // clear all data
      await _supabase.rpc('delete_jam');

      await _supabase
          .from(tableName)
          .upsert(list.map((e) => e.toJson()).toList());

      _items.addAll(list);
    } catch (e) {
      log.e(e);
    }
  }

  /// Save or update data
  Future<void> save(JamModel model) async {
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
