import 'package:flutter/services.dart';
import 'package:jadwal_kuliah/app/app.dialogs.dart';
import 'package:jadwal_kuliah/app/app.locator.dart';
import 'package:jadwal_kuliah/app/app.logger.dart';
import 'package:jadwal_kuliah/ui/dialogs/form/form_dialog.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DosenViewModel extends BaseViewModel {
  final log = getLogger('DosenViewModel');

  final _dialogService = locator<DialogService>();

  String get table => 'Dosen';

  final columns = [
    '#',
    'NBM',
    'Nama',
    'Alamat',
    'Nomor Telepon',
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
            label: 'NBM',
            keyboardType: TextInputType.number,
          ),
          FormDialogItem(
            label: 'Nama',
          ),
          FormDialogItem(
            label: 'Alamat',
          ),
          FormDialogItem(
            label: 'Nomor Telepon',
            keyboardType: TextInputType.phone,
          ),
        ],
      ),
    );

    if (response?.confirmed == false) return;

    log.i(response?.data);
  }
}
