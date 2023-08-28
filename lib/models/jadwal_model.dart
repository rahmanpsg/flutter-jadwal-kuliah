import 'package:jadwal_kuliah/models/hari_model.dart';
import 'package:jadwal_kuliah/models/jam_model.dart';
import 'package:jadwal_kuliah/models/ruangan_model.dart';
import 'package:jadwal_kuliah/utils/datetime.dart';
import 'package:uuid/uuid.dart';

import 'pengampu_jadwal_model.dart';

class JadwalModel {
  final String id;
  final PengampuJadwalModel pengampuJadwal;
  final HariModel hari;
  final List<JamModel> jam;
  final RuanganModel ruangan;

  JadwalModel({
    String? id,
    required this.pengampuJadwal,
    required this.hari,
    required this.jam,
    required this.ruangan,
  }) : id = id ?? const Uuid().v4();

  String get jamMulaiDanSelesai =>
      '${DateTimeUtils.timeOfDayToString(jam.first.mulai)} - '
      '${DateTimeUtils.timeOfDayToString(jam.last.selesai)}';

  @override
  String toString() {
    var jam = '${DateTimeUtils.timeOfDayToString(this.jam.first.mulai)} - '
        '${DateTimeUtils.timeOfDayToString(this.jam.last.selesai)}';

    return '${hari.hari} $jam ${ruangan.nama} ${pengampuJadwal.matakuliah.nama} ${pengampuJadwal.dosen.nama} ${pengampuJadwal.kelas.kelas} SKS ${pengampuJadwal.matakuliah.sks}\n';
  }
}
