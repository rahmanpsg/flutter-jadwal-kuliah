import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'pengampu_model.freezed.dart';
part 'pengampu_model.g.dart';

@freezed
class PengampuModel with _$PengampuModel {
  const PengampuModel._();

  const factory PengampuModel({
    required final String id,
    required final String idMatakuliah,
    required final String idDosen,
    required final String tahunAkademik,
    required final List<PengampuKelasModel> kelas,
  }) = _PengampuModel;

  factory PengampuModel.fromJson(Map<String, Object?> json) =>
      _$PengampuModelFromJson(json);

  factory PengampuModel.create({
    required String idMatakuliah,
    required String idDosen,
    required String tahunAkademik,
    required List<PengampuKelasModel> kelas,
  }) =>
      PengampuModel(
        id: const Uuid().v4(),
        idMatakuliah: idMatakuliah,
        idDosen: idDosen,
        tahunAkademik: tahunAkademik,
        kelas: kelas,
      );
}

@freezed
class PengampuKelasModel with _$PengampuKelasModel {
  const PengampuKelasModel._();

  const factory PengampuKelasModel({
    required final String id,
    required final String idKelas,
    required final String kelas,
  }) = _PengampuKelasModel;

  factory PengampuKelasModel.fromJson(Map<String, Object?> json) =>
      _$PengampuKelasModelFromJson(json);

  factory PengampuKelasModel.create({
    required String idKelas,
    required String kelas,
  }) =>
      PengampuKelasModel(
        id: const Uuid().v4(),
        idKelas: idKelas,
        kelas: kelas,
      );
}
