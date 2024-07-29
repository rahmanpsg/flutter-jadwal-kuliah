// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matakuliah_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatakuliahModelImpl _$$MatakuliahModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MatakuliahModelImpl(
      id: json['id'] as String,
      kode: json['kode'] as String,
      nama: json['nama'] as String,
      sks: (json['sks'] as num).toInt(),
      semester: (json['semester'] as num).toInt(),
      idProgramStudi: json['id_program_studi'] as String?,
    );

Map<String, dynamic> _$$MatakuliahModelImplToJson(
        _$MatakuliahModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kode': instance.kode,
      'nama': instance.nama,
      'sks': instance.sks,
      'semester': instance.semester,
      'id_program_studi': instance.idProgramStudi,
    };
