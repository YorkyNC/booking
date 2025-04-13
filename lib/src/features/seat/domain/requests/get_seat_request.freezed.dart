// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_seat_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetSeatRequest _$GetSeatRequestFromJson(Map<String, dynamic> json) {
  return _GetSeatRequest.fromJson(json);
}

/// @nodoc
mixin _$GetSeatRequest {
  int get id => throw _privateConstructorUsedError;

  /// Serializes this GetSeatRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetSeatRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetSeatRequestCopyWith<GetSeatRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetSeatRequestCopyWith<$Res> {
  factory $GetSeatRequestCopyWith(
          GetSeatRequest value, $Res Function(GetSeatRequest) then) =
      _$GetSeatRequestCopyWithImpl<$Res, GetSeatRequest>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$GetSeatRequestCopyWithImpl<$Res, $Val extends GetSeatRequest>
    implements $GetSeatRequestCopyWith<$Res> {
  _$GetSeatRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetSeatRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetSeatRequestImplCopyWith<$Res>
    implements $GetSeatRequestCopyWith<$Res> {
  factory _$$GetSeatRequestImplCopyWith(_$GetSeatRequestImpl value,
          $Res Function(_$GetSeatRequestImpl) then) =
      __$$GetSeatRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$GetSeatRequestImplCopyWithImpl<$Res>
    extends _$GetSeatRequestCopyWithImpl<$Res, _$GetSeatRequestImpl>
    implements _$$GetSeatRequestImplCopyWith<$Res> {
  __$$GetSeatRequestImplCopyWithImpl(
      _$GetSeatRequestImpl _value, $Res Function(_$GetSeatRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetSeatRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$GetSeatRequestImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetSeatRequestImpl implements _GetSeatRequest {
  const _$GetSeatRequestImpl({required this.id});

  factory _$GetSeatRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetSeatRequestImplFromJson(json);

  @override
  final int id;

  @override
  String toString() {
    return 'GetSeatRequest(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSeatRequestImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of GetSeatRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetSeatRequestImplCopyWith<_$GetSeatRequestImpl> get copyWith =>
      __$$GetSeatRequestImplCopyWithImpl<_$GetSeatRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetSeatRequestImplToJson(
      this,
    );
  }
}

abstract class _GetSeatRequest implements GetSeatRequest {
  const factory _GetSeatRequest({required final int id}) = _$GetSeatRequestImpl;

  factory _GetSeatRequest.fromJson(Map<String, dynamic> json) =
      _$GetSeatRequestImpl.fromJson;

  @override
  int get id;

  /// Create a copy of GetSeatRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetSeatRequestImplCopyWith<_$GetSeatRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
