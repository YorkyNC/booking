// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_stat_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetStatRequest _$GetStatRequestFromJson(Map<String, dynamic> json) {
  return _GetStatRequest.fromJson(json);
}

/// @nodoc
mixin _$GetStatRequest {
  int get userId => throw _privateConstructorUsedError;

  /// Serializes this GetStatRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetStatRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetStatRequestCopyWith<GetStatRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetStatRequestCopyWith<$Res> {
  factory $GetStatRequestCopyWith(
          GetStatRequest value, $Res Function(GetStatRequest) then) =
      _$GetStatRequestCopyWithImpl<$Res, GetStatRequest>;
  @useResult
  $Res call({int userId});
}

/// @nodoc
class _$GetStatRequestCopyWithImpl<$Res, $Val extends GetStatRequest>
    implements $GetStatRequestCopyWith<$Res> {
  _$GetStatRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetStatRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetStatRequestImplCopyWith<$Res>
    implements $GetStatRequestCopyWith<$Res> {
  factory _$$GetStatRequestImplCopyWith(_$GetStatRequestImpl value,
          $Res Function(_$GetStatRequestImpl) then) =
      __$$GetStatRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int userId});
}

/// @nodoc
class __$$GetStatRequestImplCopyWithImpl<$Res>
    extends _$GetStatRequestCopyWithImpl<$Res, _$GetStatRequestImpl>
    implements _$$GetStatRequestImplCopyWith<$Res> {
  __$$GetStatRequestImplCopyWithImpl(
      _$GetStatRequestImpl _value, $Res Function(_$GetStatRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetStatRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$GetStatRequestImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetStatRequestImpl implements _GetStatRequest {
  const _$GetStatRequestImpl({required this.userId});

  factory _$GetStatRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetStatRequestImplFromJson(json);

  @override
  final int userId;

  @override
  String toString() {
    return 'GetStatRequest(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetStatRequestImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId);

  /// Create a copy of GetStatRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetStatRequestImplCopyWith<_$GetStatRequestImpl> get copyWith =>
      __$$GetStatRequestImplCopyWithImpl<_$GetStatRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetStatRequestImplToJson(
      this,
    );
  }
}

abstract class _GetStatRequest implements GetStatRequest {
  const factory _GetStatRequest({required final int userId}) =
      _$GetStatRequestImpl;

  factory _GetStatRequest.fromJson(Map<String, dynamic> json) =
      _$GetStatRequestImpl.fromJson;

  @override
  int get userId;

  /// Create a copy of GetStatRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetStatRequestImplCopyWith<_$GetStatRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
