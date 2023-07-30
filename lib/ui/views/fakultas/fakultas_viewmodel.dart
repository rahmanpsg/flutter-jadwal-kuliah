import 'package:jadwal_kuliah/app/app.dialogs.dart';
import 'package:jadwal_kuliah/app/app.locator.dart';
import 'package:jadwal_kuliah/app/app.logger.dart';
import 'package:jadwal_kuliah/ui/dialogs/form/form_dialog.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class FakultasViewModel extends BaseViewModel {
  final log = getLogger('FakultasViewModel');

  final _dialogService = locator<DialogService>();

  String get table => 'Fakultas';

  final columns = [
    '#',
    'Fakultas',
    'Aksi',
  ];

  void init() async {}

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
  }
}
