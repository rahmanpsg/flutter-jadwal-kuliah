// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jam_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JamModelImpl _$$JamModelImplFromJson(Map<String, dynamic> json) =>
    _$JamModelImpl(
      id: json['id'] as String,
      mulai: TimeOfDayExtension.fromJson(json['mulai'] as String),
      selesai: TimeOfDayExtension.fromJson(json['selesai'] as String),
      aktif: json['aktif'] as bool,
      keterangan: json['keterangan'] as String?,
    );

Map<String, dynamic> _$$JamModelImplToJson(_$JamModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mulai': TimeOfDayExtension.toJson(instance.mulai),
      'selesai': TimeOfDayExtension.toJson(instance.selesai),
      'aktif': instance.aktif,
      'keterangan': instance.keterangan,
    };
