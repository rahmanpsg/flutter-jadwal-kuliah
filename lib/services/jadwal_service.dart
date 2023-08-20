import 'package:jadwal_kuliah/app/app.locator.dart';
import 'package:jadwal_kuliah/app/app.logger.dart';
import 'package:jadwal_kuliah/enums/semester_type.dart';
import 'package:jadwal_kuliah/models/ant_slot_model.dart';
import 'package:jadwal_kuliah/services/jam_service.dart';
import 'package:jadwal_kuliah/services/pengampu_service.dart';
import 'package:jadwal_kuliah/services/ruangan_service.dart';

import 'ant_colony_service.dart';
import 'hari_service.dart';

class JadwalService {
  final log = getLogger('JadwalService');

  Future<void> generate({
    required SemesterType semester,
    required String tahunAkademik,
  }) async {
    log.i('starting generate jadwal...');

    try {
      // generate jadwal menggunakan metode ant colony optimization

      // 1. ambil data pengampu
      final pengampuJadwalList = await locator<PengampuService>().getJadwal(
        semester: semester,
        tahunAkademik: tahunAkademik,
      );

      if (pengampuJadwalList.isEmpty) {
        throw 'Tidak ada data pengampu yang sesuai dengan kriteria';
      }

      // 2. ambil data jam
      final jamList = await locator<JamService>().gets(getAktifOnly: true);

      // 3. ambil data hari
      final hariList = await locator<HariService>().gets();

      // 4. ambil data ruang
      final ruanganList = await locator<RuanganService>().gets();

      // 5. inisialisasi data slot
      final antSlotList = AntSlotModel.generate(
        hariList,
        jamList,
        ruanganList,
      );

      log.d("Total pengampu: ${pengampuJadwalList.length}");
      log.d("Total jam: ${jamList.length}");
      log.d("Total hari: ${hariList.length}");
      log.d("Total slot: ${antSlotList.length}");
      log.d("Total ruangan: ${ruanganList.length}");

      // 6. inisialisasi semut
      final antColony = AntColonyService(
        pengampuJadwalList,
        antSlotList,
      );

      // 7. mulai generate jadwal
      final bestJadwal = antColony.runACO();

      log.d("bestJadwal: \n$bestJadwal");
    } on String catch (_) {
      rethrow;
    } catch (e) {
      throw 'Gagal generate jadwal';
    }
  }
}
