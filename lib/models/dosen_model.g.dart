// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dosen_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DosenModelImpl _$$DosenModelImplFromJson(Map<String, dynamic> json) =>
    _$DosenModelImpl(
      id: json['id'] as String,
      nbm: json['nbm'] as String,
      nama: json['nama'] as String,
      alamat: json['alamat'] as String?,
      nomorTelepon: json['nomor_telepon'] as String?,
    );

Map<String, dynamic> _$$DosenModelImplToJson(_$DosenModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nbm': instance.nbm,
      'nama': instance.nama,
      'alamat': instance.alamat,
      'nomor_telepon': instance.nomorTelepon,
    };
