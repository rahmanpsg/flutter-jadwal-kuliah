// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jadwal_kuliah/models/fakultas_model.dart';
import 'package:uuid/uuid.dart';

part 'program_studi_model.freezed.dart';
part 'program_studi_model.g.dart';

@freezed
class ProgramStudiModel with _$ProgramStudiModel {
  const ProgramStudiModel._();

  String? get idFakultas => fakultas?.id;

  const factory ProgramStudiModel({
    required final String id,
    required final String nama,
    @JsonKey(
      name: 'id_fakultas',
      toJson: FakultasModel.toId,
    )
    required final FakultasModel? fakultas,
  }) = _ProgramStudiModel;

  factory ProgramStudiModel.fromJson(Map<String, Object?> json) =>
      _$ProgramStudiModelFromJson(json);

  factory ProgramStudiModel.create({
    required String nama,
    required FakultasModel? fakultas,
  }) =>
      ProgramStudiModel(
        id: const Uuid().v4(),
        nama: nama,
        fakultas: fakultas,
      );
}
