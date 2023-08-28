import 'package:flutter/material.dart';
import 'package:jadwal_kuliah/app/app.locator.dart';
import 'package:jadwal_kuliah/app/app.logger.dart';
import 'package:jadwal_kuliah/models/dosen_model.dart';
import 'package:jadwal_kuliah/models/kelas_model.dart';
import 'package:jadwal_kuliah/models/matakuliah_model.dart';
import 'package:jadwal_kuliah/models/pengampu_model.dart';
import 'package:jadwal_kuliah/services/dosen_service.dart';
import 'package:jadwal_kuliah/services/kelas_service.dart';
import 'package:jadwal_kuliah/services/matakuliah_service.dart';
import 'package:jadwal_kuliah/services/program_studi_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:uuid/uuid.dart';

class PengampuFormDialogModel extends BaseViewModel {
  final log = getLogger('PengampuFormDialogModel');

  final _router = locator<RouterService>();
  final _matakuliahService = locator<MatakuliahService>();
  final _dosenService = locator<DosenService>();
  final _kelasService = locator<KelasService>();
  final _programStudiService = locator<ProgramStudiService>();

  final now = DateTime.now().subtract(const Duration(days: 365 * 4));

  List<String> get tahunAkademikList => List.generate(
        5,
        (index) => '${now.year + index} - ${now.year + index + 1}',
      ).reversed.toList();

  List<MatakuliahModel> get matakuliahList => _matakuliahService.items;

  List<DosenModel> get dosenList => _dosenService.items;

  List<KelasModel> get _kelasList => _kelasService.items;

  List<KelasModel> get kelasList => _kelasList
      .where((element) =>
          element.idProgramStudi == matakuliah?.idProgramStudi &&
          element.semester == matakuliah?.semester)
      .toList();

  final formKey = GlobalKey<FormState>();

  String? _tahunAkademik;
  String? get tahunAkademik => _tahunAkademik;

  MatakuliahModel? _matakuliah;
  MatakuliahModel? get matakuliah => _matakuliah;

  DosenModel? _dosen;
  DosenModel? get dosen => _dosen;

  final _kelas = <String>[];
  List<String> get kelas => _kelas;

  PengampuModel? _pengampu;

  String programStudiName(String id) {
    return _programStudiService.getById(id)?.nama ?? '';
  }

  void init(PengampuModel? pengampu) async {
    setBusy(true);

    await _matakuliahService.syncData();
    await _dosenService.syncData();
    await _kelasService.syncData();

    if (pengampu != null) {
      _pengampu = pengampu;
      _tahunAkademik = pengampu.tahunAkademik;
      _matakuliah = _matakuliahService.getById(pengampu.idMatakuliah);
      _dosen = _dosenService.getById(pengampu.idDosen);
      _kelas.addAll(pengampu.kelas.map((e) => e.kelas));
    }

    setBusy(false);
  }

  set tahunAkademik(String? value) {
    _tahunAkademik = value;
    rebuildUi();
  }

  set matakuliah(MatakuliahModel? value) {
    _matakuliah = value;
    _kelas.clear();
    rebuildUi();
  }

  set dosen(DosenModel? value) {
    _dosen = value;
    rebuildUi();
  }

  void onKelasSelected(String value, bool selected) {
    if (selected) {
      _kelas.add(value);

      setErrorForObject('kelas', null);
    } else {
      _kelas.remove(value);
    }
    rebuildUi();
  }

  void onSubmit() {
    if (formKey.currentState?.validate() != true) return;

    if (_kelas.isEmpty) {
      setErrorForObject('kelas', 'Kelas tidak boleh kosong');
      return;
    }

    log.d("tahun akademik: $tahunAkademik");
    log.d("matakuliah: $matakuliah");
    log.d("dosen: $dosen");
    log.d("kelas: $kelas");

    late PengampuModel pengampu;

    if (_pengampu == null) {
      final id = const Uuid().v4();

      pengampu = PengampuModel(
        id: id,
        idMatakuliah: matakuliah!.id,
        idDosen: dosen!.id,
        tahunAkademik: tahunAkademik!,
        kelas: kelas
            .map(
              (kelas) => PengampuKelasModel.create(
                idPengampu: id,
                idKelas: kelasList
                    .firstWhere((element) => element.nama.contains(kelas))
                    .id,
                kelas: kelas,
              ),
            )
            .toList(),
      );
    } else {
      pengampu = _pengampu!.copyWith(
        idMatakuliah: matakuliah!.id,
        idDosen: dosen!.id,
        tahunAkademik: tahunAkademik!,
        kelas: kelas
            .map(
              (kelas) => PengampuKelasModel.create(
                idPengampu: _pengampu!.id,
                idKelas: kelasList
                    .firstWhere((element) => element.nama.contains(kelas))
                    .id,
                kelas: kelas,
              ),
            )
            .toList(),
      );
    }

    log.d(pengampu);

    _router.pop(
      DialogResponse(
        confirmed: true,
        data: pengampu,
      ),
    );
  }
}
