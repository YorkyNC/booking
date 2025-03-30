// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'camera_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CameraEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get cameraEventCount => throw _privateConstructorUsedError;

  /// Create a copy of CameraEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CameraEntityCopyWith<CameraEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CameraEntityCopyWith<$Res> {
  factory $CameraEntityCopyWith(
          CameraEntity value, $Res Function(CameraEntity) then) =
      _$CameraEntityCopyWithImpl<$Res, CameraEntity>;
  @useResult
  $Res call({String id, String name, int cameraEventCount});
}

/// @nodoc
class _$CameraEntityCopyWithImpl<$Res, $Val extends CameraEntity>
    implements $CameraEntityCopyWith<$Res> {
  _$CameraEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CameraEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? cameraEventCount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      cameraEventCount: null == cameraEventCount
          ? _value.cameraEventCount
          : cameraEventCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CameraEntityImplCopyWith<$Res>
    implements $CameraEntityCopyWith<$Res> {
  factory _$$CameraEntityImplCopyWith(
          _$CameraEntityImpl value, $Res Function(_$CameraEntityImpl) then) =
      __$$CameraEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, int cameraEventCount});
}

/// @nodoc
class __$$CameraEntityImplCopyWithImpl<$Res>
    extends _$CameraEntityCopyWithImpl<$Res, _$CameraEntityImpl>
    implements _$$CameraEntityImplCopyWith<$Res> {
  __$$CameraEntityImplCopyWithImpl(
      _$CameraEntityImpl _value, $Res Function(_$CameraEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of CameraEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? cameraEventCount = null,
  }) {
    return _then(_$CameraEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      cameraEventCount: null == cameraEventCount
          ? _value.cameraEventCount
          : cameraEventCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CameraEntityImpl implements _CameraEntity {
  _$CameraEntityImpl(
      {required this.id, required this.name, required this.cameraEventCount});

  @override
  final String id;
  @override
  final String name;
  @override
  final int cameraEventCount;

  @override
  String toString() {
    return 'CameraEntity(id: $id, name: $name, cameraEventCount: $cameraEventCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CameraEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.cameraEventCount, cameraEventCount) ||
                other.cameraEventCount == cameraEventCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, cameraEventCount);

  /// Create a copy of CameraEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CameraEntityImplCopyWith<_$CameraEntityImpl> get copyWith =>
      __$$CameraEntityImplCopyWithImpl<_$CameraEntityImpl>(this, _$identity);
}

abstract class _CameraEntity implements CameraEntity {
  factory _CameraEntity(
      {required final String id,
      required final String name,
      required final int cameraEventCount}) = _$CameraEntityImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  int get cameraEventCount;

  /// Create a copy of CameraEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CameraEntityImplCopyWith<_$CameraEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
