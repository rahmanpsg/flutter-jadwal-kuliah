import 'package:jadwal_kuliah/app/app.logger.dart';
import 'package:stacked/stacked.dart';

class MatakuliahViewModel extends BaseViewModel {
  final log = getLogger('MatakuliahViewModel');

  final columns = [
    'No',
    'Kode',
    'Nama',
    'SKS',
    'Semester',
    'Program Studi',
    'Fakultas',
    'Aksi',
  ];
}
