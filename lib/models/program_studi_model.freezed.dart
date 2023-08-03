// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'program_studi_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProgramStudiModel _$ProgramStudiModelFromJson(Map<String, dynamic> json) {
  return _ProgramStudiModel.fromJson(json);
}

/// @nodoc
mixin _$ProgramStudiModel {
  String get id => throw _privateConstructorUsedError;
  String get nama => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_fakultas', toJson: FakultasModel.toId)
  FakultasModel? get fakultas => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProgramStudiModelCopyWith<ProgramStudiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgramStudiModelCopyWith<$Res> {
  factory $ProgramStudiModelCopyWith(
          ProgramStudiModel value, $Res Function(ProgramStudiModel) then) =
      _$ProgramStudiModelCopyWithImpl<$Res, ProgramStudiModel>;
  @useResult
  $Res call(
      {String id,
      String nama,
      @JsonKey(name: 'id_fakultas', toJson: FakultasModel.toId)
      FakultasModel? fakultas});

  $FakultasModelCopyWith<$Res>? get fakultas;
}

/// @nodoc
class _$ProgramStudiModelCopyWithImpl<$Res, $Val extends ProgramStudiModel>
    implements $ProgramStudiModelCopyWith<$Res> {
  _$ProgramStudiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nama = null,
    Object? fakultas = freezed,
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
      fakultas: freezed == fakultas
          ? _value.fakultas
          : fakultas // ignore: cast_nullable_to_non_nullable
              as FakultasModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FakultasModelCopyWith<$Res>? get fakultas {
    if (_value.fakultas == null) {
      return null;
    }

    return $FakultasModelCopyWith<$Res>(_value.fakultas!, (value) {
      return _then(_value.copyWith(fakultas: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProgramStudiModelCopyWith<$Res>
    implements $ProgramStudiModelCopyWith<$Res> {
  factory _$$_ProgramStudiModelCopyWith(_$_ProgramStudiModel value,
          $Res Function(_$_ProgramStudiModel) then) =
      __$$_ProgramStudiModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String nama,
      @JsonKey(name: 'id_fakultas', toJson: FakultasModel.toId)
      FakultasModel? fakultas});

  @override
  $FakultasModelCopyWith<$Res>? get fakultas;
}

/// @nodoc
class __$$_ProgramStudiModelCopyWithImpl<$Res>
    extends _$ProgramStudiModelCopyWithImpl<$Res, _$_ProgramStudiModel>
    implements _$$_ProgramStudiModelCopyWith<$Res> {
  __$$_ProgramStudiModelCopyWithImpl(
      _$_ProgramStudiModel _value, $Res Function(_$_ProgramStudiModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nama = null,
    Object? fakultas = freezed,
  }) {
    return _then(_$_ProgramStudiModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nama: null == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String,
      fakultas: freezed == fakultas
          ? _value.fakultas
          : fakultas // ignore: cast_nullable_to_non_nullable
              as FakultasModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProgramStudiModel extends _ProgramStudiModel {
  const _$_ProgramStudiModel(
      {required this.id,
      required this.nama,
      @JsonKey(name: 'id_fakultas', toJson: FakultasModel.toId)
      required this.fakultas})
      : super._();

  factory _$_ProgramStudiModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProgramStudiModelFromJson(json);

  @override
  final String id;
  @override
  final String nama;
  @override
  @JsonKey(name: 'id_fakultas', toJson: FakultasModel.toId)
  final FakultasModel? fakultas;

  @override
  String toString() {
    return 'ProgramStudiModel(id: $id, nama: $nama, fakultas: $fakultas)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProgramStudiModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.fakultas, fakultas) ||
                other.fakultas == fakultas));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, nama, fakultas);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProgramStudiModelCopyWith<_$_ProgramStudiModel> get copyWith =>
      __$$_ProgramStudiModelCopyWithImpl<_$_ProgramStudiModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProgramStudiModelToJson(
      this,
    );
  }
}

abstract class _ProgramStudiModel extends ProgramStudiModel {
  const factory _ProgramStudiModel(
      {required final String id,
      required final String nama,
      @JsonKey(name: 'id_fakultas', toJson: FakultasModel.toId)
      required final FakultasModel? fakultas}) = _$_ProgramStudiModel;
  const _ProgramStudiModel._() : super._();

  factory _ProgramStudiModel.fromJson(Map<String, dynamic> json) =
      _$_ProgramStudiModel.fromJson;

  @override
  String get id;
  @override
  String get nama;
  @override
  @JsonKey(name: 'id_fakultas', toJson: FakultasModel.toId)
  FakultasModel? get fakultas;
  @override
  @JsonKey(ignore: true)
  _$$_ProgramStudiModelCopyWith<_$_ProgramStudiModel> get copyWith =>
      throw _privateConstructorUsedError;
}
