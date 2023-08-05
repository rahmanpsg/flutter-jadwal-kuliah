import 'package:flutter/material.dart';
import 'package:jadwal_kuliah/app/app.dialogs.dart';
import 'package:jadwal_kuliah/app/app.locator.dart';
import 'package:jadwal_kuliah/app/app.logger.dart';
import 'package:jadwal_kuliah/models/fakultas_model.dart';
import 'package:jadwal_kuliah/services/fakultas_service.dart';
import 'package:jadwal_kuliah/ui/dialogs/form/form_dialog.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class FakultasViewModel extends ReactiveViewModel {
  final log = getLogger('FakultasViewModel');

  final _dialogService = locator<DialogService>();
  final _fakultasService = locator<FakultasService>();

  String get table => 'Fakultas';

  final columns = [
    '#',
    'Fakultas',
    'Aksi',
  ];

  List<FakultasModel> get items => _fakultasService.items;

  List<Map<String, dynamic>> get source => items
      .asMap()
      .entries
      .map(
        (entry) => {
          '#': entry.key + 1,
          'fakultas': entry.value.nama,
          'aksi': entry.value,
        },
      )
      .toList();

  void init() async {
    setBusy(true);

    await _fakultasService.syncData();

    setBusy(false);
  }

  void onAdd() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.form,
      title: 'Tambah Data $table',
      data: FormDialogData(
        formDialogItems: [
          FormDialogItem(
            label: 'Fakultas',
          ),
        ],
      ),
    );

    if (response?.confirmed == false) return;

    log.i(response?.data);

    final fakultas = FakultasModel.create(
      nama: response?.data['Fakultas'],
    );

    log.d("Fakultas: $fakultas");

    setBusy(true);

    try {
      await _fakultasService.save(fakultas);
    } catch (e) {
      log.e(e);

      _dialogService.showDialog(
        title: 'Error',
        description: e.toString(),
      );
    }

    setBusy(false);
  }

  void onEdit(FakultasModel value) async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.form,
      title: 'Ubah Data $table',
      data: FormDialogData(
        formDialogItems: [
          FormDialogItem(
            controller: TextEditingController(text: value.nama),
            label: 'Fakultas',
          ),
        ],
      ),
    );

    if (response?.confirmed == false) return;

    log.i(response?.data);

    final fakultas = value.copyWith(
      nama: response?.data['Fakultas'],
    );

    log.d("Fakultas: $fakultas");

    setBusy(true);

    try {
      await _fakultasService.save(fakultas);
    } catch (e) {
      log.e(e);

      _dialogService.showDialog(
        title: 'Error',
        description: e.toString(),
        dialogPlatform: DialogPlatform.Material,
      );
    }

    setBusy(false);
  }

  void onDelete(FakultasModel value) async {
    log.i(value);

    final response = await _dialogService.showDialog(
      title: 'Hapus Data $table',
      description: 'Apakah anda yakin ingin menghapus data ini?',
      cancelTitle: 'Tidak',
      buttonTitle: 'Ya',
      dialogPlatform: DialogPlatform.Material,
    );

    if (response?.confirmed == false) return;

    log.i(response?.data);

    setBusy(true);

    try {
      await _fakultasService.delete(value);
    } catch (e) {
      log.e(e);

      _dialogService.showDialog(
        title: 'Error',
        description: e.toString(),
        dialogPlatform: DialogPlatform.Material,
      );
    }

    setBusy(false);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_fakultasService];
}
