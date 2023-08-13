// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jam_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_JamModel _$$_JamModelFromJson(Map<String, dynamic> json) => _$_JamModel(
      id: json['id'] as String,
      mulai: TimeOfDayExtension.fromJson(json['mulai'] as String),
      selesai: TimeOfDayExtension.fromJson(json['selesai'] as String),
      aktif: json['aktif'] as bool,
      keterangan: json['keterangan'] as String?,
    );

Map<String, dynamic> _$$_JamModelToJson(_$_JamModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mulai': TimeOfDayExtension.toJson(instance.mulai),
      'selesai': TimeOfDayExtension.toJson(instance.selesai),
      'aktif': instance.aktif,
      'keterangan': instance.keterangan,
    };
