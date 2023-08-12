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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PengampuModel _$PengampuModelFromJson(Map<String, dynamic> json) {
  return _PengampuModel.fromJson(json);
}

/// @nodoc
mixin _$PengampuModel {
  String get id => throw _privateConstructorUsedError;
  String get idMatakuliah => throw _privateConstructorUsedError;
  String get idDosen => throw _privateConstructorUsedError;
  String get tahunAkademik => throw _privateConstructorUsedError;
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
      List<PengampuKelasModel> kelas});
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
abstract class _$$_PengampuModelCopyWith<$Res>
    implements $PengampuModelCopyWith<$Res> {
  factory _$$_PengampuModelCopyWith(
          _$_PengampuModel value, $Res Function(_$_PengampuModel) then) =
      __$$_PengampuModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String idMatakuliah,
      String idDosen,
      String tahunAkademik,
      List<PengampuKelasModel> kelas});
}

/// @nodoc
class __$$_PengampuModelCopyWithImpl<$Res>
    extends _$PengampuModelCopyWithImpl<$Res, _$_PengampuModel>
    implements _$$_PengampuModelCopyWith<$Res> {
  __$$_PengampuModelCopyWithImpl(
      _$_PengampuModel _value, $Res Function(_$_PengampuModel) _then)
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
    return _then(_$_PengampuModel(
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
class _$_PengampuModel extends _PengampuModel {
  const _$_PengampuModel(
      {required this.id,
      required this.idMatakuliah,
      required this.idDosen,
      required this.tahunAkademik,
      required final List<PengampuKelasModel> kelas})
      : _kelas = kelas,
        super._();

  factory _$_PengampuModel.fromJson(Map<String, dynamic> json) =>
      _$$_PengampuModelFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PengampuModel &&
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
  _$$_PengampuModelCopyWith<_$_PengampuModel> get copyWith =>
      __$$_PengampuModelCopyWithImpl<_$_PengampuModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PengampuModelToJson(
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
      required final List<PengampuKelasModel> kelas}) = _$_PengampuModel;
  const _PengampuModel._() : super._();

  factory _PengampuModel.fromJson(Map<String, dynamic> json) =
      _$_PengampuModel.fromJson;

  @override
  String get id;
  @override
  String get idMatakuliah;
  @override
  String get idDosen;
  @override
  String get tahunAkademik;
  @override
  List<PengampuKelasModel> get kelas;
  @override
  @JsonKey(ignore: true)
  _$$_PengampuModelCopyWith<_$_PengampuModel> get copyWith =>
      throw _privateConstructorUsedError;
}

PengampuKelasModel _$PengampuKelasModelFromJson(Map<String, dynamic> json) {
  return _PengampuKelasModel.fromJson(json);
}

/// @nodoc
mixin _$PengampuKelasModel {
  String get id => throw _privateConstructorUsedError;
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
  $Res call({String id, String idKelas, String kelas});
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
    Object? idKelas = null,
    Object? kelas = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_PengampuKelasModelCopyWith<$Res>
    implements $PengampuKelasModelCopyWith<$Res> {
  factory _$$_PengampuKelasModelCopyWith(_$_PengampuKelasModel value,
          $Res Function(_$_PengampuKelasModel) then) =
      __$$_PengampuKelasModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String idKelas, String kelas});
}

/// @nodoc
class __$$_PengampuKelasModelCopyWithImpl<$Res>
    extends _$PengampuKelasModelCopyWithImpl<$Res, _$_PengampuKelasModel>
    implements _$$_PengampuKelasModelCopyWith<$Res> {
  __$$_PengampuKelasModelCopyWithImpl(
      _$_PengampuKelasModel _value, $Res Function(_$_PengampuKelasModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? idKelas = null,
    Object? kelas = null,
  }) {
    return _then(_$_PengampuKelasModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
class _$_PengampuKelasModel extends _PengampuKelasModel {
  const _$_PengampuKelasModel(
      {required this.id, required this.idKelas, required this.kelas})
      : super._();

  factory _$_PengampuKelasModel.fromJson(Map<String, dynamic> json) =>
      _$$_PengampuKelasModelFromJson(json);

  @override
  final String id;
  @override
  final String idKelas;
  @override
  final String kelas;

  @override
  String toString() {
    return 'PengampuKelasModel(id: $id, idKelas: $idKelas, kelas: $kelas)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PengampuKelasModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.idKelas, idKelas) || other.idKelas == idKelas) &&
            (identical(other.kelas, kelas) || other.kelas == kelas));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, idKelas, kelas);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PengampuKelasModelCopyWith<_$_PengampuKelasModel> get copyWith =>
      __$$_PengampuKelasModelCopyWithImpl<_$_PengampuKelasModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PengampuKelasModelToJson(
      this,
    );
  }
}

abstract class _PengampuKelasModel extends PengampuKelasModel {
  const factory _PengampuKelasModel(
      {required final String id,
      required final String idKelas,
      required final String kelas}) = _$_PengampuKelasModel;
  const _PengampuKelasModel._() : super._();

  factory _PengampuKelasModel.fromJson(Map<String, dynamic> json) =
      _$_PengampuKelasModel.fromJson;

  @override
  String get id;
  @override
  String get idKelas;
  @override
  String get kelas;
  @override
  @JsonKey(ignore: true)
  _$$_PengampuKelasModelCopyWith<_$_PengampuKelasModel> get copyWith =>
      throw _privateConstructorUsedError;
}
