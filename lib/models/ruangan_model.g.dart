// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ruangan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RuanganModelImpl _$$RuanganModelImplFromJson(Map<String, dynamic> json) =>
    _$RuanganModelImpl(
      id: json['id'] as String,
      nama: json['nama'] as String,
      idProgramStudi: json['id_program_studi'] as String?,
    );

Map<String, dynamic> _$$RuanganModelImplToJson(_$RuanganModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama': instance.nama,
      'id_program_studi': instance.idProgramStudi,
    };
