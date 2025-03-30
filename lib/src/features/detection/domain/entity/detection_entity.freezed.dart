// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detection_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetectionEntity _$DetectionEntityFromJson(Map<String, dynamic> json) {
  return _DetectionEntity.fromJson(json);
}

/// @nodoc
mixin _$DetectionEntity {
  String get id => throw _privateConstructorUsedError;
  String get subjectName => throw _privateConstructorUsedError;
  ClassEntity get classEntity => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  int? get processingCount => throw _privateConstructorUsedError;
  int? get porcessedCount => throw _privateConstructorUsedError;
  String? get room => throw _privateConstructorUsedError;
  String? get purpose => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  /// Serializes this DetectionEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DetectionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetectionEntityCopyWith<DetectionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetectionEntityCopyWith<$Res> {
  factory $DetectionEntityCopyWith(
          DetectionEntity value, $Res Function(DetectionEntity) then) =
      _$DetectionEntityCopyWithImpl<$Res, DetectionEntity>;
  @useResult
  $Res call(
      {String id,
      String subjectName,
      ClassEntity classEntity,
      DateTime startTime,
      DateTime endTime,
      int? processingCount,
      int? porcessedCount,
      String? room,
      String? purpose,
      String? status});

  $ClassEntityCopyWith<$Res> get classEntity;
}

/// @nodoc
class _$DetectionEntityCopyWithImpl<$Res, $Val extends DetectionEntity>
    implements $DetectionEntityCopyWith<$Res> {
  _$DetectionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetectionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subjectName = null,
    Object? classEntity = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? processingCount = freezed,
    Object? porcessedCount = freezed,
    Object? room = freezed,
    Object? purpose = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      subjectName: null == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String,
      classEntity: null == classEntity
          ? _value.classEntity
          : classEntity // ignore: cast_nullable_to_non_nullable
              as ClassEntity,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      processingCount: freezed == processingCount
          ? _value.processingCount
          : processingCount // ignore: cast_nullable_to_non_nullable
              as int?,
      porcessedCount: freezed == porcessedCount
          ? _value.porcessedCount
          : porcessedCount // ignore: cast_nullable_to_non_nullable
              as int?,
      room: freezed == room
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as String?,
      purpose: freezed == purpose
          ? _value.purpose
          : purpose // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of DetectionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClassEntityCopyWith<$Res> get classEntity {
    return $ClassEntityCopyWith<$Res>(_value.classEntity, (value) {
      return _then(_value.copyWith(classEntity: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetectionEntityImplCopyWith<$Res>
    implements $DetectionEntityCopyWith<$Res> {
  factory _$$DetectionEntityImplCopyWith(_$DetectionEntityImpl value,
          $Res Function(_$DetectionEntityImpl) then) =
      __$$DetectionEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String subjectName,
      ClassEntity classEntity,
      DateTime startTime,
      DateTime endTime,
      int? processingCount,
      int? porcessedCount,
      String? room,
      String? purpose,
      String? status});

  @override
  $ClassEntityCopyWith<$Res> get classEntity;
}

/// @nodoc
class __$$DetectionEntityImplCopyWithImpl<$Res>
    extends _$DetectionEntityCopyWithImpl<$Res, _$DetectionEntityImpl>
    implements _$$DetectionEntityImplCopyWith<$Res> {
  __$$DetectionEntityImplCopyWithImpl(
      _$DetectionEntityImpl _value, $Res Function(_$DetectionEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetectionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subjectName = null,
    Object? classEntity = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? processingCount = freezed,
    Object? porcessedCount = freezed,
    Object? room = freezed,
    Object? purpose = freezed,
    Object? status = freezed,
  }) {
    return _then(_$DetectionEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      subjectName: null == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String,
      classEntity: null == classEntity
          ? _value.classEntity
          : classEntity // ignore: cast_nullable_to_non_nullable
              as ClassEntity,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      processingCount: freezed == processingCount
          ? _value.processingCount
          : processingCount // ignore: cast_nullable_to_non_nullable
              as int?,
      porcessedCount: freezed == porcessedCount
          ? _value.porcessedCount
          : porcessedCount // ignore: cast_nullable_to_non_nullable
              as int?,
      room: freezed == room
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as String?,
      purpose: freezed == purpose
          ? _value.purpose
          : purpose // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetectionEntityImpl implements _DetectionEntity {
  _$DetectionEntityImpl(
      {required this.id,
      required this.subjectName,
      required this.classEntity,
      required this.startTime,
      required this.endTime,
      this.processingCount,
      this.porcessedCount,
      this.room,
      this.purpose,
      this.status});

  factory _$DetectionEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetectionEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String subjectName;
  @override
  final ClassEntity classEntity;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final int? processingCount;
  @override
  final int? porcessedCount;
  @override
  final String? room;
  @override
  final String? purpose;
  @override
  final String? status;

  @override
  String toString() {
    return 'DetectionEntity(id: $id, subjectName: $subjectName, classEntity: $classEntity, startTime: $startTime, endTime: $endTime, processingCount: $processingCount, porcessedCount: $porcessedCount, room: $room, purpose: $purpose, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetectionEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.subjectName, subjectName) ||
                other.subjectName == subjectName) &&
            (identical(other.classEntity, classEntity) ||
                other.classEntity == classEntity) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.processingCount, processingCount) ||
                other.processingCount == processingCount) &&
            (identical(other.porcessedCount, porcessedCount) ||
                other.porcessedCount == porcessedCount) &&
            (identical(other.room, room) || other.room == room) &&
            (identical(other.purpose, purpose) || other.purpose == purpose) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      subjectName,
      classEntity,
      startTime,
      endTime,
      processingCount,
      porcessedCount,
      room,
      purpose,
      status);

  /// Create a copy of DetectionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetectionEntityImplCopyWith<_$DetectionEntityImpl> get copyWith =>
      __$$DetectionEntityImplCopyWithImpl<_$DetectionEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetectionEntityImplToJson(
      this,
    );
  }
}

abstract class _DetectionEntity implements DetectionEntity {
  factory _DetectionEntity(
      {required final String id,
      required final String subjectName,
      required final ClassEntity classEntity,
      required final DateTime startTime,
      required final DateTime endTime,
      final int? processingCount,
      final int? porcessedCount,
      final String? room,
      final String? purpose,
      final String? status}) = _$DetectionEntityImpl;

  factory _DetectionEntity.fromJson(Map<String, dynamic> json) =
      _$DetectionEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get subjectName;
  @override
  ClassEntity get classEntity;
  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  int? get processingCount;
  @override
  int? get porcessedCount;
  @override
  String? get room;
  @override
  String? get purpose;
  @override
  String? get status;

  /// Create a copy of DetectionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetectionEntityImplCopyWith<_$DetectionEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
