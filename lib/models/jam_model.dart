// ignore_for_file: invalid_annotation_target

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jadwal_kuliah/extensions/time_of_day_extension.dart';
import 'package:uuid/uuid.dart';

part 'jam_model.freezed.dart';
part 'jam_model.g.dart';

@freezed
class JamModel with _$JamModel {
  const JamModel._();

  const factory JamModel({
    required final String id,
    @JsonKey(
      fromJson: TimeOfDayExtension.fromJson,
      toJson: TimeOfDayExtension.toJson,
    )
    required final TimeOfDay mulai,
    @JsonKey(
      fromJson: TimeOfDayExtension.fromJson,
      toJson: TimeOfDayExtension.toJson,
    )
    required final TimeOfDay selesai,
    required final bool aktif,
    final String? keterangan,
  }) = _JamModel;

  factory JamModel.fromJson(Map<String, Object?> json) =>
      _$JamModelFromJson(json);

  factory JamModel.create({
    required TimeOfDay mulai,
    required TimeOfDay selesai,
    required bool aktif,
    String? keterangan,
  }) =>
      JamModel(
        id: const Uuid().v4(),
        mulai: mulai,
        selesai: selesai,
        aktif: aktif,
        keterangan: keterangan,
      );
}
