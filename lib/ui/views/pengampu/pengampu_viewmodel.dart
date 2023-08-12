import 'package:jadwal_kuliah/app/app.dialogs.dart';
import 'package:jadwal_kuliah/app/app.locator.dart';
import 'package:jadwal_kuliah/app/app.logger.dart';
import 'package:jadwal_kuliah/models/pengampu_model.dart';
import 'package:jadwal_kuliah/services/dosen_service.dart';
import 'package:jadwal_kuliah/services/matakuliah_service.dart';
import 'package:jadwal_kuliah/services/pengampu_service.dart';
import 'package:jadwal_kuliah/ui/dialogs/pengampu_form/pengampu_form_dialog.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PengampuViewModel extends ReactiveViewModel {
  final log = getLogger('PengampuViewModel');

  final _dialogService = locator<DialogService>();
  final _pengampuService = locator<PengampuService>();
  final _matakuliahService = locator<MatakuliahService>();
  final _dosenService = locator<DosenService>();

  String get table => 'Pengampu';

  final columns = [
    '#',
    'Tahun Akademik',
    'Matakuliah',
    'Dosen',
    'Kelas',
    'Aksi',
  ];

  bool _isFiltered = false;

  final List<PengampuModel> _filteredItems = [];

  List<PengampuModel> get _items => _pengampuService.items;

  List<PengampuModel> get items => _isFiltered ? _filteredItems : _items;

  List<Map<String, dynamic>> get source => items
      .asMap()
      .entries
      .map(
        (entry) => {
          '#': entry.key + 1,
          'tahun_akademik': entry.value.tahunAkademik,
          'matakuliah':
              _matakuliahService.getById(entry.value.idMatakuliah)?.nama ?? '-',
          'dosen': _dosenService.getById(entry.value.idDosen)?.nama ?? '-',
          'kelas': entry.value.kelas.map((e) => e.kelas).join(', '),
          'aksi': entry.value,
        },
      )
      .toList();

  void init() async {
    setBusy(true);

    await _matakuliahService.syncData();
    await _dosenService.syncData();
    await _pengampuService.syncData();

    setBusy(false);
  }

  void onSearch(String value) {
    if (value.isEmpty) {
      _isFiltered = false;
      rebuildUi();
      return;
    }

    _filteredItems.clear();
    _filteredItems.addAll(
      _items.where(
        (item) =>
            item.tahunAkademik.toLowerCase().contains(value.toLowerCase()),
      ),
    );

    _isFiltered = true;
    rebuildUi();
  }

  void onAdd() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.pengampuForm,
      data: const PengampuFormDialogData(),
      title: 'Tambah Data $table',
      description: 'Silahkan isi data-data ${table.toLowerCase()}',
    );

    if (response?.confirmed == false) return;

    setBusy(true);

    try {
      await _pengampuService.save(response!.data);
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

  void onEdit(PengampuModel value) async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.pengampuForm,
      data: PengampuFormDialogData(pengampu: value),
      title: 'Ubah Data $table',
      description: 'Silahkan isi data-data ${table.toLowerCase()}',
    );

    if (response?.confirmed == false) return;

    setBusy(true);

    try {
      await _pengampuService.save(response!.data);
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

  void onDelete(PengampuModel value) async {
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
      await _pengampuService.delete(value);
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
  List<ListenableServiceMixin> get listenableServices => [_pengampuService];
}
