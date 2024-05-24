import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'matakuliah_model.freezed.dart';
part 'matakuliah_model.g.dart';

@freezed
class MatakuliahModel with _$MatakuliahModel {
  const MatakuliahModel._();

  const factory MatakuliahModel({
    required final String id,
    required final String kode,
    required final String nama,
    required final int sks,
    required final int semester,
    required final String? idProgramStudi,
  }) = _MatakuliahModel;

  factory MatakuliahModel.fromJson(Map<String, Object?> json) =>
      _$MatakuliahModelFromJson(json);

  factory MatakuliahModel.create({
    required String kode,
    required String nama,
    required int sks,
    required int semester,
    required String idProgramStudi,
  }) =>
      MatakuliahModel(
        id: const Uuid().v4(),
        kode: kode,
        nama: nama,
        sks: sks,
        semester: semester,
        idProgramStudi: idProgramStudi,
      );
}
