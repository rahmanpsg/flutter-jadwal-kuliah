import 'package:jadwal_kuliah/app/app.dialogs.dart';
import 'package:jadwal_kuliah/app/app.locator.dart';
import 'package:jadwal_kuliah/app/app.logger.dart';
import 'package:jadwal_kuliah/ui/dialogs/form/form_dialog.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProgramStudiViewModel extends BaseViewModel {
  final log = getLogger('ProgramStudiViewModel');

  final _dialogService = locator<DialogService>();

  String get table => 'Program Studi';

  final columns = [
    '#',
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
            label: 'Program Studi',
            isDropdown: true,
          ),
          FormDialogItem(
            label: 'Fakultas',
          ),
        ],
      ),
    );

    if (response?.confirmed == false) return;

    log.i(response?.data);
  }
}
