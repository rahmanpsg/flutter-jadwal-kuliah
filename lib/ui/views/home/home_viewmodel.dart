import 'package:jadwal_kuliah/app/app.locator.dart';
import 'package:jadwal_kuliah/app/app.logger.dart';
import 'package:jadwal_kuliah/enums/semester_type.dart';
import 'package:jadwal_kuliah/services/dosen_service.dart';
import 'package:jadwal_kuliah/services/fakultas_service.dart';
import 'package:jadwal_kuliah/services/jadwal_service.dart';
import 'package:jadwal_kuliah/services/kelas_service.dart';
import 'package:jadwal_kuliah/services/matakuliah_service.dart';
import 'package:jadwal_kuliah/services/pengampu_service.dart';
import 'package:jadwal_kuliah/services/program_studi_service.dart';
import 'package:jadwal_kuliah/services/ruangan_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final log = getLogger('HomeViewModel');

  final _dialogService = locator<DialogService>();
  final _fakultasService = locator<FakultasService>();
  final _programStudiService = locator<ProgramStudiService>();
  final _dosenService = locator<DosenService>();
  final _matakuliahService = locator<MatakuliahService>();
  final _ruanganService = locator<RuanganService>();
  final _kelasService = locator<KelasService>();
  final _pengampuService = locator<PengampuService>();
  final _jadwalService = locator<JadwalService>();

  int get totalFakultas => _fakultasService.items.length;
  int get totalProgramStudi => _programStudiService.items.length;
  int get totalDosen => _dosenService.items.length;
  int get totalMatakuliah => _matakuliahService.items.length;
  int get totalRuangan => _ruanganService.items.length;
  int get totalKelas => _kelasService.items.length;

  SemesterType? _semester;
  SemesterType? get semester => _semester;

  set semester(SemesterType? value) {
    _semester = value;
    rebuildUi();
  }

  String? _tahunAkademik;
  String? get tahunAkademik => _tahunAkademik;

  set tahunAkademik(String? value) {
    _tahunAkademik = value;
    rebuildUi();
  }

  bool get isButtonGenerateEnabled => semester != null && tahunAkademik != null;

  void init() async {
    setBusy(true);

    await Future.wait([
      _fakultasService.syncData(),
      _programStudiService.syncData(),
      _dosenService.syncData(),
      _matakuliahService.syncData(),
      _ruanganService.syncData(),
      _kelasService.syncData(),
    ]);

    setBusy(false);
  }

  Future<List<String>> getTahunAkademik() async {
    return _pengampuService.getTahunAkademik();
  }

  void onGenerate() async {
    setBusyForObject('onGenerate', true);

    try {
      await _jadwalService.generate(
        semester: semester!,
        tahunAkademik: tahunAkademik!,
      );
    } catch (e) {
      _dialogService.showDialog(
        title: 'Gagal',
        description: e.toString(),
        dialogPlatform: DialogPlatform.Material,
      );
    }

    setBusyForObject('onGenerate', false);
  }
}
