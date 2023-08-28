import 'dart:isolate';

import 'package:jadwal_kuliah/app/app.locator.dart';
import 'package:jadwal_kuliah/app/app.logger.dart';
import 'package:jadwal_kuliah/enums/semester_type.dart';
import 'package:jadwal_kuliah/models/ant_slot_model.dart';
import 'package:jadwal_kuliah/models/program_studi_model.dart';
import 'package:jadwal_kuliah/services/jam_service.dart';
import 'package:jadwal_kuliah/services/pengampu_service.dart';
import 'package:jadwal_kuliah/services/ruangan_service.dart';

import 'ant_colony_service.dart';
import 'hari_service.dart';

class JadwalService {
  final log = getLogger('JadwalService');

  Stream<dynamic> generate(GenerateJadwalRequest request) async* {
    log.i('starting generate jadwal...');

    try {
      // generate jadwal menggunakan metode ant colony optimization

      // 1. ambil data pengampu
      yield 'Mengambil data pengampu...';

      final pengampuJadwalList = await locator<PengampuService>().getJadwal(
        programStudi: request.programStudi,
        semester: request.semester,
        tahunAkademik: request.tahunAkademik,
      );

      yield "Total pengampu: ${pengampuJadwalList.length}";

      if (pengampuJadwalList.isEmpty) {
        throw 'Tidak ada data pengampu yang sesuai dengan kriteria';
      }

      // 2. ambil data jam
      yield 'Mengambil data jam...';

      final jamList = await locator<JamService>().gets(getAktifOnly: true);

      yield "Total jam: ${jamList.length}";

      // 3. ambil data hari
      yield 'Mengambil data hari...';

      final hariList = await locator<HariService>().gets();

      yield "Total hari: ${hariList.length}";

      // 4. ambil data ruang
      yield 'Mengambil data ruangan...';

      final ruanganList = await locator<RuanganService>().gets();

      yield "Total ruangan: ${ruanganList.length}";

      // 5. inisialisasi data slot
      yield 'Menginisialisasi data slot...';

      final antSlotList = AntSlotModel.generate(
        hariList,
        jamList,
        ruanganList,
      );

      yield "Total slot: ${antSlotList.length}";

      // 6. inisialisasi semut
      final antColony = AntColonyService(
        pengampuJadwalList,
        antSlotList,
        maxIterations: request.iterasi,
      );

      // 7. mulai generate jadwal
      request.isolate = await Isolate.spawn(
        antColony.runACO,
        request.receivePort.sendPort,
      );

      // 8. kirim hasil generate jadwal ke main isolate
      yield* request.receivePort;

      // log.d("bestJadwal: \n$bestJadwal");
    } on String catch (_) {
      rethrow;
    } catch (e) {
      log.e(e);
      throw 'Gagal generate jadwal';
    }
  }
}

class GenerateJadwalRequest {
  Isolate? isolate;
  final ReceivePort receivePort;
  final ProgramStudiModel programStudi;
  final SemesterType semester;
  final String tahunAkademik;
  final int iterasi;

  GenerateJadwalRequest({
    required this.isolate,
    required this.receivePort,
    required this.programStudi,
    required this.semester,
    required this.tahunAkademik,
    required this.iterasi,
  });
}
