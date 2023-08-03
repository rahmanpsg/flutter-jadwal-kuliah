import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'fakultas_model.freezed.dart';
part 'fakultas_model.g.dart';

@freezed
class FakultasModel with _$FakultasModel {
  const FakultasModel._();

  const factory FakultasModel({
    required final String id,
    required final String nama,
  }) = _FakultasModel;

  factory FakultasModel.fromJson(Map<String, Object?> json) =>
      _$FakultasModelFromJson(json);

  factory FakultasModel.create({
    required String nama,
  }) =>
      FakultasModel(
        id: const Uuid().v4(),
        nama: nama,
      );

  /// Convert [FakultasModel] to [String]
  static String toId(FakultasModel? fakultas) =>
      fakultas?.id ?? const Uuid().v4();
}
