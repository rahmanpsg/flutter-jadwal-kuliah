// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pengampu_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PengampuModel _$PengampuModelFromJson(Map<String, dynamic> json) {
  return _PengampuModel.fromJson(json);
}

/// @nodoc
mixin _$PengampuModel {
  String get id => throw _privateConstructorUsedError;
  String get idMatakuliah => throw _privateConstructorUsedError;
  String get idDosen => throw _privateConstructorUsedError;
  String get tahunAkademik => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  List<PengampuKelasModel> get kelas => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PengampuModelCopyWith<PengampuModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PengampuModelCopyWith<$Res> {
  factory $PengampuModelCopyWith(
          PengampuModel value, $Res Function(PengampuModel) then) =
      _$PengampuModelCopyWithImpl<$Res, PengampuModel>;
  @useResult
  $Res call(
      {String id,
      String idMatakuliah,
      String idDosen,
      String tahunAkademik,
      @JsonKey(includeToJson: false) List<PengampuKelasModel> kelas});
}

/// @nodoc
class _$PengampuModelCopyWithImpl<$Res, $Val extends PengampuModel>
    implements $PengampuModelCopyWith<$Res> {
  _$PengampuModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? idMatakuliah = null,
    Object? idDosen = null,
    Object? tahunAkademik = null,
    Object? kelas = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      idMatakuliah: null == idMatakuliah
          ? _value.idMatakuliah
          : idMatakuliah // ignore: cast_nullable_to_non_nullable
              as String,
      idDosen: null == idDosen
          ? _value.idDosen
          : idDosen // ignore: cast_nullable_to_non_nullable
              as String,
      tahunAkademik: null == tahunAkademik
          ? _value.tahunAkademik
          : tahunAkademik // ignore: cast_nullable_to_non_nullable
              as String,
      kelas: null == kelas
          ? _value.kelas
          : kelas // ignore: cast_nullable_to_non_nullable
              as List<PengampuKelasModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PengampuModelImplCopyWith<$Res>
    implements $PengampuModelCopyWith<$Res> {
  factory _$$PengampuModelImplCopyWith(
          _$PengampuModelImpl value, $Res Function(_$PengampuModelImpl) then) =
      __$$PengampuModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String idMatakuliah,
      String idDosen,
      String tahunAkademik,
      @JsonKey(includeToJson: false) List<PengampuKelasModel> kelas});
}

/// @nodoc
class __$$PengampuModelImplCopyWithImpl<$Res>
    extends _$PengampuModelCopyWithImpl<$Res, _$PengampuModelImpl>
    implements _$$PengampuModelImplCopyWith<$Res> {
  __$$PengampuModelImplCopyWithImpl(
      _$PengampuModelImpl _value, $Res Function(_$PengampuModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? idMatakuliah = null,
    Object? idDosen = null,
    Object? tahunAkademik = null,
    Object? kelas = null,
  }) {
    return _then(_$PengampuModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      idMatakuliah: null == idMatakuliah
          ? _value.idMatakuliah
          : idMatakuliah // ignore: cast_nullable_to_non_nullable
              as String,
      idDosen: null == idDosen
          ? _value.idDosen
          : idDosen // ignore: cast_nullable_to_non_nullable
              as String,
      tahunAkademik: null == tahunAkademik
          ? _value.tahunAkademik
          : tahunAkademik // ignore: cast_nullable_to_non_nullable
              as String,
      kelas: null == kelas
          ? _value._kelas
          : kelas // ignore: cast_nullable_to_non_nullable
              as List<PengampuKelasModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PengampuModelImpl extends _PengampuModel {
  const _$PengampuModelImpl(
      {required this.id,
      required this.idMatakuliah,
      required this.idDosen,
      required this.tahunAkademik,
      @JsonKey(includeToJson: false)
      required final List<PengampuKelasModel> kelas})
      : _kelas = kelas,
        super._();

  factory _$PengampuModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PengampuModelImplFromJson(json);

  @override
  final String id;
  @override
  final String idMatakuliah;
  @override
  final String idDosen;
  @override
  final String tahunAkademik;
  final List<PengampuKelasModel> _kelas;
  @override
  @JsonKey(includeToJson: false)
  List<PengampuKelasModel> get kelas {
    if (_kelas is EqualUnmodifiableListView) return _kelas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_kelas);
  }

  @override
  String toString() {
    return 'PengampuModel(id: $id, idMatakuliah: $idMatakuliah, idDosen: $idDosen, tahunAkademik: $tahunAkademik, kelas: $kelas)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PengampuModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.idMatakuliah, idMatakuliah) ||
                other.idMatakuliah == idMatakuliah) &&
            (identical(other.idDosen, idDosen) || other.idDosen == idDosen) &&
            (identical(other.tahunAkademik, tahunAkademik) ||
                other.tahunAkademik == tahunAkademik) &&
            const DeepCollectionEquality().equals(other._kelas, _kelas));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, idMatakuliah, idDosen,
      tahunAkademik, const DeepCollectionEquality().hash(_kelas));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PengampuModelImplCopyWith<_$PengampuModelImpl> get copyWith =>
      __$$PengampuModelImplCopyWithImpl<_$PengampuModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PengampuModelImplToJson(
      this,
    );
  }
}

