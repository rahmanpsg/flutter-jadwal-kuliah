import 'package:flutter/material.dart';
import 'package:jadwal_kuliah/app/app.dialogs.dart';
import 'package:jadwal_kuliah/app/app.locator.dart';
import 'package:jadwal_kuliah/app/app.logger.dart';
import 'package:jadwal_kuliah/models/item_model.dart';
import 'package:jadwal_kuliah/models/program_studi_model.dart';
import 'package:jadwal_kuliah/models/ruangan_model.dart';
import 'package:jadwal_kuliah/services/program_studi_service.dart';
import 'package:jadwal_kuliah/services/ruangan_service.dart';
import 'package:jadwal_kuliah/ui/dialogs/form/form_dialog.dart';
import 'package:jadwal_kuliah/utils/text_input_formatter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RuanganViewModel extends ReactiveViewModel {
  final log = getLogger('RuanganViewModel');

  final _dialogService = locator<DialogService>();
  final _ruanganService = locator<RuanganService>();
  final _programStudiService = locator<ProgramStudiService>();

  String get table => 'Ruangan';

  final columns = [
    '#',
    'Nama',
    'Program Studi',
    'Aksi',
  ];

  List<RuanganModel> get items => _ruanganService.items;

  List<Map<String, dynamic>> get source => items
      .asMap()
      .entries
      .map(
        (entry) => {
          '#': entry.key + 1,
          'nama': entry.value.nama,
          'program_studi': entry.value.idProgramStudi != null
              ? _programStudiService
                      .getById(entry.value.idProgramStudi!)
                      ?.nama ??
                  '-'
              : '-',
          'aksi': entry.value,
        },
      )
      .toList();

  void init() async {
    setBusy(true);

    await _programStudiService.syncData();
    await _ruanganService.syncData();

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
            label: 'Nama',
            inputFormatters: [
              UpperCaseTextFormatter(),
            ],
          ),
          FormDialogItem(
            label: 'Program Studi',
            isRequired: false,
            isDropdown: true,
            dropdownItems: _programStudiService.items
                .map<ItemModel<ProgramStudiModel>>(
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

    final ruangan = RuanganModel.create(
      nama: response?.data['Nama'],
      idProgramStudi: response?.data['Program Studi']?.id,
    );

    log.d("ruangan: $ruangan");

    setBusy(true);

    try {
      await _ruanganService.save(ruangan);
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

  void onEdit(RuanganModel value) async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.form,
      title: 'Ubah Data $table',
      data: FormDialogData(
        formDialogItems: [
          FormDialogItem(
            controller: TextEditingController(text: value.nama),
            label: 'Nama',
            inputFormatters: [
              UpperCaseTextFormatter(),
            ],
          ),
          FormDialogItem(
            controller: TextEditingController(
              text: value.idProgramStudi != null
                  ? _programStudiService.getById(value.idProgramStudi!)?.nama ??
                      ''
                  : '',
            ),
            label: 'Program Studi',
            isRequired: false,
            isDropdown: true,
            dropdownItems: _programStudiService.items
                .map<ItemModel<ProgramStudiModel>>(
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

    final ruangan = value.copyWith(
      nama: response?.data['Nama'],
      idProgramStudi: response?.data['Program Studi']?.id,
    );

    log.d("ruangan: $ruangan");

    setBusy(true);

    try {
      await _ruanganService.save(ruangan);
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

  void onDelete(RuanganModel value) async {
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
      await _ruanganService.delete(value);
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
}
