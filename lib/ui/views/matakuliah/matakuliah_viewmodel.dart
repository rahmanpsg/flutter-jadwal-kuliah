import 'package:flutter/services.dart';
import 'package:jadwal_kuliah/app/app.dialogs.dart';
import 'package:jadwal_kuliah/app/app.locator.dart';
import 'package:jadwal_kuliah/app/app.logger.dart';
import 'package:jadwal_kuliah/ui/dialogs/form/form_dialog.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MatakuliahViewModel extends BaseViewModel {
  final log = getLogger('MatakuliahViewModel');

  final _dialogService = locator<DialogService>();

  String get table => 'Matakuliah';

  final columns = [
    '#',
    'Kode',
    'Nama',
    'SKS',
    'Semester',
    'Program Studi',
    'Fakultas',
    'Aksi',
  ];

  void init() async {}

  void onAdd() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.form,
      title: 'Tambah Data $table',
      description: 'Silahkan isi data-data ${table.toLowerCase()}',
      data: FormDialogData(
        formDialogItems: [
          FormDialogItem(
            label: 'Kode',
          ),
          FormDialogItem(
            label: 'Nama',
          ),
          FormDialogItem(
            label: 'SKS',
            keyboardType: TextInputType.number,
          ),
          FormDialogItem(
            label: 'Semester',
            keyboardType: TextInputType.number,
          ),
          FormDialogItem(
            label: 'Program Studi',
            isDropdown: true,
          ),
          FormDialogItem(
            label: 'Fakultas',
            isDropdown: true,
          ),
        ],
      ),
    );

    if (response?.confirmed == false) return;

    log.i(response?.data);
  }
}
