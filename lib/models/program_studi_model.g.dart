// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_studi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProgramStudiModel _$$_ProgramStudiModelFromJson(Map<String, dynamic> json) =>
    _$_ProgramStudiModel(
      id: json['id'] as String,
      nama: json['nama'] as String,
      fakultas: json['id_fakultas'] == null
          ? null
          : FakultasModel.fromJson(json['id_fakultas'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ProgramStudiModelToJson(
        _$_ProgramStudiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama': instance.nama,
      'id_fakultas': FakultasModel.toId(instance.fakultas),
    };
