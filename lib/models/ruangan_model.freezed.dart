// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ruangan_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RuanganModel _$RuanganModelFromJson(Map<String, dynamic> json) {
  return _RuanganModel.fromJson(json);
}

/// @nodoc
mixin _$RuanganModel {
  String get id => throw _privateConstructorUsedError;
  String get nama => throw _privateConstructorUsedError;
  String? get idProgramStudi => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RuanganModelCopyWith<RuanganModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RuanganModelCopyWith<$Res> {
  factory $RuanganModelCopyWith(
          RuanganModel value, $Res Function(RuanganModel) then) =
      _$RuanganModelCopyWithImpl<$Res, RuanganModel>;
  @useResult
  $Res call({String id, String nama, String? idProgramStudi});
}

/// @nodoc
class _$RuanganModelCopyWithImpl<$Res, $Val extends RuanganModel>
    implements $RuanganModelCopyWith<$Res> {
  _$RuanganModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nama = null,
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
              as String,
      idProgramStudi: freezed == idProgramStudi
          ? _value.idProgramStudi
          : idProgramStudi // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RuanganModelImplCopyWith<$Res>
    implements $RuanganModelCopyWith<$Res> {
  factory _$$RuanganModelImplCopyWith(
          _$RuanganModelImpl value, $Res Function(_$RuanganModelImpl) then) =
      __$$RuanganModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String nama, String? idProgramStudi});
}

/// @nodoc
class __$$RuanganModelImplCopyWithImpl<$Res>
    extends _$RuanganModelCopyWithImpl<$Res, _$RuanganModelImpl>
    implements _$$RuanganModelImplCopyWith<$Res> {
  __$$RuanganModelImplCopyWithImpl(
      _$RuanganModelImpl _value, $Res Function(_$RuanganModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nama = null,
    Object? idProgramStudi = freezed,
  }) {
    return _then(_$RuanganModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nama: null == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String,
      idProgramStudi: freezed == idProgramStudi
          ? _value.idProgramStudi
          : idProgramStudi // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RuanganModelImpl extends _RuanganModel {
  const _$RuanganModelImpl(
      {required this.id, required this.nama, this.idProgramStudi})
      : super._();

  factory _$RuanganModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RuanganModelImplFromJson(json);

  @override
  final String id;
  @override
  final String nama;
  @override
  final String? idProgramStudi;

  @override
  String toString() {
    return 'RuanganModel(id: $id, nama: $nama, idProgramStudi: $idProgramStudi)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RuanganModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.idProgramStudi, idProgramStudi) ||
                other.idProgramStudi == idProgramStudi));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, nama, idProgramStudi);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RuanganModelImplCopyWith<_$RuanganModelImpl> get copyWith =>
      __$$RuanganModelImplCopyWithImpl<_$RuanganModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RuanganModelImplToJson(
      this,
    );
  }
}

abstract class _RuanganModel extends RuanganModel {
  const factory _RuanganModel(
      {required final String id,
      required final String nama,
      final String? idProgramStudi}) = _$RuanganModelImpl;
  const _RuanganModel._() : super._();

  factory _RuanganModel.fromJson(Map<String, dynamic> json) =
      _$RuanganModelImpl.fromJson;

  @override
  String get id;
  @override
  String get nama;
  @override
  String? get idProgramStudi;
  @override
  @JsonKey(ignore: true)
  _$$RuanganModelImplCopyWith<_$RuanganModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
