// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matakuliah_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MatakuliahModel _$$_MatakuliahModelFromJson(Map<String, dynamic> json) =>
    _$_MatakuliahModel(
      id: json['id'] as String,
      kode: json['kode'] as String,
      nama: json['nama'] as String,
      sks: json['sks'] as int,
      semester: json['semester'] as int,
      idProgramStudi: json['idProgramStudi'] as String,
      idFakultas: json['idFakultas'] as String,
    );

Map<String, dynamic> _$$_MatakuliahModelToJson(_$_MatakuliahModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kode': instance.kode,
      'nama': instance.nama,
      'sks': instance.sks,
      'semester': instance.semester,
      'idProgramStudi': instance.idProgramStudi,
      'idFakultas': instance.idFakultas,
    };
