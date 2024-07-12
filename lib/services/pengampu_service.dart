import 'dart:math';

import 'package:jadwal_kuliah/app/app.locator.dart';
import 'package:jadwal_kuliah/app/app.logger.dart';
import 'package:jadwal_kuliah/enums/semester_type.dart';
import 'package:jadwal_kuliah/models/pengampu_jadwal_model.dart';
import 'package:jadwal_kuliah/models/pengampu_model.dart';
import 'package:jadwal_kuliah/models/program_studi_model.dart';
import 'package:jadwal_kuliah/services/dosen_service.dart';
import 'package:jadwal_kuliah/services/matakuliah_service.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

import 'kelas_service.dart';

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

  // generate dummy
  Future<void> generateDummy() async {
    final pengampuList = <PengampuModel>[];

    const idProgramStudi = '15deb00c-d7ee-4a96-8108-a7c44e3d6765';

    final listMatakuliah = locator<MatakuliahService>()
        .items
        .where((e) => e.idProgramStudi == idProgramStudi && !e.semester.isEven);

    final listDosen = locator<DosenService>().items;

    final listKelas = locator<KelasService>()
        .items
        .where((e) => e.idProgramStudi == idProgramStudi);

    for (var matakuliah in listMatakuliah) {
      final randomDosen = listDosen[Random().nextInt(listDosen.length)];

      final idPengampu = const Uuid().v4();

      final kelas = <PengampuKelasModel>[];

      final listKelasSemester =
          listKelas.where((e) => e.semester == matakuliah.semester).toList();

      if (listKelasSemester.isEmpty) continue;

      for (var kelasSemester in listKelasSemester) {
        for (var i = 0; i < kelasSemester.nama.length; i++) {
          final nama = kelasSemester.nama[i];

          kelas.add(
            PengampuKelasModel.create(
              idKelas: kelasSemester.id,
              idPengampu: idPengampu,
              kelas: nama,
            ),
          );
        }
      }

      final model = PengampuModel(
        id: idPengampu,
        tahunAkademik: '2023 - 2024',
        idMatakuliah: matakuliah.id,
        idDosen: randomDosen.id,
        kelas: kelas,
      );

      pengampuList.add(model);
    }
    await _supabase
        .from('pengampu')
        .insert(pengampuList.map((e) => e.toJson()).toList());

    await _supabase.from('pengampu_kelas').insert(pengampuList
        .expand((element) => element.kelas)
        .map((e) => e.toJson())
        .toList());
  }

  /// Get all data
  Future<List<PengampuModel>> gets() async {
    try {
      final response = await _supabase
          .from(tableName)
          .select(
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
    required ProgramStudiModel programStudi,
    required SemesterType semester,
    required String tahunAkademik,
  }) async {
    try {
      log.wtf(programStudi);
      log.wtf("semester: ${semester.gets()}");
      log.wtf("tahunAkademik: $tahunAkademik");

      // final response = await _supabase
      //     .from('pengampu_kelas')
      //     .select(
      //       '*, kelas_jenis:id_kelas(jenis), pengampu:id_pengampu(id, tahun_akademik, matakuliah:id_matakuliah(*), dosen:id_dosen(*))',
      //     )
      //     .not('pengampu', 'is', null)
      //     .not('pengampu.matakuliah', 'is', null)
      //     .in_('pengampu.matakuliah.semester', semester.gets())
      //     .eq('pengampu.tahun_akademik', tahunAkademik)
      //     .eq('pengampu.matakuliah.id_program_studi', programStudi.id);

      final response = await _supabase.rpc('get_pengampu_kelas', params: {
        'program_studi_id_value': programStudi.id,
        'semester_values': semester.gets(),
        'tahun_akademik_value': tahunAkademik,
      });

      if (response == null) return [];

      log.d("response: ${response}");

      if (response.isEmpty) return [];

      final list = <PengampuJadwalModel>[];

      for (final json in response) {
        try {
          // log.d('json: $json');
          final kelas = PengampuKelasModel.fromJson(json);

          final newJson = json['pengampu'] as Map<String, dynamic>;

          newJson['kelas'] = kelas.toJson();
          newJson['kelas_type'] = json['kelas_jenis']['jenis'] as int;

          final pengampuJadwal = PengampuJadwalModel.fromJson(newJson);

          list.add(pengampuJadwal);
        } catch (e) {
          log.wtf('json: $json');
          log.e(e);
        }
      }

      return list;
    } catch (e) {
      log.e(e);
    }

    return [];
  }

  Future<List<String>> getTahunAkademik() async {
    try {
      final response = await _supabase.from('distinct_tahun_akademik').select();

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
