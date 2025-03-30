// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'role_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RoleEntity _$RoleEntityFromJson(Map<String, dynamic> json) {
  return _RoleEntity.fromJson(json);
}

/// @nodoc
mixin _$RoleEntity {
  String get title => throw _privateConstructorUsedError;
  String? get childId => throw _privateConstructorUsedError;
  String? get courseId => throw _privateConstructorUsedError;

  /// Serializes this RoleEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RoleEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RoleEntityCopyWith<RoleEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoleEntityCopyWith<$Res> {
  factory $RoleEntityCopyWith(
          RoleEntity value, $Res Function(RoleEntity) then) =
      _$RoleEntityCopyWithImpl<$Res, RoleEntity>;
  @useResult
  $Res call({String title, String? childId, String? courseId});
}

/// @nodoc
class _$RoleEntityCopyWithImpl<$Res, $Val extends RoleEntity>
    implements $RoleEntityCopyWith<$Res> {
  _$RoleEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RoleEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? childId = freezed,
    Object? courseId = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      childId: freezed == childId
          ? _value.childId
          : childId // ignore: cast_nullable_to_non_nullable
              as String?,
      courseId: freezed == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoleEntityImplCopyWith<$Res>
    implements $RoleEntityCopyWith<$Res> {
  factory _$$RoleEntityImplCopyWith(
          _$RoleEntityImpl value, $Res Function(_$RoleEntityImpl) then) =
      __$$RoleEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String? childId, String? courseId});
}

/// @nodoc
class __$$RoleEntityImplCopyWithImpl<$Res>
    extends _$RoleEntityCopyWithImpl<$Res, _$RoleEntityImpl>
    implements _$$RoleEntityImplCopyWith<$Res> {
  __$$RoleEntityImplCopyWithImpl(
      _$RoleEntityImpl _value, $Res Function(_$RoleEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of RoleEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? childId = freezed,
    Object? courseId = freezed,
  }) {
    return _then(_$RoleEntityImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      childId: freezed == childId
          ? _value.childId
          : childId // ignore: cast_nullable_to_non_nullable
              as String?,
      courseId: freezed == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoleEntityImpl implements _RoleEntity {
  const _$RoleEntityImpl({required this.title, this.childId, this.courseId});

  factory _$RoleEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoleEntityImplFromJson(json);

  @override
  final String title;
  @override
  final String? childId;
  @override
  final String? courseId;

  @override
  String toString() {
    return 'RoleEntity(title: $title, childId: $childId, courseId: $courseId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoleEntityImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.childId, childId) || other.childId == childId) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, childId, courseId);

  /// Create a copy of RoleEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoleEntityImplCopyWith<_$RoleEntityImpl> get copyWith =>
      __$$RoleEntityImplCopyWithImpl<_$RoleEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoleEntityImplToJson(
      this,
    );
  }
}

abstract class _RoleEntity implements RoleEntity {
  const factory _RoleEntity(
      {required final String title,
      final String? childId,
      final String? courseId}) = _$RoleEntityImpl;

  factory _RoleEntity.fromJson(Map<String, dynamic> json) =
      _$RoleEntityImpl.fromJson;

  @override
  String get title;
  @override
  String? get childId;
  @override
  String? get courseId;

  /// Create a copy of RoleEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoleEntityImplCopyWith<_$RoleEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
