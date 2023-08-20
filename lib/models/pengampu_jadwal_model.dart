import 'package:equatable/equatable.dart';
import 'package:jadwal_kuliah/enums/kelas_type.dart';
import 'package:jadwal_kuliah/models/dosen_model.dart';
import 'package:jadwal_kuliah/models/matakuliah_model.dart';

import 'pengampu_model.dart';

class PengampuJadwalModel extends Equatable {
  final String id;
  final MatakuliahModel matakuliah;
  final DosenModel dosen;
  final String tahunAkademik;
  final PengampuKelasModel kelas;
  final KelasType kelasType;

  const PengampuJadwalModel({
    required this.id,
    required this.matakuliah,
    required this.dosen,
    required this.tahunAkademik,
    required this.kelas,
    required this.kelasType,
  });

  factory PengampuJadwalModel.fromJson(Map<String, Object?> json) {
    return PengampuJadwalModel(
      id: json['id'] as String,
      matakuliah: MatakuliahModel.fromJson(
        json['matakuliah'] as Map<String, Object?>,
      ),
      dosen: DosenModel.fromJson(
        json['dosen'] as Map<String, Object?>,
      ),
      tahunAkademik: json['tahun_akademik'] as String,
      kelas: PengampuKelasModel.fromJson(
        json['kelas'] as Map<String, Object?>,
      ),
      kelasType: KelasType.fromInt(
        json['kelas_type'] as int,
      ),
    );
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'matakuliah': matakuliah.toJson(),
      'dosen': dosen.toJson(),
      'tahunAkademik': tahunAkademik,
      'kelas': kelas.toJson(),
    };
  }

  PengampuJadwalModel copyWith({
    String? id,
    String? idPengampu,
    MatakuliahModel? matakuliah,
    DosenModel? dosen,
    String? tahunAkademik,
    PengampuKelasModel? kelas,
    KelasType? kelasType,
  }) {
    return PengampuJadwalModel(
      id: id ?? this.id,
      matakuliah: matakuliah ?? this.matakuliah,
      dosen: dosen ?? this.dosen,
      tahunAkademik: tahunAkademik ?? this.tahunAkademik,
      kelas: kelas ?? this.kelas,
      kelasType: kelasType ?? this.kelasType,
    );
  }

  @override
  String toString() {
    return 'PengampuJadwalModel(id: $id, matakuliah: $matakuliah, dosen: $dosen, tahunAkademik: $tahunAkademik, kelas: $kelas, kelasType: $kelasType)';
  }

  @override
  List<Object?> get props => [
        id,
        matakuliah,
        dosen,
        tahunAkademik,
        kelas,
        kelasType,
      ];
}
