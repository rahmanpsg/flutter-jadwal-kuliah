import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'ruangan_model.freezed.dart';
part 'ruangan_model.g.dart';

@freezed
class RuanganModel with _$RuanganModel {
  const RuanganModel._();

  const factory RuanganModel({
    required final String id,
    required final String nama,
    final String? idProgramStudi,
  }) = _RuanganModel;

  factory RuanganModel.fromJson(Map<String, Object?> json) =>
      _$RuanganModelFromJson(json);

  factory RuanganModel.create({
    required String nama,
    String? idProgramStudi,
  }) =>
      RuanganModel(
        id: const Uuid().v4(),
        nama: nama,
        idProgramStudi: idProgramStudi,
      );
}
