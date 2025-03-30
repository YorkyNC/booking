// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'school_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SchoolEntity _$SchoolEntityFromJson(Map<String, dynamic> json) {
  return _SchoolEntity.fromJson(json);
}

/// @nodoc
mixin _$SchoolEntity {
  String get id => throw _privateConstructorUsedError;
  String? get jobType => throw _privateConstructorUsedError;
  List<ClassEntity> get classes => throw _privateConstructorUsedError;
  String? get teacherId => throw _privateConstructorUsedError;

  /// Serializes this SchoolEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SchoolEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SchoolEntityCopyWith<SchoolEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SchoolEntityCopyWith<$Res> {
  factory $SchoolEntityCopyWith(
          SchoolEntity value, $Res Function(SchoolEntity) then) =
      _$SchoolEntityCopyWithImpl<$Res, SchoolEntity>;
  @useResult
  $Res call(
      {String id,
      String? jobType,
      List<ClassEntity> classes,
      String? teacherId});
}

/// @nodoc
class _$SchoolEntityCopyWithImpl<$Res, $Val extends SchoolEntity>
    implements $SchoolEntityCopyWith<$Res> {
  _$SchoolEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SchoolEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? jobType = freezed,
    Object? classes = null,
    Object? teacherId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      jobType: freezed == jobType
          ? _value.jobType
          : jobType // ignore: cast_nullable_to_non_nullable
              as String?,
      classes: null == classes
          ? _value.classes
          : classes // ignore: cast_nullable_to_non_nullable
              as List<ClassEntity>,
      teacherId: freezed == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SchoolEntityImplCopyWith<$Res>
    implements $SchoolEntityCopyWith<$Res> {
  factory _$$SchoolEntityImplCopyWith(
          _$SchoolEntityImpl value, $Res Function(_$SchoolEntityImpl) then) =
      __$$SchoolEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? jobType,
      List<ClassEntity> classes,
      String? teacherId});
}

/// @nodoc
class __$$SchoolEntityImplCopyWithImpl<$Res>
    extends _$SchoolEntityCopyWithImpl<$Res, _$SchoolEntityImpl>
    implements _$$SchoolEntityImplCopyWith<$Res> {
  __$$SchoolEntityImplCopyWithImpl(
      _$SchoolEntityImpl _value, $Res Function(_$SchoolEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of SchoolEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? jobType = freezed,
    Object? classes = null,
    Object? teacherId = freezed,
  }) {
    return _then(_$SchoolEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      jobType: freezed == jobType
          ? _value.jobType
          : jobType // ignore: cast_nullable_to_non_nullable
              as String?,
      classes: null == classes
          ? _value._classes
          : classes // ignore: cast_nullable_to_non_nullable
              as List<ClassEntity>,
      teacherId: freezed == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SchoolEntityImpl implements _SchoolEntity {
  const _$SchoolEntityImpl(
      {required this.id,
      this.jobType,
      required final List<ClassEntity> classes,
      this.teacherId})
      : _classes = classes;

  factory _$SchoolEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$SchoolEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String? jobType;
  final List<ClassEntity> _classes;
  @override
  List<ClassEntity> get classes {
    if (_classes is EqualUnmodifiableListView) return _classes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_classes);
  }

  @override
  final String? teacherId;

  @override
  String toString() {
    return 'SchoolEntity(id: $id, jobType: $jobType, classes: $classes, teacherId: $teacherId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SchoolEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.jobType, jobType) || other.jobType == jobType) &&
            const DeepCollectionEquality().equals(other._classes, _classes) &&
            (identical(other.teacherId, teacherId) ||
                other.teacherId == teacherId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, jobType,
      const DeepCollectionEquality().hash(_classes), teacherId);

  /// Create a copy of SchoolEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SchoolEntityImplCopyWith<_$SchoolEntityImpl> get copyWith =>
      __$$SchoolEntityImplCopyWithImpl<_$SchoolEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SchoolEntityImplToJson(
      this,
    );
  }
}

abstract class _SchoolEntity implements SchoolEntity {
  const factory _SchoolEntity(
      {required final String id,
      final String? jobType,
      required final List<ClassEntity> classes,
      final String? teacherId}) = _$SchoolEntityImpl;

  factory _SchoolEntity.fromJson(Map<String, dynamic> json) =
      _$SchoolEntityImpl.fromJson;

  @override
  String get id;
  @override
  String? get jobType;
  @override
  List<ClassEntity> get classes;
  @override
  String? get teacherId;

  /// Create a copy of SchoolEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SchoolEntityImplCopyWith<_$SchoolEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
