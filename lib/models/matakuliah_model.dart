import 'package:freezed_annotation/freezed_annotation.dart';

part 'matakuliah_model.freezed.dart';
part 'matakuliah_model.g.dart';

@freezed
class MatakuliahModel with _$MatakuliahModel {
  const factory MatakuliahModel({
    required final String id,
    required final String kode,
    required final String nama,
    required final int sks,
    required final int semester,
    required final String idProgramStudi,
    required final String idFakultas,
  }) = _MatakuliahModel;

  factory MatakuliahModel.fromJson(Map<String, Object?> json) =>
      _$MatakuliahModelFromJson(json);
}
