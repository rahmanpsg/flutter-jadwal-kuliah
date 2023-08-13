// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jadwal_kuliah/enums/kelas_type.dart';
import 'package:uuid/uuid.dart';

part 'hari_model.freezed.dart';
part 'hari_model.g.dart';

@freezed
class HariModel with _$HariModel {
  const HariModel._();

  const factory HariModel({
    required final String id,
    required final String hari,
    @JsonKey(
      fromJson: KelasType.fromListInt,
      toJson: KelasType.toListInt,
    )
    required final List<KelasType> kelas,
  }) = _HariModel;

  factory HariModel.fromJson(Map<String, Object?> json) =>
      _$HariModelFromJson(json);

  factory HariModel.create({
    required String hari,
    required List<KelasType> kelas,
  }) =>
      HariModel(
        id: const Uuid().v4(),
        hari: hari,
        kelas: kelas,
      );
}
