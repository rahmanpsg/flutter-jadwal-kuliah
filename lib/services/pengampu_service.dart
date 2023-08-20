import 'package:jadwal_kuliah/app/app.logger.dart';
import 'package:jadwal_kuliah/enums/semester_type.dart';
import 'package:jadwal_kuliah/models/pengampu_jadwal_model.dart';
import 'package:jadwal_kuliah/models/pengampu_model.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PengampuService with ListenableServiceMixin {
  PengampuService() {
    listenToReactiveValues([items]);
  }

  final log = getLogger('PengampuService');

  static const String tableName = 'pengampu';
  final _supabase = Supabase.instance.client;

  final _items = ReactiveList<PengampuModel>();

  /// List of all data
  List<PengampuModel> get items => _items.toSet().toList();

  bool _isSync = false;

  Future<void> syncData() async {
    if (_isSync) return;

    await gets();

    _isSync = true;
  }

  /// Get all data
  Future<List<PengampuModel>> gets() async {
    try {
      final response = await _supabase
          .from(tableName)
          .select<PostgrestList>(
            '*, kelas:pengampu_kelas(*)',
          )
          .order('tahun_akademik', ascending: true)
          .order('id_matakuliah', ascending: true)
          .order('id_dosen', ascending: true);

      log.d("response: $response");

      if (response.isEmpty) {
        return [];
      }

      final list =
          response.map((json) => PengampuModel.fromJson(json)).toList();

      _items.clear();

      _items.addAll(list);

      return list;
    } catch (e) {
      log.e(e);
    }

    return [];
  }

  /// Get data by semester and tahun akademik
  Future<List<PengampuJadwalModel>> getJadwal({
    required SemesterType semester,
    required String tahunAkademik,
  }) async {
    try {
      final response = await _supabase
          .from('pengampu_kelas')
          .select(
            '*, kelas_jenis:id_kelas(jenis), pengampu:id_pengampu(id, tahun_akademik, tahun_akademik, matakuliah:id_matakuliah(*), dosen:id_dosen(*)) ',
          )
          .not('pengampu', 'is', null)
          .in_('pengampu.matakuliah.semester', semester.gets())
          .eq('pengampu.tahun_akademik', tahunAkademik);

      log.d("response: $response");

      if (response.isEmpty) return [];

      final list = <PengampuJadwalModel>[];

      for (final json in response) {
        final kelas = PengampuKelasModel.fromJson(json);

        final newJson = json['pengampu'] as Map<String, dynamic>;

        newJson['kelas'] = kelas.toJson();
        newJson['kelas_type'] = json['kelas_jenis']['jenis'] as int;

        final pengampuJadwal = PengampuJadwalModel.fromJson(newJson);

        list.add(pengampuJadwal);
      }

      return list;
    } catch (e) {
      log.e(e);
    }

    return [];
  }

  Future<List<String>> getTahunAkademik() async {
    try {
      final response = await _supabase
          .from('distinct_tahun_akademik')
          .select<PostgrestList>();

      log.d("response: $response");

      if (response.isEmpty) {
        return [];
      }

      final list = response.map((e) => e['tahun_akademik'] as String).toList();

      return list;
    } catch (e) {
      log.e(e);
    }

    return [];
  }

  /// Save or update data
  Future<void> save(PengampuModel model) async {
    try {
      await _supabase.from(tableName).upsert(model.toJson());

      await _supabase
          .from('pengampu_kelas')
          .delete()
          .eq('id_pengampu', model.id);

      await _supabase
          .from('pengampu_kelas')
          .upsert(model.kelas.map((kelas) => kelas.toJson()).toList());

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
  Future<void> delete(PengampuModel model) async {
    try {
      await _supabase.from(tableName).delete().eq('id', model.id);

      _items.remove(model);
    } catch (e) {
      log.e(e);
      throw 'Gagal menghapus data';
    }
  }
}
