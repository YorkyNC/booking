// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permission_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PermissionEntity _$PermissionEntityFromJson(Map<String, dynamic> json) {
  return _PermissionEntity.fromJson(json);
}

/// @nodoc
mixin _$PermissionEntity {
  List<SchoolEntity> get schools => throw _privateConstructorUsedError;

  /// Serializes this PermissionEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PermissionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PermissionEntityCopyWith<PermissionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionEntityCopyWith<$Res> {
  factory $PermissionEntityCopyWith(
          PermissionEntity value, $Res Function(PermissionEntity) then) =
      _$PermissionEntityCopyWithImpl<$Res, PermissionEntity>;
  @useResult
  $Res call({List<SchoolEntity> schools});
}

/// @nodoc
class _$PermissionEntityCopyWithImpl<$Res, $Val extends PermissionEntity>
    implements $PermissionEntityCopyWith<$Res> {
  _$PermissionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PermissionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? schools = null,
  }) {
    return _then(_value.copyWith(
      schools: null == schools
          ? _value.schools
          : schools // ignore: cast_nullable_to_non_nullable
              as List<SchoolEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PermissionEntityImplCopyWith<$Res>
    implements $PermissionEntityCopyWith<$Res> {
  factory _$$PermissionEntityImplCopyWith(_$PermissionEntityImpl value,
          $Res Function(_$PermissionEntityImpl) then) =
      __$$PermissionEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SchoolEntity> schools});
}

/// @nodoc
class __$$PermissionEntityImplCopyWithImpl<$Res>
    extends _$PermissionEntityCopyWithImpl<$Res, _$PermissionEntityImpl>
    implements _$$PermissionEntityImplCopyWith<$Res> {
  __$$PermissionEntityImplCopyWithImpl(_$PermissionEntityImpl _value,
      $Res Function(_$PermissionEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of PermissionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? schools = null,
  }) {
    return _then(_$PermissionEntityImpl(
      schools: null == schools
          ? _value._schools
          : schools // ignore: cast_nullable_to_non_nullable
              as List<SchoolEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PermissionEntityImpl implements _PermissionEntity {
  const _$PermissionEntityImpl({required final List<SchoolEntity> schools})
      : _schools = schools;

  factory _$PermissionEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$PermissionEntityImplFromJson(json);

  final List<SchoolEntity> _schools;
  @override
  List<SchoolEntity> get schools {
    if (_schools is EqualUnmodifiableListView) return _schools;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_schools);
  }

  @override
  String toString() {
    return 'PermissionEntity(schools: $schools)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionEntityImpl &&
            const DeepCollectionEquality().equals(other._schools, _schools));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_schools));

  /// Create a copy of PermissionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionEntityImplCopyWith<_$PermissionEntityImpl> get copyWith =>
      __$$PermissionEntityImplCopyWithImpl<_$PermissionEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PermissionEntityImplToJson(
      this,
    );
  }
}

abstract class _PermissionEntity implements PermissionEntity {
  const factory _PermissionEntity({required final List<SchoolEntity> schools}) =
      _$PermissionEntityImpl;

  factory _PermissionEntity.fromJson(Map<String, dynamic> json) =
      _$PermissionEntityImpl.fromJson;

  @override
  List<SchoolEntity> get schools;

  /// Create a copy of PermissionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PermissionEntityImplCopyWith<_$PermissionEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
