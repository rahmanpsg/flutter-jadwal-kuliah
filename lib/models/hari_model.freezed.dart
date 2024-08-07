// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hari_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HariModel _$HariModelFromJson(Map<String, dynamic> json) {
  return _HariModel.fromJson(json);
}

/// @nodoc
mixin _$HariModel {
  String get id => throw _privateConstructorUsedError;
  String get hari => throw _privateConstructorUsedError;
  @JsonKey(fromJson: KelasType.fromListInt, toJson: KelasType.toListInt)
  List<KelasType> get kelas => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HariModelCopyWith<HariModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HariModelCopyWith<$Res> {
  factory $HariModelCopyWith(HariModel value, $Res Function(HariModel) then) =
      _$HariModelCopyWithImpl<$Res, HariModel>;
  @useResult
  $Res call(
      {String id,
      String hari,
      @JsonKey(fromJson: KelasType.fromListInt, toJson: KelasType.toListInt)
      List<KelasType> kelas});
}

/// @nodoc
class _$HariModelCopyWithImpl<$Res, $Val extends HariModel>
    implements $HariModelCopyWith<$Res> {
  _$HariModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? hari = null,
    Object? kelas = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      hari: null == hari
          ? _value.hari
          : hari // ignore: cast_nullable_to_non_nullable
              as String,
      kelas: null == kelas
          ? _value.kelas
          : kelas // ignore: cast_nullable_to_non_nullable
              as List<KelasType>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HariModelImplCopyWith<$Res>
    implements $HariModelCopyWith<$Res> {
  factory _$$HariModelImplCopyWith(
          _$HariModelImpl value, $Res Function(_$HariModelImpl) then) =
      __$$HariModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String hari,
      @JsonKey(fromJson: KelasType.fromListInt, toJson: KelasType.toListInt)
      List<KelasType> kelas});
}

/// @nodoc
class __$$HariModelImplCopyWithImpl<$Res>
    extends _$HariModelCopyWithImpl<$Res, _$HariModelImpl>
    implements _$$HariModelImplCopyWith<$Res> {
  __$$HariModelImplCopyWithImpl(
      _$HariModelImpl _value, $Res Function(_$HariModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? hari = null,
    Object? kelas = null,
  }) {
    return _then(_$HariModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      hari: null == hari
          ? _value.hari
          : hari // ignore: cast_nullable_to_non_nullable
              as String,
      kelas: null == kelas
          ? _value._kelas
          : kelas // ignore: cast_nullable_to_non_nullable
              as List<KelasType>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HariModelImpl extends _HariModel {
  const _$HariModelImpl(
      {required this.id,
      required this.hari,
      @JsonKey(fromJson: KelasType.fromListInt, toJson: KelasType.toListInt)
      required final List<KelasType> kelas})
      : _kelas = kelas,
        super._();

  factory _$HariModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HariModelImplFromJson(json);

  @override
  final String id;
  @override
  final String hari;
  final List<KelasType> _kelas;
  @override
  @JsonKey(fromJson: KelasType.fromListInt, toJson: KelasType.toListInt)
  List<KelasType> get kelas {
    if (_kelas is EqualUnmodifiableListView) return _kelas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_kelas);
  }

  @override
  String toString() {
    return 'HariModel(id: $id, hari: $hari, kelas: $kelas)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HariModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.hari, hari) || other.hari == hari) &&
            const DeepCollectionEquality().equals(other._kelas, _kelas));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, hari, const DeepCollectionEquality().hash(_kelas));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HariModelImplCopyWith<_$HariModelImpl> get copyWith =>
      __$$HariModelImplCopyWithImpl<_$HariModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HariModelImplToJson(
      this,
    );
  }
}

abstract class _HariModel extends HariModel {
  const factory _HariModel(
      {required final String id,
      required final String hari,
      @JsonKey(fromJson: KelasType.fromListInt, toJson: KelasType.toListInt)
      required final List<KelasType> kelas}) = _$HariModelImpl;
  const _HariModel._() : super._();

  factory _HariModel.fromJson(Map<String, dynamic> json) =
      _$HariModelImpl.fromJson;

  @override
  String get id;
  @override
  String get hari;
  @override
  @JsonKey(fromJson: KelasType.fromListInt, toJson: KelasType.toListInt)
  List<KelasType> get kelas;
  @override
  @JsonKey(ignore: true)
  _$$HariModelImplCopyWith<_$HariModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
