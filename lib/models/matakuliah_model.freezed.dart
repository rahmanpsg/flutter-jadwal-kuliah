// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matakuliah_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MatakuliahModel _$MatakuliahModelFromJson(Map<String, dynamic> json) {
  return _MatakuliahModel.fromJson(json);
}

/// @nodoc
mixin _$MatakuliahModel {
  String get id => throw _privateConstructorUsedError;
  String get kode => throw _privateConstructorUsedError;
  String get nama => throw _privateConstructorUsedError;
  int get sks => throw _privateConstructorUsedError;
  int get semester => throw _privateConstructorUsedError;
  String? get idProgramStudi => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatakuliahModelCopyWith<MatakuliahModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatakuliahModelCopyWith<$Res> {
  factory $MatakuliahModelCopyWith(
          MatakuliahModel value, $Res Function(MatakuliahModel) then) =
      _$MatakuliahModelCopyWithImpl<$Res, MatakuliahModel>;
  @useResult
  $Res call(
      {String id,
      String kode,
      String nama,
      int sks,
      int semester,
      String? idProgramStudi});
}

/// @nodoc
class _$MatakuliahModelCopyWithImpl<$Res, $Val extends MatakuliahModel>
    implements $MatakuliahModelCopyWith<$Res> {
  _$MatakuliahModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? kode = null,
    Object? nama = null,
    Object? sks = null,
    Object? semester = null,
    Object? idProgramStudi = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      kode: null == kode
          ? _value.kode
          : kode // ignore: cast_nullable_to_non_nullable
              as String,
      nama: null == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String,
      sks: null == sks
          ? _value.sks
          : sks // ignore: cast_nullable_to_non_nullable
              as int,
      semester: null == semester
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
              as int,
      idProgramStudi: freezed == idProgramStudi
          ? _value.idProgramStudi
          : idProgramStudi // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MatakuliahModelCopyWith<$Res>
    implements $MatakuliahModelCopyWith<$Res> {
  factory _$$_MatakuliahModelCopyWith(
          _$_MatakuliahModel value, $Res Function(_$_MatakuliahModel) then) =
      __$$_MatakuliahModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String kode,
      String nama,
      int sks,
      int semester,
      String? idProgramStudi});
}

/// @nodoc
class __$$_MatakuliahModelCopyWithImpl<$Res>
    extends _$MatakuliahModelCopyWithImpl<$Res, _$_MatakuliahModel>
    implements _$$_MatakuliahModelCopyWith<$Res> {
  __$$_MatakuliahModelCopyWithImpl(
      _$_MatakuliahModel _value, $Res Function(_$_MatakuliahModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? kode = null,
    Object? nama = null,
    Object? sks = null,
    Object? semester = null,
    Object? idProgramStudi = freezed,
  }) {
    return _then(_$_MatakuliahModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      kode: null == kode
          ? _value.kode
          : kode // ignore: cast_nullable_to_non_nullable
              as String,
      nama: null == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String,
      sks: null == sks
          ? _value.sks
          : sks // ignore: cast_nullable_to_non_nullable
              as int,
      semester: null == semester
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
              as int,
      idProgramStudi: freezed == idProgramStudi
          ? _value.idProgramStudi
          : idProgramStudi // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MatakuliahModel extends _MatakuliahModel {
  const _$_MatakuliahModel(
      {required this.id,
      required this.kode,
      required this.nama,
      required this.sks,
      required this.semester,
      required this.idProgramStudi})
      : super._();

  factory _$_MatakuliahModel.fromJson(Map<String, dynamic> json) =>
      _$$_MatakuliahModelFromJson(json);

  @override
  final String id;
  @override
  final String kode;
  @override
  final String nama;
  @override
  final int sks;
  @override
  final int semester;
  @override
  final String? idProgramStudi;

  @override
  String toString() {
    return 'MatakuliahModel(id: $id, kode: $kode, nama: $nama, sks: $sks, semester: $semester, idProgramStudi: $idProgramStudi)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MatakuliahModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.kode, kode) || other.kode == kode) &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.sks, sks) || other.sks == sks) &&
            (identical(other.semester, semester) ||
                other.semester == semester) &&
            (identical(other.idProgramStudi, idProgramStudi) ||
                other.idProgramStudi == idProgramStudi));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, kode, nama, sks, semester, idProgramStudi);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MatakuliahModelCopyWith<_$_MatakuliahModel> get copyWith =>
      __$$_MatakuliahModelCopyWithImpl<_$_MatakuliahModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MatakuliahModelToJson(
      this,
    );
  }
}

abstract class _MatakuliahModel extends MatakuliahModel {
  const factory _MatakuliahModel(
      {required final String id,
      required final String kode,
      required final String nama,
      required final int sks,
      required final int semester,
      required final String? idProgramStudi}) = _$_MatakuliahModel;
  const _MatakuliahModel._() : super._();

  factory _MatakuliahModel.fromJson(Map<String, dynamic> json) =
      _$_MatakuliahModel.fromJson;

  @override
  String get id;
  @override
  String get kode;
  @override
  String get nama;
  @override
  int get sks;
  @override
  int get semester;
  @override
  String? get idProgramStudi;
  @override
  @JsonKey(ignore: true)
  _$$_MatakuliahModelCopyWith<_$_MatakuliahModel> get copyWith =>
      throw _privateConstructorUsedError;
}
