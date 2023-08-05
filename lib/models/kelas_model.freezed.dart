// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kelas_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KelasModel _$KelasModelFromJson(Map<String, dynamic> json) {
  return _KelasModel.fromJson(json);
}

/// @nodoc
mixin _$KelasModel {
  String get id => throw _privateConstructorUsedError;
  List<String> get nama => throw _privateConstructorUsedError;
  int get tahunAngkatan => throw _privateConstructorUsedError;
  @JsonKey(fromJson: KelasType.fromInt, toJson: KelasType.toInt)
  KelasType get jenis => throw _privateConstructorUsedError;
  String? get idProgramStudi => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KelasModelCopyWith<KelasModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KelasModelCopyWith<$Res> {
  factory $KelasModelCopyWith(
          KelasModel value, $Res Function(KelasModel) then) =
      _$KelasModelCopyWithImpl<$Res, KelasModel>;
  @useResult
  $Res call(
      {String id,
      List<String> nama,
      int tahunAngkatan,
      @JsonKey(fromJson: KelasType.fromInt, toJson: KelasType.toInt)
      KelasType jenis,
      String? idProgramStudi});
}

/// @nodoc
class _$KelasModelCopyWithImpl<$Res, $Val extends KelasModel>
    implements $KelasModelCopyWith<$Res> {
  _$KelasModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nama = null,
    Object? tahunAngkatan = null,
    Object? jenis = null,
    Object? idProgramStudi = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nama: null == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tahunAngkatan: null == tahunAngkatan
          ? _value.tahunAngkatan
          : tahunAngkatan // ignore: cast_nullable_to_non_nullable
              as int,
      jenis: null == jenis
          ? _value.jenis
          : jenis // ignore: cast_nullable_to_non_nullable
              as KelasType,
      idProgramStudi: freezed == idProgramStudi
          ? _value.idProgramStudi
          : idProgramStudi // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_KelasModelCopyWith<$Res>
    implements $KelasModelCopyWith<$Res> {
  factory _$$_KelasModelCopyWith(
          _$_KelasModel value, $Res Function(_$_KelasModel) then) =
      __$$_KelasModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      List<String> nama,
      int tahunAngkatan,
      @JsonKey(fromJson: KelasType.fromInt, toJson: KelasType.toInt)
      KelasType jenis,
      String? idProgramStudi});
}

/// @nodoc
class __$$_KelasModelCopyWithImpl<$Res>
    extends _$KelasModelCopyWithImpl<$Res, _$_KelasModel>
    implements _$$_KelasModelCopyWith<$Res> {
  __$$_KelasModelCopyWithImpl(
      _$_KelasModel _value, $Res Function(_$_KelasModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nama = null,
    Object? tahunAngkatan = null,
    Object? jenis = null,
    Object? idProgramStudi = freezed,
  }) {
    return _then(_$_KelasModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nama: null == nama
          ? _value._nama
          : nama // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tahunAngkatan: null == tahunAngkatan
          ? _value.tahunAngkatan
          : tahunAngkatan // ignore: cast_nullable_to_non_nullable
              as int,
      jenis: null == jenis
          ? _value.jenis
          : jenis // ignore: cast_nullable_to_non_nullable
              as KelasType,
      idProgramStudi: freezed == idProgramStudi
          ? _value.idProgramStudi
          : idProgramStudi // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_KelasModel extends _KelasModel {
  const _$_KelasModel(
      {required this.id,
      required final List<String> nama,
      required this.tahunAngkatan,
      @JsonKey(fromJson: KelasType.fromInt, toJson: KelasType.toInt)
      required this.jenis,
      this.idProgramStudi})
      : _nama = nama,
        super._();

  factory _$_KelasModel.fromJson(Map<String, dynamic> json) =>
      _$$_KelasModelFromJson(json);

  @override
  final String id;
  final List<String> _nama;
  @override
  List<String> get nama {
    if (_nama is EqualUnmodifiableListView) return _nama;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nama);
  }

  @override
  final int tahunAngkatan;
  @override
  @JsonKey(fromJson: KelasType.fromInt, toJson: KelasType.toInt)
  final KelasType jenis;
  @override
  final String? idProgramStudi;

  @override
  String toString() {
    return 'KelasModel(id: $id, nama: $nama, tahunAngkatan: $tahunAngkatan, jenis: $jenis, idProgramStudi: $idProgramStudi)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_KelasModel &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._nama, _nama) &&
            (identical(other.tahunAngkatan, tahunAngkatan) ||
                other.tahunAngkatan == tahunAngkatan) &&
            (identical(other.jenis, jenis) || other.jenis == jenis) &&
            (identical(other.idProgramStudi, idProgramStudi) ||
                other.idProgramStudi == idProgramStudi));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_nama),
      tahunAngkatan,
      jenis,
      idProgramStudi);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_KelasModelCopyWith<_$_KelasModel> get copyWith =>
      __$$_KelasModelCopyWithImpl<_$_KelasModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KelasModelToJson(
      this,
    );
  }
}

abstract class _KelasModel extends KelasModel {
  const factory _KelasModel(
      {required final String id,
      required final List<String> nama,
      required final int tahunAngkatan,
      @JsonKey(fromJson: KelasType.fromInt, toJson: KelasType.toInt)
      required final KelasType jenis,
      final String? idProgramStudi}) = _$_KelasModel;
  const _KelasModel._() : super._();

  factory _KelasModel.fromJson(Map<String, dynamic> json) =
      _$_KelasModel.fromJson;

  @override
  String get id;
  @override
  List<String> get nama;
  @override
  int get tahunAngkatan;
  @override
  @JsonKey(fromJson: KelasType.fromInt, toJson: KelasType.toInt)
  KelasType get jenis;
  @override
  String? get idProgramStudi;
  @override
  @JsonKey(ignore: true)
  _$$_KelasModelCopyWith<_$_KelasModel> get copyWith =>
      throw _privateConstructorUsedError;
}
