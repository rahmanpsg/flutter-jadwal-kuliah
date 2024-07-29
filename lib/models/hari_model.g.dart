// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hari_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HariModelImpl _$$HariModelImplFromJson(Map<String, dynamic> json) =>
    _$HariModelImpl(
      id: json['id'] as String,
      hari: json['hari'] as String,
      kelas: KelasType.fromListInt(json['kelas'] as List),
    );

Map<String, dynamic> _$$HariModelImplToJson(_$HariModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hari': instance.hari,
      'kelas': KelasType.toListInt(instance.kelas),
    };
