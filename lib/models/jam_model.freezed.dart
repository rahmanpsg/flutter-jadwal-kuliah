// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jam_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

JamModel _$JamModelFromJson(Map<String, dynamic> json) {
  return _JamModel.fromJson(json);
}

/// @nodoc
mixin _$JamModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: TimeOfDayExtension.fromJson, toJson: TimeOfDayExtension.toJson)
  TimeOfDay get mulai => throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: TimeOfDayExtension.fromJson, toJson: TimeOfDayExtension.toJson)
  TimeOfDay get selesai => throw _privateConstructorUsedError;
  bool get aktif => throw _privateConstructorUsedError;
  String? get keterangan => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JamModelCopyWith<JamModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JamModelCopyWith<$Res> {
  factory $JamModelCopyWith(JamModel value, $Res Function(JamModel) then) =
      _$JamModelCopyWithImpl<$Res, JamModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(
          fromJson: TimeOfDayExtension.fromJson,
          toJson: TimeOfDayExtension.toJson)
      TimeOfDay mulai,
      @JsonKey(
          fromJson: TimeOfDayExtension.fromJson,
          toJson: TimeOfDayExtension.toJson)
      TimeOfDay selesai,
      bool aktif,
      String? keterangan});
}

/// @nodoc
class _$JamModelCopyWithImpl<$Res, $Val extends JamModel>
    implements $JamModelCopyWith<$Res> {
  _$JamModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mulai = null,
    Object? selesai = null,
    Object? aktif = null,
    Object? keterangan = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      mulai: null == mulai
          ? _value.mulai
          : mulai // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      selesai: null == selesai
          ? _value.selesai
          : selesai // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      aktif: null == aktif
          ? _value.aktif
          : aktif // ignore: cast_nullable_to_non_nullable
              as bool,
      keterangan: freezed == keterangan
          ? _value.keterangan
          : keterangan // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JamModelImplCopyWith<$Res>
    implements $JamModelCopyWith<$Res> {
  factory _$$JamModelImplCopyWith(
          _$JamModelImpl value, $Res Function(_$JamModelImpl) then) =
      __$$JamModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(
          fromJson: TimeOfDayExtension.fromJson,
          toJson: TimeOfDayExtension.toJson)
      TimeOfDay mulai,
      @JsonKey(
          fromJson: TimeOfDayExtension.fromJson,
          toJson: TimeOfDayExtension.toJson)
      TimeOfDay selesai,
      bool aktif,
      String? keterangan});
}

/// @nodoc
class __$$JamModelImplCopyWithImpl<$Res>
    extends _$JamModelCopyWithImpl<$Res, _$JamModelImpl>
    implements _$$JamModelImplCopyWith<$Res> {
  __$$JamModelImplCopyWithImpl(
      _$JamModelImpl _value, $Res Function(_$JamModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mulai = null,
    Object? selesai = null,
    Object? aktif = null,
    Object? keterangan = freezed,
  }) {
    return _then(_$JamModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      mulai: null == mulai
          ? _value.mulai
          : mulai // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      selesai: null == selesai
          ? _value.selesai
          : selesai // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      aktif: null == aktif
          ? _value.aktif
          : aktif // ignore: cast_nullable_to_non_nullable
              as bool,
      keterangan: freezed == keterangan
          ? _value.keterangan
          : keterangan // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JamModelImpl extends _JamModel {
  const _$JamModelImpl(
      {required this.id,
      @JsonKey(
          fromJson: TimeOfDayExtension.fromJson,
          toJson: TimeOfDayExtension.toJson)
      required this.mulai,
      @JsonKey(
          fromJson: TimeOfDayExtension.fromJson,
          toJson: TimeOfDayExtension.toJson)
      required this.selesai,
      required this.aktif,
      this.keterangan})
      : super._();

  factory _$JamModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$JamModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(
      fromJson: TimeOfDayExtension.fromJson, toJson: TimeOfDayExtension.toJson)
  final TimeOfDay mulai;
  @override
  @JsonKey(
      fromJson: TimeOfDayExtension.fromJson, toJson: TimeOfDayExtension.toJson)
  final TimeOfDay selesai;
  @override
  final bool aktif;
  @override
  final String? keterangan;

  @override
  String toString() {
    return 'JamModel(id: $id, mulai: $mulai, selesai: $selesai, aktif: $aktif, keterangan: $keterangan)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JamModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mulai, mulai) || other.mulai == mulai) &&
            (identical(other.selesai, selesai) || other.selesai == selesai) &&
            (identical(other.aktif, aktif) || other.aktif == aktif) &&
            (identical(other.keterangan, keterangan) ||
                other.keterangan == keterangan));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, mulai, selesai, aktif, keterangan);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JamModelImplCopyWith<_$JamModelImpl> get copyWith =>
      __$$JamModelImplCopyWithImpl<_$JamModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JamModelImplToJson(
      this,
    );
  }
}

abstract class _JamModel extends JamModel {
  const factory _JamModel(
      {required final String id,
      @JsonKey(
          fromJson: TimeOfDayExtension.fromJson,
          toJson: TimeOfDayExtension.toJson)
      required final TimeOfDay mulai,
      @JsonKey(
          fromJson: TimeOfDayExtension.fromJson,
          toJson: TimeOfDayExtension.toJson)
      required final TimeOfDay selesai,
      required final bool aktif,
      final String? keterangan}) = _$JamModelImpl;
  const _JamModel._() : super._();

  factory _JamModel.fromJson(Map<String, dynamic> json) =
      _$JamModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(
      fromJson: TimeOfDayExtension.fromJson, toJson: TimeOfDayExtension.toJson)
  TimeOfDay get mulai;
  @override
  @JsonKey(
      fromJson: TimeOfDayExtension.fromJson, toJson: TimeOfDayExtension.toJson)
  TimeOfDay get selesai;
  @override
  bool get aktif;
  @override
  String? get keterangan;
  @override
  @JsonKey(ignore: true)
  _$$JamModelImplCopyWith<_$JamModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
