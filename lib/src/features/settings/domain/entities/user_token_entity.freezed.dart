// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_token_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserTokenEntity _$UserTokenEntityFromJson(Map<String, dynamic> json) {
  return _UserTokenEntity.fromJson(json);
}

/// @nodoc
mixin _$UserTokenEntity {
  String get sub => throw _privateConstructorUsedError;
  PermissionEntity get permissions => throw _privateConstructorUsedError;
  int get exp => throw _privateConstructorUsedError;

  /// Serializes this UserTokenEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserTokenEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserTokenEntityCopyWith<UserTokenEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserTokenEntityCopyWith<$Res> {
  factory $UserTokenEntityCopyWith(
          UserTokenEntity value, $Res Function(UserTokenEntity) then) =
      _$UserTokenEntityCopyWithImpl<$Res, UserTokenEntity>;
  @useResult
  $Res call({String sub, PermissionEntity permissions, int exp});

  $PermissionEntityCopyWith<$Res> get permissions;
}

/// @nodoc
class _$UserTokenEntityCopyWithImpl<$Res, $Val extends UserTokenEntity>
    implements $UserTokenEntityCopyWith<$Res> {
  _$UserTokenEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserTokenEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sub = null,
    Object? permissions = null,
    Object? exp = null,
  }) {
    return _then(_value.copyWith(
      sub: null == sub
          ? _value.sub
          : sub // ignore: cast_nullable_to_non_nullable
              as String,
      permissions: null == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as PermissionEntity,
      exp: null == exp
          ? _value.exp
          : exp // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of UserTokenEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PermissionEntityCopyWith<$Res> get permissions {
    return $PermissionEntityCopyWith<$Res>(_value.permissions, (value) {
      return _then(_value.copyWith(permissions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserTokenEntityImplCopyWith<$Res>
    implements $UserTokenEntityCopyWith<$Res> {
  factory _$$UserTokenEntityImplCopyWith(_$UserTokenEntityImpl value,
          $Res Function(_$UserTokenEntityImpl) then) =
      __$$UserTokenEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String sub, PermissionEntity permissions, int exp});

  @override
  $PermissionEntityCopyWith<$Res> get permissions;
}

/// @nodoc
class __$$UserTokenEntityImplCopyWithImpl<$Res>
    extends _$UserTokenEntityCopyWithImpl<$Res, _$UserTokenEntityImpl>
    implements _$$UserTokenEntityImplCopyWith<$Res> {
  __$$UserTokenEntityImplCopyWithImpl(
      _$UserTokenEntityImpl _value, $Res Function(_$UserTokenEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserTokenEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sub = null,
    Object? permissions = null,
    Object? exp = null,
  }) {
    return _then(_$UserTokenEntityImpl(
      sub: null == sub
          ? _value.sub
          : sub // ignore: cast_nullable_to_non_nullable
              as String,
      permissions: null == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as PermissionEntity,
      exp: null == exp
          ? _value.exp
          : exp // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserTokenEntityImpl implements _UserTokenEntity {
  const _$UserTokenEntityImpl(
      {required this.sub, required this.permissions, required this.exp});

  factory _$UserTokenEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserTokenEntityImplFromJson(json);

  @override
  final String sub;
  @override
  final PermissionEntity permissions;
  @override
  final int exp;

  @override
  String toString() {
    return 'UserTokenEntity(sub: $sub, permissions: $permissions, exp: $exp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserTokenEntityImpl &&
            (identical(other.sub, sub) || other.sub == sub) &&
            (identical(other.permissions, permissions) ||
                other.permissions == permissions) &&
            (identical(other.exp, exp) || other.exp == exp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, sub, permissions, exp);

  /// Create a copy of UserTokenEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserTokenEntityImplCopyWith<_$UserTokenEntityImpl> get copyWith =>
      __$$UserTokenEntityImplCopyWithImpl<_$UserTokenEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserTokenEntityImplToJson(
      this,
    );
  }
}

abstract class _UserTokenEntity implements UserTokenEntity {
  const factory _UserTokenEntity(
      {required final String sub,
      required final PermissionEntity permissions,
      required final int exp}) = _$UserTokenEntityImpl;

  factory _UserTokenEntity.fromJson(Map<String, dynamic> json) =
      _$UserTokenEntityImpl.fromJson;

  @override
  String get sub;
  @override
  PermissionEntity get permissions;
  @override
  int get exp;

  /// Create a copy of UserTokenEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserTokenEntityImplCopyWith<_$UserTokenEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
