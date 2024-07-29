// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fakultas_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FakultasModel _$FakultasModelFromJson(Map<String, dynamic> json) {
  return _FakultasModel.fromJson(json);
}

/// @nodoc
mixin _$FakultasModel {
  String get id => throw _privateConstructorUsedError;
  String get nama => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FakultasModelCopyWith<FakultasModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FakultasModelCopyWith<$Res> {
  factory $FakultasModelCopyWith(
          FakultasModel value, $Res Function(FakultasModel) then) =
      _$FakultasModelCopyWithImpl<$Res, FakultasModel>;
  @useResult
  $Res call({String id, String nama});
}

/// @nodoc
class _$FakultasModelCopyWithImpl<$Res, $Val extends FakultasModel>
    implements $FakultasModelCopyWith<$Res> {
  _$FakultasModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nama = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nama: null == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FakultasModelImplCopyWith<$Res>
    implements $FakultasModelCopyWith<$Res> {
  factory _$$FakultasModelImplCopyWith(
          _$FakultasModelImpl value, $Res Function(_$FakultasModelImpl) then) =
      __$$FakultasModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String nama});
}

/// @nodoc
class __$$FakultasModelImplCopyWithImpl<$Res>
    extends _$FakultasModelCopyWithImpl<$Res, _$FakultasModelImpl>
    implements _$$FakultasModelImplCopyWith<$Res> {
  __$$FakultasModelImplCopyWithImpl(
      _$FakultasModelImpl _value, $Res Function(_$FakultasModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nama = null,
  }) {
    return _then(_$FakultasModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nama: null == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FakultasModelImpl extends _FakultasModel {
  const _$FakultasModelImpl({required this.id, required this.nama}) : super._();

  factory _$FakultasModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FakultasModelImplFromJson(json);

  @override
  final String id;
  @override
  final String nama;

  @override
  String toString() {
    return 'FakultasModel(id: $id, nama: $nama)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FakultasModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nama, nama) || other.nama == nama));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, nama);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FakultasModelImplCopyWith<_$FakultasModelImpl> get copyWith =>
      __$$FakultasModelImplCopyWithImpl<_$FakultasModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FakultasModelImplToJson(
      this,
    );
  }
}

abstract class _FakultasModel extends FakultasModel {
  const factory _FakultasModel(
      {required final String id,
      required final String nama}) = _$FakultasModelImpl;
  const _FakultasModel._() : super._();

  factory _FakultasModel.fromJson(Map<String, dynamic> json) =
      _$FakultasModelImpl.fromJson;

  @override
  String get id;
  @override
  String get nama;
  @override
  @JsonKey(ignore: true)
  _$$FakultasModelImplCopyWith<_$FakultasModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
