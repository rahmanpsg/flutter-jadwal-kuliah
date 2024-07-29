import 'dart:isolate';

import 'package:jadwal_kuliah/app/app.locator.dart';
import 'package:jadwal_kuliah/app/app.logger.dart';
import 'package:jadwal_kuliah/enums/semester_type.dart';
import 'package:jadwal_kuliah/models/jadwal_model.dart';
import 'package:jadwal_kuliah/models/program_studi_model.dart';
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

  List<ProgramStudiModel> get programStudiList => _programStudiService.items;

  ProgramStudiModel? _programStudi;
  ProgramStudiModel? get programStudi => _programStudi;

  set programStudi(ProgramStudiModel? value) {
    _programStudi = value;
    rebuildUi();
  }

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

  int _jumlahIterasi = 100;
  int get jumlahIterasi => _jumlahIterasi;

  set jumlahIterasi(int value) {
    _jumlahIterasi = value;
    rebuildUi();
  }

  Isolate? isolate;
  DateTime? startDateTime;

  List<JadwalModel> generateJadwalList = [];

  List<String> logs = [];

  final columns = [
    '#',
    'Hari',
    'Jam',
    'Matakuliah',
    'SKS',
    'Semester',
    'Kelas',
    'Dosen',
    'Ruangan',
  ];

  List<Map<String, dynamic>> get source => generateJadwalList
      .asMap()
      .entries
      .map(
        (entry) => {
          '#': entry.key + 1,
          'hari': entry.value.hari.hari,
          'jam': entry.value.jamMulaiDanSelesai,
          'matakuliah': entry.value.pengampuJadwal.matakuliah.nama,
          'sks': entry.value.pengampuJadwal.matakuliah.sks,
          'semester': entry.value.pengampuJadwal.matakuliah.semester,
          'kelas': entry.value.pengampuJadwal.kelas.kelas,
          'dosen': entry.value.pengampuJadwal.dosen.nama,
          'ruangan': entry.value.ruangan.nama,
        },
      )
      .toList();

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
    if (programStudi == null || semester == null || tahunAkademik == null) {
      final description = [
        if (programStudi == null) 'Program Studi belum dipilih',
        if (semester == null) 'Semester belum dipilih',
        if (tahunAkademik == null) 'Tahun Akademik belum dipilih',
      ].join('\n');

      _dialogService.showDialog(
        title: 'Informasi',
        description: description,
        dialogPlatform: DialogPlatform.Material,
      );
      return;
    }

    startDateTime = null;
    rebuildUi();
    await Future.delayed(const Duration(milliseconds: 100));

    setBusyForObject('onGenerate', true);

    try {
      startDateTime = DateTime.now();
      generateJadwalList.clear();
      logs.clear();

      final receivePort = ReceivePort();

      final response = _jadwalService.generate(
        GenerateJadwalRequest(
          isolate: isolate,
          receivePort: receivePort,
          programStudi: programStudi!,
          semester: semester!,
          tahunAkademik: tahunAkademik!,
          iterasi: jumlahIterasi,
        ),
      );

      response.listen((message) {
        if (message is String) logs.add(message.toString());

        if (message is List<JadwalModel>) {
          logs.add('Total jadwal: ${message.length}');
          logs.add('');

          log.d('Best jadwal: $message');

          generateJadwalList.addAll(message);

          isolate?.kill();

          receivePort.close();
        }

        rebuildUi();
      }, onDone: () {
        setBusyForObject('onGenerate', false);
      }, onError: (e) {
        log.e(e);
        logs.add(e.toString());
        setBusyForObject('onGenerate', false);
      });
    } catch (e) {
      _dialogService.showDialog(
        title: 'Gagal',
        description: e.toString(),
        dialogPlatform: DialogPlatform.Material,
      );
    }
  }

  @override
  void dispose() {
    isolate?.kill();
    super.dispose();
  }
}
