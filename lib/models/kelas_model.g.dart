// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kelas_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_KelasModel _$$_KelasModelFromJson(Map<String, dynamic> json) =>
    _$_KelasModel(
      id: json['id'] as String,
      nama: (json['nama'] as List<dynamic>).map((e) => e as String).toList(),
      tahunAngkatan: json['tahun_angkatan'] as int,
      jenis: KelasType.fromInt(json['jenis'] as int),
      idProgramStudi: json['id_program_studi'] as String?,
    );

Map<String, dynamic> _$$_KelasModelToJson(_$_KelasModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama': instance.nama,
      'tahun_angkatan': instance.tahunAngkatan,
      'jenis': KelasType.toInt(instance.jenis),
      'id_program_studi': instance.idProgramStudi,
    };
