// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pengampu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PengampuModel _$$_PengampuModelFromJson(Map<String, dynamic> json) =>
    _$_PengampuModel(
      id: json['id'] as String,
      idMatakuliah: json['id_matakuliah'] as String,
      idDosen: json['id_dosen'] as String,
      tahunAkademik: json['tahun_akademik'] as String,
      kelas: (json['kelas'] as List<dynamic>)
          .map((e) => PengampuKelasModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PengampuModelToJson(_$_PengampuModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_matakuliah': instance.idMatakuliah,
      'id_dosen': instance.idDosen,
      'tahun_akademik': instance.tahunAkademik,
    };

_$_PengampuKelasModel _$$_PengampuKelasModelFromJson(
        Map<String, dynamic> json) =>
    _$_PengampuKelasModel(
      id: json['id'] as String,
      idPengampu: json['id_pengampu'] as String,
      idKelas: json['id_kelas'] as String,
      kelas: json['kelas'] as String,
    );

Map<String, dynamic> _$$_PengampuKelasModelToJson(
        _$_PengampuKelasModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_pengampu': instance.idPengampu,
      'id_kelas': instance.idKelas,
      'kelas': instance.kelas,
    };
