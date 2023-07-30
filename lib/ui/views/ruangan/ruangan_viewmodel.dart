import 'package:jadwal_kuliah/app/app.dialogs.dart';
import 'package:jadwal_kuliah/app/app.locator.dart';
import 'package:jadwal_kuliah/app/app.logger.dart';
import 'package:jadwal_kuliah/ui/dialogs/form/form_dialog.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RuanganViewModel extends BaseViewModel {
  final log = getLogger('RuanganViewModel');

  final _dialogService = locator<DialogService>();

  String get table => 'Ruangan';

  final columns = [
    '#',
    'Nama',
    'Program Studi',
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
            label: 'Nama',
          ),
          FormDialogItem(
            label: 'Program Studi',
            isDropdown: true,
          ),
        ],
      ),
    );

    if (response?.confirmed == false) return;

    log.i(response?.data);
  }
}
