import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jadwal_kuliah/app/app.dialogs.dart';
import 'package:jadwal_kuliah/app/app.locator.dart';
import 'package:jadwal_kuliah/app/app.logger.dart';
import 'package:jadwal_kuliah/models/item_model.dart';
import 'package:jadwal_kuliah/models/matakuliah_model.dart';
import 'package:jadwal_kuliah/models/program_studi_model.dart';
import 'package:jadwal_kuliah/services/matakuliah_service.dart';
import 'package:jadwal_kuliah/services/program_studi_service.dart';
import 'package:jadwal_kuliah/ui/dialogs/form/form_dialog.dart';
import 'package:jadwal_kuliah/utils/text_input_formatter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MatakuliahViewModel extends ReactiveViewModel {
  final log = getLogger('MatakuliahViewModel');

  final _dialogService = locator<DialogService>();
  final _matakuliahService = locator<MatakuliahService>();
  final _programStudiService = locator<ProgramStudiService>();

  String get table => 'Matakuliah';

  final columns = [
    '#',
    'Kode',
    'Nama',
    'SKS',
    'Semester',
    'Program Studi',
    'Aksi',
  ];

  bool _isFiltered = false;

  final List<MatakuliahModel> _filteredItems = [];

  List<MatakuliahModel> get _items => _matakuliahService.items;

  List<MatakuliahModel> get items => _isFiltered ? _filteredItems : _items;

  List<Map<String, dynamic>> get source => items
      .asMap()
      .entries
      .map(
        (entry) => {
          '#': entry.key + 1,
          'kode': entry.value.kode,
          'nama': entry.value.nama,
          'sks': entry.value.sks,
          'semester': entry.value.semester,
          'program_studi': entry.value.idProgramStudi == null
              ? '-'
              : _programStudiService
                      .getById(entry.value.idProgramStudi!)
                      ?.nama ??
                  '-',
          'aksi': entry.value,
        },
      )
      .toList();

  void init() async {
    setBusy(true);

    await _programStudiService.syncData();
    await _matakuliahService.syncData();

    setBusy(false);
  }

  void onSearch(String value) {
    if (value.isEmpty) {
      _isFiltered = false;
      notifyListeners();
      return;
    }

    _isFiltered = true;
    _filteredItems.clear();

    for (var item in _items) {
      if (item.kode.toLowerCase().contains(value.toLowerCase()) ||
          item.nama.toLowerCase().contains(value.toLowerCase())) {
        _filteredItems.add(item);
      }
    }

    notifyListeners();
  }

  void onAdd() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.form,
      title: 'Tambah Data $table',
      description: 'Silahkan isi data-data ${table.toLowerCase()}',
      data: FormDialogData(
        formDialogItems: [
          FormDialogItem(
            label: 'Kode',
            inputFormatters: [
              UpperCaseTextFormatter(),
            ],
          ),
          FormDialogItem(
            label: 'Nama',
          ),
          FormDialogItem(
            label: 'SKS',
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
          FormDialogItem(
            label: 'Semester',
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
          FormDialogItem<ProgramStudiModel>(
            label: 'Program Studi',
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

    final matakuliah = MatakuliahModel.create(
      kode: response?.data['Kode'],
      nama: response?.data['Nama'],
      sks: int.parse(response?.data['SKS']),
      semester: int.parse(response?.data['Semester']),
      idProgramStudi: response?.data['Program Studi']?.id,
    );

    log.d("Matakuliah: $matakuliah");

    setBusy(true);

    try {
      await _matakuliahService.save(matakuliah);
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

  void onEdit(MatakuliahModel value) async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.form,
      title: 'Ubah Data $table',
      data: FormDialogData(
        formDialogItems: [
          FormDialogItem(
            controller: TextEditingController(text: value.kode),
            label: 'Kode',
            inputFormatters: [
              UpperCaseTextFormatter(),
            ],
          ),
          FormDialogItem(
            controller: TextEditingController(text: value.nama),
            label: 'Nama',
          ),
          FormDialogItem(
            controller: TextEditingController(text: value.sks.toString()),
            label: 'SKS',
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
          FormDialogItem(
            controller: TextEditingController(text: value.semester.toString()),
            label: 'Semester',
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
          FormDialogItem<ProgramStudiModel>(
            controller: TextEditingController(
                text: value.idProgramStudi == null
                    ? ''
                    : _programStudiService
                            .getById(value.idProgramStudi!)
                            ?.nama ??
                        ''),
            label: 'Program Studi',
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

    final matakuliah = value.copyWith(
      kode: response?.data['Kode'],
      nama: response?.data['Nama'],
      sks: int.parse(response?.data['SKS']),
      semester: int.parse(response?.data['Semester']),
      idProgramStudi: response?.data['Program Studi']?.id,
    );

    log.d("matakuliah: $matakuliah");

    setBusy(true);

    try {
      await _matakuliahService.save(matakuliah);
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

  void onDelete(MatakuliahModel value) async {
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
      await _matakuliahService.delete(value);
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
  List<ListenableServiceMixin> get listenableServices => [_matakuliahService];
}
