import 'package:jadwal_kuliah/app/app.locator.dart';
import 'package:jadwal_kuliah/app/app.logger.dart';
import 'package:jadwal_kuliah/services/dosen_service.dart';
import 'package:jadwal_kuliah/services/fakultas_service.dart';
import 'package:jadwal_kuliah/services/kelas_service.dart';
import 'package:jadwal_kuliah/services/matakuliah_service.dart';
import 'package:jadwal_kuliah/services/program_studi_service.dart';
import 'package:jadwal_kuliah/services/ruangan_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final log = getLogger('HomeViewModel');

  final _fakultasService = locator<FakultasService>();
  final _programStudiService = locator<ProgramStudiService>();
  final _dosenService = locator<DosenService>();
  final _matakuliahService = locator<MatakuliahService>();
  final _ruanganService = locator<RuanganService>();
  final _kelasService = locator<KelasService>();

  int get totalFakultas => _fakultasService.items.length;
  int get totalProgramStudi => _programStudiService.items.length;
  int get totalDosen => _dosenService.items.length;
  int get totalMatakuliah => _matakuliahService.items.length;
  int get totalRuangan => _ruanganService.items.length;
  int get totalKelas => _kelasService.items.length;

  void init() async {
    setBusy(true);

    await Future.wait([
      _fakultasService.syncData(),
      _programStudiService.syncData(),
      _dosenService.syncData(),
      _matakuliahService.syncData(),
      _ruanganService.syncData(),
    ]);

    setBusy(false);
  }
}