abstract class _PengampuModel extends PengampuModel {
  const factory _PengampuModel(
      {required final String id,
      required final String idMatakuliah,
      required final String idDosen,
      required final String tahunAkademik,
      @JsonKey(includeToJson: false)
      required final List<PengampuKelasModel> kelas}) = _$PengampuModelImpl;
  const _PengampuModel._() : super._();

  factory _PengampuModel.fromJson(Map<String, dynamic> json) =
      _$PengampuModelImpl.fromJson;

  @override
  String get id;
  @override
  String get idMatakuliah;
  @override
  String get idDosen;
  @override
  String get tahunAkademik;
  @override
  @JsonKey(includeToJson: false)
  List<PengampuKelasModel> get kelas;
  @override
  @JsonKey(ignore: true)
  _$$PengampuModelImplCopyWith<_$PengampuModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PengampuKelasModel _$PengampuKelasModelFromJson(Map<String, dynamic> json) {
  return _PengampuKelasModel.fromJson(json);
}

/// @nodoc
mixin _$PengampuKelasModel {
  String get id => throw _privateConstructorUsedError;
  String get idPengampu => throw _privateConstructorUsedError;
  String get idKelas => throw _privateConstructorUsedError;
  String get kelas => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PengampuKelasModelCopyWith<PengampuKelasModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PengampuKelasModelCopyWith<$Res> {
  factory $PengampuKelasModelCopyWith(
          PengampuKelasModel value, $Res Function(PengampuKelasModel) then) =
      _$PengampuKelasModelCopyWithImpl<$Res, PengampuKelasModel>;
  @useResult
  $Res call({String id, String idPengampu, String idKelas, String kelas});
}

/// @nodoc
class _$PengampuKelasModelCopyWithImpl<$Res, $Val extends PengampuKelasModel>
    implements $PengampuKelasModelCopyWith<$Res> {
  _$PengampuKelasModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? idPengampu = null,
    Object? idKelas = null,
    Object? kelas = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      idPengampu: null == idPengampu
          ? _value.idPengampu
          : idPengampu // ignore: cast_nullable_to_non_nullable
              as String,
      idKelas: null == idKelas
          ? _value.idKelas
          : idKelas // ignore: cast_nullable_to_non_nullable
              as String,
      kelas: null == kelas
          ? _value.kelas
          : kelas // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PengampuKelasModelImplCopyWith<$Res>
    implements $PengampuKelasModelCopyWith<$Res> {
  factory _$$PengampuKelasModelImplCopyWith(_$PengampuKelasModelImpl value,
          $Res Function(_$PengampuKelasModelImpl) then) =
      __$$PengampuKelasModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String idPengampu, String idKelas, String kelas});
}

/// @nodoc
class __$$PengampuKelasModelImplCopyWithImpl<$Res>
    extends _$PengampuKelasModelCopyWithImpl<$Res, _$PengampuKelasModelImpl>
    implements _$$PengampuKelasModelImplCopyWith<$Res> {
  __$$PengampuKelasModelImplCopyWithImpl(_$PengampuKelasModelImpl _value,
      $Res Function(_$PengampuKelasModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? idPengampu = null,
    Object? idKelas = null,
    Object? kelas = null,
  }) {
    return _then(_$PengampuKelasModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      idPengampu: null == idPengampu
          ? _value.idPengampu
          : idPengampu // ignore: cast_nullable_to_non_nullable
              as String,
      idKelas: null == idKelas
          ? _value.idKelas
          : idKelas // ignore: cast_nullable_to_non_nullable
              as String,
      kelas: null == kelas
          ? _value.kelas
          : kelas // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PengampuKelasModelImpl extends _PengampuKelasModel {
  const _$PengampuKelasModelImpl(
      {required this.id,
      required this.idPengampu,
      required this.idKelas,
      required this.kelas})
      : super._();

  factory _$PengampuKelasModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PengampuKelasModelImplFromJson(json);

  @override
  final String id;
  @override
  final String idPengampu;
  @override
  final String idKelas;
  @override
  final String kelas;

  @override
  String toString() {
    return 'PengampuKelasModel(id: $id, idPengampu: $idPengampu, idKelas: $idKelas, kelas: $kelas)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PengampuKelasModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.idPengampu, idPengampu) ||
                other.idPengampu == idPengampu) &&
            (identical(other.idKelas, idKelas) || other.idKelas == idKelas) &&
            (identical(other.kelas, kelas) || other.kelas == kelas));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, idPengampu, idKelas, kelas);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PengampuKelasModelImplCopyWith<_$PengampuKelasModelImpl> get copyWith =>
      __$$PengampuKelasModelImplCopyWithImpl<_$PengampuKelasModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PengampuKelasModelImplToJson(
      this,
    );
  }
}

abstract class _PengampuKelasModel extends PengampuKelasModel {
  const factory _PengampuKelasModel(
      {required final String id,
      required final String idPengampu,
      required final String idKelas,
      required final String kelas}) = _$PengampuKelasModelImpl;
  const _PengampuKelasModel._() : super._();

  factory _PengampuKelasModel.fromJson(Map<String, dynamic> json) =
      _$PengampuKelasModelImpl.fromJson;

  @override
  String get id;
  @override
  String get idPengampu;
  @override
  String get idKelas;
  @override
  String get kelas;
  @override
  @JsonKey(ignore: true)
  _$$PengampuKelasModelImplCopyWith<_$PengampuKelasModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
