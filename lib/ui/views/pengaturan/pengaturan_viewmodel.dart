// ignore_for_file: use_build_context_synchronously

import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:jadwal_kuliah/app/app.bottomsheets.dart';
import 'package:jadwal_kuliah/app/app.dialogs.dart';
import 'package:jadwal_kuliah/app/app.locator.dart';
import 'package:jadwal_kuliah/app/app.logger.dart';
import 'package:jadwal_kuliah/enums/kelas_type.dart';
import 'package:jadwal_kuliah/enums/periode_semester_type.dart';
import 'package:jadwal_kuliah/extensions/time_of_day_extension.dart';
import 'package:jadwal_kuliah/models/hari_model.dart';
import 'package:jadwal_kuliah/models/item_model.dart';
import 'package:jadwal_kuliah/models/jam_model.dart';
import 'package:jadwal_kuliah/models/periode_semester_model.dart';
import 'package:jadwal_kuliah/services/hari_service.dart';
import 'package:jadwal_kuliah/services/jam_service.dart';
import 'package:jadwal_kuliah/services/periode_semester_service.dart';
import 'package:jadwal_kuliah/ui/bottom_sheets/month_range_picker/month_range_picker_sheet.dart';
import 'package:jadwal_kuliah/ui/dialogs/form/form_dialog.dart';
import 'package:jadwal_kuliah/utils/datetime.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PengaturanViewModel extends ReactiveViewModel {
  final log = getLogger('PengaturanViewModel');

  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _periodSemesterService = locator<PeriodeSemesterService>();
  final _hariService = locator<HariService>();
  final _jamService = locator<JamService>();

  PeriodeSemesterModel? get ganjil => _periodSemesterService.ganjil;
  PeriodeSemesterModel? get genap => _periodSemesterService.genap;

  final hariColumns = [
    '#',
    'Hari',
    'Kelas',
    'Aksi',
  ];

  final jamColumns = [
    '#',
    'Jam',
    'Keterangan',
    'Aksi',
  ];

  List<HariModel> get _hariItems => _hariService.items;

  List<HariModel> get hariItems => _hariItems;

  List<JamModel> get _jamItems => _jamService.items;

  List<JamModel> get jamItems => _jamItems;

  void init() async {
    setBusyForObject('hari', true);
    setBusyForObject('jam', true);

    await Future.wait(
      [
        _periodSemesterService.syncData(),
        _hariService.syncData(),
        _jamService.syncData(),
      ],
    );

    setBusyForObject('hari', false);
    setBusyForObject('jam', false);
  }

  void onSelectSemester(PeriodeSemesterType type) async {
    final currentModel = type == PeriodeSemesterType.ganjil ? ganjil : genap;
    final response = await _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.monthRangePicker,
        data: MonthRangePickerSheetData(
          startMonth: currentModel?.startMonth ??
              (type == PeriodeSemesterType.ganjil ? 8 : 2),
          endMonth: currentModel?.endMonth ??
              (type == PeriodeSemesterType.ganjil ? 1 : 7),
        ));

    if (response?.confirmed == false) return;

    log.i(response?.data);

    final newModel = PeriodeSemesterModel(
      type: type,
      startMonth: response?.data['startMonth'],
      endMonth: response?.data['endMonth'],
    );

    await _periodSemesterService.save(newModel);
  }

  void onAddHari() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.form,
      title: 'Tambah Data Hari',
      description: 'Silahkan isi data-data berikut',
      data: FormDialogData(
        formDialogItems: [
          FormDialogItem(
            label: 'Hari',
          ),
          FormDialogItem(
            label: 'Kelas',
            isChipChoice: true,
            chipItems: const [
              ItemModel(label: 'Reguler', value: KelasType.reguler),
              ItemModel(label: 'Non Reguler', value: KelasType.nonReguler),
            ],
          ),
        ],
      ),
    );

    if (response?.confirmed == false) return;

    log.i(response?.data);

    final hari = HariModel.create(
      hari: response?.data['Hari'],
      kelas: (response?.data['Kelas'] as List).cast<KelasType>(),
    );

    log.d("Hari: $hari");

    setBusyForObject('hari', true);

    try {
      await _hariService.save(hari);
    } catch (e) {
      log.e(e);

      _dialogService.showDialog(
        title: 'Error',
        description: e.toString(),
        dialogPlatform: DialogPlatform.Material,
      );
    }

    setBusyForObject('hari', false);
  }

  void onAddJam() async {
    final context = StackedService.navigatorKey!.currentState!.context;

    final jamMulaiController = TextEditingController();
    final jamSelesaiController = TextEditingController();
    final durasiPerSksController = TextEditingController();

    final response = await _dialogService.showCustomDialog(
      variant: DialogType.form,
      title: 'Generate Data Jam',
      description:
          'Silahkan isi data-data berikut.\nSemua data sebelumnya akan dihapus dan digenerate ulang.',
      data: FormDialogData(
        formDialogItems: [
          FormDialogItem(
            controller: jamMulaiController,
            label: 'Jam Mulai',
            onTap: () async {
              final response = await DateTimeUtils.selectTime(context);

              if (response == null) return;

              log.d("response: $response");

              if (jamSelesaiController.text.isNotEmpty) {
                final selesai =
                    TimeOfDayExtension.fromString(jamSelesaiController.text);

                log.d("selesai: $selesai");

                if (selesai.isBefore(response)) {
                  _dialogService.showDialog(
                    title: 'Error',
                    description: 'Jam mulai tidak boleh setelah jam selesai',
                    dialogPlatform: DialogPlatform.Material,
                  );
                  return;
                }
              }

              jamMulaiController.text =
                  DateTimeUtils.timeOfDayToString(response);
            },
          ),
          FormDialogItem(
            controller: jamSelesaiController,
            label: 'Jam Selesai',
            onTap: () async {
              final response = await DateTimeUtils.selectTime(context);

              if (response == null) return;

              log.d("response: $response");

              if (jamMulaiController.text.isNotEmpty) {
                final mulai =
                    TimeOfDayExtension.fromString(jamMulaiController.text);

                log.d("mulai: $mulai");

                if (response.isBefore(mulai)) {
                  _dialogService.showDialog(
                    title: 'Error',
                    description: 'Jam selesai tidak boleh sebelum jam mulai',
                    dialogPlatform: DialogPlatform.Material,
                  );
                  return;
                }
              }

              jamSelesaiController.text =
                  DateTimeUtils.timeOfDayToString(response);
            },
          ),
          FormDialogItem(
              controller: durasiPerSksController,
              label: 'Durasi Per SKS',
              onTap: () async {
                var response = await showDurationPicker(
                  context: context,
                  initialTime: const Duration(minutes: 30),
                  decoration: BoxDecoration(
                    color: Theme.of(context).dialogBackgroundColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                );

                if (response == null) return;

                log.d("response: $response");

                durasiPerSksController.text =
                    DateTimeUtils.durationToString(response);
              }),
        ],
      ),
    );

    if (response?.confirmed == false) return;

    log.i(response?.data);

    final start = TimeOfDayExtension.fromString(jamMulaiController.text);
    final end = TimeOfDayExtension.fromString(jamSelesaiController.text);

    final duration =
        DateTimeUtils.stringToDuration(durasiPerSksController.text);

    log.d("jamMulai: $start");
    log.d("jamSelesai: $end");
    log.d("durasiPerSks: $duration");

    setBusyForObject('jam', true);

    try {
      await _jamService.generateJam(
        start: start,
        end: end,
        duration: duration,
      );
    } catch (e) {
      log.e(e);

      _dialogService.showDialog(
        title: 'Error',
        description: e.toString(),
        dialogPlatform: DialogPlatform.Material,
      );
    }

    setBusyForObject('jam', false);
  }

  void onEditHari(HariModel value) async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.form,
      title: 'Ubah Data Hari',
      description: 'Silahkan isi data-data berikut',
      data: FormDialogData(
        formDialogItems: [
          FormDialogItem(
            controller: TextEditingController(text: value.hari),
            label: 'Hari',
          ),
          FormDialogItem(
            label: 'Kelas',
            isChipChoice: true,
            chipItems: [
              ItemModel(
                label: 'Reguler',
                value: KelasType.reguler,
                isSelected: value.kelas.contains(KelasType.reguler),
              ),
              ItemModel(
                label: 'Non Reguler',
                value: KelasType.nonReguler,
                isSelected: value.kelas.contains(KelasType.nonReguler),
              ),
            ],
          ),
        ],
      ),
    );

    if (response?.confirmed == false) return;

    log.i(response?.data);

    final hari = value.copyWith(
      hari: response?.data['Hari'],
      kelas: (response?.data['Kelas'] as List).cast<KelasType>(),
    );

    log.d("Hari: $hari");

    setBusyForObject('hari', true);

    try {
      await _hariService.save(hari);
    } catch (e) {
      log.e(e);

      _dialogService.showDialog(
        title: 'Error',
        description: e.toString(),
        dialogPlatform: DialogPlatform.Material,
      );
    }

    setBusyForObject('hari', false);
  }

  void onEditJam(JamModel value) {}

  void onDeleteHari(HariModel value) async {
    final response = await _dialogService.showDialog(
      title: 'Hapus Data Hari',
      description: 'Apakah anda yakin ingin menghapus data ini?',
      cancelTitle: 'Tidak',
      buttonTitle: 'Ya',
      dialogPlatform: DialogPlatform.Material,
    );

    if (response?.confirmed == false) return;

    log.i(response?.data);

    setBusyForObject('hari', true);

    try {
      await _hariService.delete(value);
    } catch (e) {
      log.e(e);

      _dialogService.showDialog(
        title: 'Error',
        description: e.toString(),
        dialogPlatform: DialogPlatform.Material,
      );
    }

    setBusyForObject('hari', false);
  }

  void onSetAktifJam(JamModel jam, bool value) async {
    setBusyForObject('jam', true);

    try {
      final copy = jam.copyWith(aktif: value);

      await _jamService.save(copy);
    } catch (e) {
      log.e(e);

      _dialogService.showDialog(
        title: 'Error',
        description: e.toString(),
        dialogPlatform: DialogPlatform.Material,
      );
    }

    setBusyForObject('jam', false);
  }

  void onSetKeteranganJam(JamModel jam, String value) async {
    setBusyForObject('jam', true);

    try {
      final copy = jam.copyWith(keterangan: value);

      await _jamService.save(copy);
    } catch (e) {
      log.e(e);

      _dialogService.showDialog(
        title: 'Error',
        description: e.toString(),
        dialogPlatform: DialogPlatform.Material,
      );
    }

    setBusyForObject('jam', false);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _periodSemesterService,
        _hariService,
        _jamService,
      ];
}
