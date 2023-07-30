import 'package:freezed_annotation/freezed_annotation.dart';

part 'dosen_model.freezed.dart';
part 'dosen_model.g.dart';

@freezed
class DosenModel with _$DosenModel {
  const factory DosenModel({
    required final String id,
    required final String nbm,
    required final String nama,
    final String? alamat,
    final String? nomorTelepon,
  }) = _DosenModel;

  factory DosenModel.fromJson(Map<String, Object?> json) =>
      _$DosenModelFromJson(json);
}
