import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jadwal_kuliah/app/app.dialogs.dart';
import 'package:jadwal_kuliah/app/app.locator.dart';
import 'package:jadwal_kuliah/app/app.logger.dart';
import 'package:jadwal_kuliah/enums/kelas_type.dart';
import 'package:jadwal_kuliah/models/item_model.dart';
import 'package:jadwal_kuliah/models/kelas_model.dart';
import 'package:jadwal_kuliah/models/program_studi_model.dart';
import 'package:jadwal_kuliah/services/kelas_service.dart';
import 'package:jadwal_kuliah/services/program_studi_service.dart';
import 'package:jadwal_kuliah/ui/dialogs/form/form_dialog.dart';
import 'package:jadwal_kuliah/utils/text_input_formatter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class KelasViewModel extends ReactiveViewModel {
  final log = getLogger('KelasViewModel');

  final _dialogService = locator<DialogService>();
  final _kelasService = locator<KelasService>();
  final _programStudiService = locator<ProgramStudiService>();

  String get table => 'Kelas';

  final columns = [
    '#',
    'Nama',
    'Tahun Angkatan',
    'Semester',
    'Jenis',
    'Program Studi',
    'Aksi',
  ];

  bool _isFiltered = false;

  final List<KelasModel> _filteredItems = [];

  List<KelasModel> get _items => _kelasService.items;

  List<KelasModel> get items => _isFiltered ? _filteredItems : _items;

  List<Map<String, dynamic>> get source => items
      .asMap()
      .entries
      .map(
        (entry) => {
          '#': entry.key + 1,
          'nama': entry.value.nama.join(', '),
          'tahun_angkatan': entry.value.tahunAngkatan,
          'semester': entry.value.semester,
          'jenis': entry.value.jenis.toString(),
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
    await _kelasService.syncData();

    setBusy(false);
  }

  void onSearch(String value) {
    if (value.isEmpty) {
      _isFiltered = false;
      rebuildUi();
      return;
    }

    _isFiltered = true;
    _filteredItems.clear();

    for (var item in _items) {
      if (item.nama.join(', ').toLowerCase().contains(value.toLowerCase())) {
        _filteredItems.add(item);
      }
    }

    rebuildUi();
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
            isChipInput: true,
            chipItems: [
              'A',
              'B',
              'C',
              'D',
              'E',
              'F',
            ].map((e) => ItemModel(label: e, value: e)).toList(),
          ),
          FormDialogItem(
            label: 'Tahun Angkatan',
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              YearInputFormatter(),
            ],
          ),
          FormDialogItem(
            label: 'Jenis',
            isDropdown: true,
            dropdownItems: [
              ItemModel(label: 'Reguler', value: KelasType.reguler),
              ItemModel(label: 'Non Reguler', value: KelasType.nonReguler),
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

    log.i("data: ${response?.data}");

    final kelas = KelasModel.create(
      nama: (response?.data['Nama'] as List<ItemModel>)
          .map<String>((e) => e.value)
          .toList(),
      tahunAngkatan: int.parse(response?.data['Tahun Angkatan']),
      jenis: response?.data['Jenis'],
      idProgramStudi: response?.data['Program Studi'] != null
          ? (response?.data['Program Studi'] as ProgramStudiModel).id
          : null,
    );

    log.d("kelas: $kelas");

    setBusy(true);

    try {
      await _kelasService.save(kelas);
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

  void onEdit(KelasModel value) async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.form,
      title: 'Ubah Data $table',
      data: FormDialogData(
        formDialogItems: [
          FormDialogItem(
            label: 'Nama',
            inputFormatters: [
              UpperCaseTextFormatter(),
            ],
            isChipInput: true,
            chipItems:
                value.nama.map((e) => ItemModel(label: e, value: e)).toList(),
          ),
          FormDialogItem(
            controller: TextEditingController(
              text: value.tahunAngkatan.toString(),
            ),
            label: 'Tahun Angkatan',
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
          FormDialogItem(
            controller: TextEditingController(
              text: value.jenis.toString(),
            ),
            label: 'Jenis',
            isDropdown: true,
            dropdownItems: [
              const ItemModel(
                label: 'Reguler',
                value: KelasType.reguler,
              ),
              const ItemModel(
                label: 'Non Reguler',
                value: KelasType.nonReguler,
              ),
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

    late KelasModel kelas;

    kelas = value.copyWith(
      nama: (response?.data['Nama'] as List<ItemModel>)
          .map<String>((e) => e.value)
          .toList(),
      tahunAngkatan: int.parse(response?.data['Tahun Angkatan']),
      jenis: response?.data['Jenis'],
      idProgramStudi: response?.data['Program Studi']?.id,
    );

    log.d("kelas: $kelas");

    setBusy(true);

    try {
      await _kelasService.save(kelas);
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

  void onDelete(KelasModel value) async {
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
      await _kelasService.delete(value);
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
  List<ListenableServiceMixin> get listenableServices => [_kelasService];
}
