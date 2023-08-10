import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jadwal_kuliah/app/app.dialogs.dart';
import 'package:jadwal_kuliah/app/app.locator.dart';
import 'package:jadwal_kuliah/app/app.logger.dart';
import 'package:jadwal_kuliah/extensions/string_extension.dart';
import 'package:jadwal_kuliah/models/dosen_model.dart';
import 'package:jadwal_kuliah/services/dosen_service.dart';
import 'package:jadwal_kuliah/ui/dialogs/form/form_dialog.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DosenViewModel extends ReactiveViewModel {
  final log = getLogger('DosenViewModel');

  final _dialogService = locator<DialogService>();
  final _dosenService = locator<DosenService>();

  String get table => 'Dosen';

  final columns = [
    '#',
    'NBM',
    'Nama',
    'Alamat',
    'Nomor Telepon',
    'Aksi',
  ];

  bool _isFiltered = false;

  final List<DosenModel> _filteredItems = [];

  List<DosenModel> get _items => _dosenService.items;

  List<DosenModel> get items => _isFiltered ? _filteredItems : _items;

  List<Map<String, dynamic>> get source => items
      .asMap()
      .entries
      .map(
        (entry) => {
          '#': entry.key + 1,
          'nbm': entry.value.nbm,
          'nama': entry.value.nama,
          'alamat': entry.value.alamat?.toNull() ?? '-',
          'nomor_telepon': entry.value.nomorTelepon?.toNull() ?? '-',
          'aksi': entry.value,
        },
      )
      .toList();

  void init() async {
    setBusy(true);

    await _dosenService.syncData();

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
      if (item.nbm.toLowerCase().contains(value.toLowerCase()) ||
          item.nama.toLowerCase().contains(value.toLowerCase()) ||
          item.alamat?.toLowerCase().contains(value.toLowerCase()) == true ||
          item.nomorTelepon?.toLowerCase().contains(value.toLowerCase()) ==
              true) {
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
            label: 'NBM',
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
          FormDialogItem(
            label: 'Nama',
          ),
          FormDialogItem(
            label: 'Alamat',
            isRequired: false,
          ),
          FormDialogItem(
            label: 'Nomor Telepon',
            keyboardType: TextInputType.phone,
            isRequired: false,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
        ],
      ),
    );

    if (response?.confirmed == false) return;

    log.i(response?.data);

    final dosen = DosenModel.create(
      nbm: response?.data['NBM'],
      nama: response?.data['Nama'],
      alamat: response?.data['Alamat'],
      nomorTelepon: response?.data['Nomor Telepon'],
    );

    log.d("Dosen: $dosen");

    setBusy(true);

    try {
      await _dosenService.save(dosen);
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

  void onEdit(DosenModel value) async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.form,
      title: 'Ubah Data $table',
      data: FormDialogData(
        formDialogItems: [
          FormDialogItem(
            controller: TextEditingController(text: value.nbm),
            label: 'NBM',
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
          FormDialogItem(
            controller: TextEditingController(text: value.nama),
            label: 'Nama',
          ),
          FormDialogItem(
            controller: TextEditingController(text: value.alamat),
            label: 'Alamat',
            isRequired: false,
          ),
          FormDialogItem(
            controller: TextEditingController(text: value.nomorTelepon),
            label: 'Nomor Telepon',
            keyboardType: TextInputType.phone,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            isRequired: false,
          ),
        ],
      ),
    );

    if (response?.confirmed == false) return;

    log.i(response?.data);

    final dosen = value.copyWith(
      nbm: response?.data['NBM'],
      nama: response?.data['Nama'],
      alamat: response?.data['Alamat'],
      nomorTelepon: response?.data['Nomor Telepon'],
    );

    log.d("dosen: $dosen");

    setBusy(true);

    try {
      await _dosenService.save(dosen);
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
      await _dosenService.delete(value);
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
  List<ListenableServiceMixin> get listenableServices => [_dosenService];
}
