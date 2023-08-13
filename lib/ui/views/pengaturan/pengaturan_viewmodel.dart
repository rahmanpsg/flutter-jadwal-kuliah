import 'package:flutter/material.dart';
import 'package:jadwal_kuliah/app/app.dialogs.dart';
import 'package:jadwal_kuliah/app/app.locator.dart';
import 'package:jadwal_kuliah/app/app.logger.dart';
import 'package:jadwal_kuliah/enums/kelas_type.dart';
import 'package:jadwal_kuliah/models/hari_model.dart';
import 'package:jadwal_kuliah/models/item_model.dart';
import 'package:jadwal_kuliah/models/jam_model.dart';
import 'package:jadwal_kuliah/services/hari_service.dart';
import 'package:jadwal_kuliah/services/jam_service.dart';
import 'package:jadwal_kuliah/ui/dialogs/form/form_dialog.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PengaturanViewModel extends ReactiveViewModel {
  final log = getLogger('PengaturanViewModel');

  final _dialogService = locator<DialogService>();
  final _hariService = locator<HariService>();
  final _jamService = locator<JamService>();

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
    setBusy(true);

    await _hariService.syncData();
    await _jamService.syncData();

    setBusy(false);
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
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.form,
      title: 'Tambah Data Jam',
      description: 'Silahkan isi data-data berikut',
      data: FormDialogData(
        formDialogItems: [
          FormDialogItem(
            label: 'Jam Mulai',
          ),
          FormDialogItem(
            label: 'Jam Selesai',
          ),
          FormDialogItem(
            label: 'Aktif',
            isDropdown: true,
            dropdownItems: const [
              ItemModel(label: 'Ya', value: true),
              ItemModel(label: 'Tidak', value: false),
            ],
          ),
          FormDialogItem(
            label: 'Keterangan',
            isRequired: false,
          ),
        ],
      ),
    );

    if (response?.confirmed == false) return;

    log.i(response?.data);

    final jam = JamModel.create(
      mulai: response?.data['Jam Mulai'],
      selesai: response?.data['Jam Selesai'],
      aktif: response?.data['Aktif'],
      keterangan: response?.data['Keterangan'],
    );

    log.d("jam: $jam");

    setBusyForObject('jam', true);

    try {
      await _jamService.save(jam);
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

  void onEditJam(JamModel value) {}

  void onDeleteHari(HariModel value) {}
  void onDeleteJam(JamModel value) {}

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _hariService,
        _jamService,
      ];
}
