// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hari_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HariModel _$$_HariModelFromJson(Map<String, dynamic> json) => _$_HariModel(
      id: json['id'] as String,
      hari: json['hari'] as String,
      kelas: KelasType.fromListInt(json['kelas'] as List),
    );

Map<String, dynamic> _$$_HariModelToJson(_$_HariModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hari': instance.hari,
      'kelas': KelasType.toListInt(instance.kelas),
    };
