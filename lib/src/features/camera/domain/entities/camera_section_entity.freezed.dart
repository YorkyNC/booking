// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'camera_section_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CameraSectionEntity {
  String get id => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  int get floor => throw _privateConstructorUsedError;
  int get cameraCount => throw _privateConstructorUsedError;
  int get eventCount => throw _privateConstructorUsedError;
  List<CameraEntity> get cameras => throw _privateConstructorUsedError;

  /// Create a copy of CameraSectionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CameraSectionEntityCopyWith<CameraSectionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CameraSectionEntityCopyWith<$Res> {
  factory $CameraSectionEntityCopyWith(
          CameraSectionEntity value, $Res Function(CameraSectionEntity) then) =
      _$CameraSectionEntityCopyWithImpl<$Res, CameraSectionEntity>;
  @useResult
  $Res call(
      {String id,
      String location,
      int floor,
      int cameraCount,
      int eventCount,
      List<CameraEntity> cameras});
}

/// @nodoc
class _$CameraSectionEntityCopyWithImpl<$Res, $Val extends CameraSectionEntity>
    implements $CameraSectionEntityCopyWith<$Res> {
  _$CameraSectionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CameraSectionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? location = null,
    Object? floor = null,
    Object? cameraCount = null,
    Object? eventCount = null,
    Object? cameras = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      floor: null == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as int,
      cameraCount: null == cameraCount
          ? _value.cameraCount
          : cameraCount // ignore: cast_nullable_to_non_nullable
              as int,
      eventCount: null == eventCount
          ? _value.eventCount
          : eventCount // ignore: cast_nullable_to_non_nullable
              as int,
      cameras: null == cameras
          ? _value.cameras
          : cameras // ignore: cast_nullable_to_non_nullable
              as List<CameraEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CameraSectionEntityImplCopyWith<$Res>
    implements $CameraSectionEntityCopyWith<$Res> {
  factory _$$CameraSectionEntityImplCopyWith(_$CameraSectionEntityImpl value,
          $Res Function(_$CameraSectionEntityImpl) then) =
      __$$CameraSectionEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String location,
      int floor,
      int cameraCount,
      int eventCount,
      List<CameraEntity> cameras});
}

/// @nodoc
class __$$CameraSectionEntityImplCopyWithImpl<$Res>
    extends _$CameraSectionEntityCopyWithImpl<$Res, _$CameraSectionEntityImpl>
    implements _$$CameraSectionEntityImplCopyWith<$Res> {
  __$$CameraSectionEntityImplCopyWithImpl(_$CameraSectionEntityImpl _value,
      $Res Function(_$CameraSectionEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of CameraSectionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? location = null,
    Object? floor = null,
    Object? cameraCount = null,
    Object? eventCount = null,
    Object? cameras = null,
  }) {
    return _then(_$CameraSectionEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      floor: null == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as int,
      cameraCount: null == cameraCount
          ? _value.cameraCount
          : cameraCount // ignore: cast_nullable_to_non_nullable
              as int,
      eventCount: null == eventCount
          ? _value.eventCount
          : eventCount // ignore: cast_nullable_to_non_nullable
              as int,
      cameras: null == cameras
          ? _value._cameras
          : cameras // ignore: cast_nullable_to_non_nullable
              as List<CameraEntity>,
    ));
  }
}

/// @nodoc

class _$CameraSectionEntityImpl implements _CameraSectionEntity {
  const _$CameraSectionEntityImpl(
      {required this.id,
      required this.location,
      required this.floor,
      required this.cameraCount,
      required this.eventCount,
      required final List<CameraEntity> cameras})
      : _cameras = cameras;

  @override
  final String id;
  @override
  final String location;
  @override
  final int floor;
  @override
  final int cameraCount;
  @override
  final int eventCount;
  final List<CameraEntity> _cameras;
  @override
  List<CameraEntity> get cameras {
    if (_cameras is EqualUnmodifiableListView) return _cameras;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cameras);
  }

  @override
  String toString() {
    return 'CameraSectionEntity(id: $id, location: $location, floor: $floor, cameraCount: $cameraCount, eventCount: $eventCount, cameras: $cameras)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CameraSectionEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.floor, floor) || other.floor == floor) &&
            (identical(other.cameraCount, cameraCount) ||
                other.cameraCount == cameraCount) &&
            (identical(other.eventCount, eventCount) ||
                other.eventCount == eventCount) &&
            const DeepCollectionEquality().equals(other._cameras, _cameras));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, location, floor, cameraCount,
      eventCount, const DeepCollectionEquality().hash(_cameras));

  /// Create a copy of CameraSectionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CameraSectionEntityImplCopyWith<_$CameraSectionEntityImpl> get copyWith =>
      __$$CameraSectionEntityImplCopyWithImpl<_$CameraSectionEntityImpl>(
          this, _$identity);
}

abstract class _CameraSectionEntity implements CameraSectionEntity {
  const factory _CameraSectionEntity(
      {required final String id,
      required final String location,
      required final int floor,
      required final int cameraCount,
      required final int eventCount,
      required final List<CameraEntity> cameras}) = _$CameraSectionEntityImpl;

  @override
  String get id;
  @override
  String get location;
  @override
  int get floor;
  @override
  int get cameraCount;
  @override
  int get eventCount;
  @override
  List<CameraEntity> get cameras;

  /// Create a copy of CameraSectionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CameraSectionEntityImplCopyWith<_$CameraSectionEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
