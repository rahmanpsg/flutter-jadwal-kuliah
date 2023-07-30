// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dosen_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DosenModel _$DosenModelFromJson(Map<String, dynamic> json) {
  return _DosenModel.fromJson(json);
}

/// @nodoc
mixin _$DosenModel {
  String get id => throw _privateConstructorUsedError;
  String get nbm => throw _privateConstructorUsedError;
  String get nama => throw _privateConstructorUsedError;
  String? get alamat => throw _privateConstructorUsedError;
  String? get nomorTelepon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DosenModelCopyWith<DosenModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DosenModelCopyWith<$Res> {
  factory $DosenModelCopyWith(
          DosenModel value, $Res Function(DosenModel) then) =
      _$DosenModelCopyWithImpl<$Res, DosenModel>;
  @useResult
  $Res call(
      {String id,
      String nbm,
      String nama,
      String? alamat,
      String? nomorTelepon});
}

/// @nodoc
class _$DosenModelCopyWithImpl<$Res, $Val extends DosenModel>
    implements $DosenModelCopyWith<$Res> {
  _$DosenModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nbm = null,
    Object? nama = null,
    Object? alamat = freezed,
    Object? nomorTelepon = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nbm: null == nbm
          ? _value.nbm
          : nbm // ignore: cast_nullable_to_non_nullable
              as String,
      nama: null == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String,
      alamat: freezed == alamat
          ? _value.alamat
          : alamat // ignore: cast_nullable_to_non_nullable
              as String?,
      nomorTelepon: freezed == nomorTelepon
          ? _value.nomorTelepon
          : nomorTelepon // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DosenModelCopyWith<$Res>
    implements $DosenModelCopyWith<$Res> {
  factory _$$_DosenModelCopyWith(
          _$_DosenModel value, $Res Function(_$_DosenModel) then) =
      __$$_DosenModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String nbm,
      String nama,
      String? alamat,
      String? nomorTelepon});
}

/// @nodoc
class __$$_DosenModelCopyWithImpl<$Res>
    extends _$DosenModelCopyWithImpl<$Res, _$_DosenModel>
    implements _$$_DosenModelCopyWith<$Res> {
  __$$_DosenModelCopyWithImpl(
      _$_DosenModel _value, $Res Function(_$_DosenModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nbm = null,
    Object? nama = null,
    Object? alamat = freezed,
    Object? nomorTelepon = freezed,
  }) {
    return _then(_$_DosenModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nbm: null == nbm
          ? _value.nbm
          : nbm // ignore: cast_nullable_to_non_nullable
              as String,
      nama: null == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String,
      alamat: freezed == alamat
          ? _value.alamat
          : alamat // ignore: cast_nullable_to_non_nullable
              as String?,
      nomorTelepon: freezed == nomorTelepon
          ? _value.nomorTelepon
          : nomorTelepon // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DosenModel implements _DosenModel {
  const _$_DosenModel(
      {required this.id,
      required this.nbm,
      required this.nama,
      this.alamat,
      this.nomorTelepon});

  factory _$_DosenModel.fromJson(Map<String, dynamic> json) =>
      _$$_DosenModelFromJson(json);

  @override
  final String id;
  @override
  final String nbm;
  @override
  final String nama;
  @override
  final String? alamat;
  @override
  final String? nomorTelepon;

  @override
  String toString() {
    return 'DosenModel(id: $id, nbm: $nbm, nama: $nama, alamat: $alamat, nomorTelepon: $nomorTelepon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DosenModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nbm, nbm) || other.nbm == nbm) &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.alamat, alamat) || other.alamat == alamat) &&
            (identical(other.nomorTelepon, nomorTelepon) ||
                other.nomorTelepon == nomorTelepon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, nbm, nama, alamat, nomorTelepon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DosenModelCopyWith<_$_DosenModel> get copyWith =>
      __$$_DosenModelCopyWithImpl<_$_DosenModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DosenModelToJson(
      this,
    );
  }
}

abstract class _DosenModel implements DosenModel {
  const factory _DosenModel(
      {required final String id,
      required final String nbm,
      required final String nama,
      final String? alamat,
      final String? nomorTelepon}) = _$_DosenModel;

  factory _DosenModel.fromJson(Map<String, dynamic> json) =
      _$_DosenModel.fromJson;

  @override
  String get id;
  @override
  String get nbm;
  @override
  String get nama;
  @override
  String? get alamat;
  @override
  String? get nomorTelepon;
  @override
  @JsonKey(ignore: true)
  _$$_DosenModelCopyWith<_$_DosenModel> get copyWith =>
      throw _privateConstructorUsedError;
}
