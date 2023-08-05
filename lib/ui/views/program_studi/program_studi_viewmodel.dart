import 'package:flutter/material.dart';
import 'package:jadwal_kuliah/app/app.dialogs.dart';
import 'package:jadwal_kuliah/app/app.locator.dart';
import 'package:jadwal_kuliah/app/app.logger.dart';
import 'package:jadwal_kuliah/models/fakultas_model.dart';
import 'package:jadwal_kuliah/models/item_model.dart';
import 'package:jadwal_kuliah/models/program_studi_model.dart';
import 'package:jadwal_kuliah/services/fakultas_service.dart';
import 'package:jadwal_kuliah/services/program_studi_service.dart';
import 'package:jadwal_kuliah/ui/dialogs/form/form_dialog.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProgramStudiViewModel extends ReactiveViewModel {
  final log = getLogger('ProgramStudiViewModel');

  final _dialogService = locator<DialogService>();
  final _fakultasService = locator<FakultasService>();
  final _programStudiService = locator<ProgramStudiService>();

  String get table => 'Program Studi';

  final columns = [
    '#',
    'Program Studi',
    'Fakultas',
    'Aksi',
  ];

  List<ProgramStudiModel> get items => _programStudiService.items;

  List<Map<String, dynamic>> get source => items
      .asMap()
      .entries
      .map(
        (entry) => {
          '#': entry.key + 1,
          'program_studi': entry.value.nama,
          'fakultas': entry.value.fakultas?.nama ?? '-',
          'aksi': entry.value,
        },
      )
      .toList();

  void init() async {
    setBusy(true);

    await _programStudiService.syncData();

    setBusy(false);
  }

  void onAdd() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.form,
      title: 'Tambah Data $table',
      description: 'Silahkan isi data-data ${table.toLowerCase()}',
      data: FormDialogData(
        formDialogItems: [
          FormDialogItem(
            label: 'Program Studi',
          ),
          FormDialogItem<FakultasModel>(
            label: 'Fakultas',
            isDropdown: true,
            dropdownItems: _fakultasService.items
                .map<ItemModel<FakultasModel>>(
                  (e) => ItemModel(
                    label: e.nama,
                    value: e,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );

    if (response?.confirmed == false) return;

    log.i(response?.data);

    final programStudi = ProgramStudiModel.create(
      nama: response?.data['Program Studi'],
      fakultas: response?.data['Fakultas'],
    );

    log.d("Program Studi: $programStudi");

    setBusy(true);

    try {
      await _programStudiService.save(programStudi);
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

  void onEdit(ProgramStudiModel value) async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.form,
      title: 'Ubah Data $table',
      data: FormDialogData(
        formDialogItems: [
          FormDialogItem(
            controller: TextEditingController(text: value.nama),
            label: 'Program Studi',
          ),
          FormDialogItem(
            controller: TextEditingController(text: value.fakultas?.nama),
            label: 'Fakultas',
            isDropdown: true,
            dropdownItems: _fakultasService.items
                .map<ItemModel<FakultasModel>>(
                  (e) => ItemModel(
                    label: e.nama,
                    value: e,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );

    if (response?.confirmed == false) return;

    log.i(response?.data);

    final programStudi = value.copyWith(
      nama: response?.data['Program Studi'],
      fakultas: response?.data['Fakultas'],
    );

    log.d("programStudi: $programStudi");

    setBusy(true);

    try {
      await _programStudiService.save(programStudi);
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

  void onDelete(value) async {
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
      await _programStudiService.delete(value);
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
  List<ListenableServiceMixin> get listenableServices => [_programStudiService];
}
