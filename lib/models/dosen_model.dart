import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'dosen_model.freezed.dart';
part 'dosen_model.g.dart';

@freezed
class DosenModel with _$DosenModel {
  const DosenModel._();

  const factory DosenModel({
    required final String id,
    required final String nbm,
    required final String nama,
    final String? alamat,
    final String? nomorTelepon,
  }) = _DosenModel;

  factory DosenModel.fromJson(Map<String, Object?> json) =>
      _$DosenModelFromJson(json);

  factory DosenModel.create({
    required String nbm,
    required String nama,
    String? alamat,
    String? nomorTelepon,
  }) =>
      DosenModel(
        id: const Uuid().v4(),
        nbm: nbm,
        nama: nama,
        alamat: alamat,
        nomorTelepon: nomorTelepon,
      );
}
