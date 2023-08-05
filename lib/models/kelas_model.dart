// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jadwal_kuliah/enums/kelas_type.dart';
import 'package:uuid/uuid.dart';

part 'kelas_model.freezed.dart';
part 'kelas_model.g.dart';

@freezed
class KelasModel with _$KelasModel {
  const KelasModel._();

  const factory KelasModel({
    required final String id,
    required final List<String> nama,
    required final int tahunAngkatan,
    @JsonKey(
      fromJson: KelasType.fromInt,
      toJson: KelasType.toInt,
    )
    required final KelasType jenis,
    final String? idProgramStudi,
  }) = _KelasModel;

  factory KelasModel.fromJson(Map<String, Object?> json) =>
      _$KelasModelFromJson(json);

  factory KelasModel.create({
    required List<String> nama,
    required int tahunAngkatan,
    required KelasType jenis,
    String? idProgramStudi,
  }) =>
      KelasModel(
        id: const Uuid().v4(),
        nama: nama,
        tahunAngkatan: tahunAngkatan,
        jenis: jenis,
        idProgramStudi: idProgramStudi,
      );
}
