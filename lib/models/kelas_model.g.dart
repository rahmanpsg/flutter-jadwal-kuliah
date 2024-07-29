// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kelas_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KelasModelImpl _$$KelasModelImplFromJson(Map<String, dynamic> json) =>
    _$KelasModelImpl(
      id: json['id'] as String,
      nama: (json['nama'] as List<dynamic>).map((e) => e as String).toList(),
      tahunAngkatan: (json['tahun_angkatan'] as num).toInt(),
      jenis: KelasType.fromInt((json['jenis'] as num).toInt()),
      idProgramStudi: json['id_program_studi'] as String?,
    );

Map<String, dynamic> _$$KelasModelImplToJson(_$KelasModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama': instance.nama,
      'tahun_angkatan': instance.tahunAngkatan,
      'jenis': KelasType.toInt(instance.jenis),
      'id_program_studi': instance.idProgramStudi,
    };
