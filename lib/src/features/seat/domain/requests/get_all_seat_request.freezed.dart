// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_all_seat_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetAllSeatRequest _$GetAllSeatRequestFromJson(Map<String, dynamic> json) {
  return _GetAllSeatRequest.fromJson(json);
}

/// @nodoc
mixin _$GetAllSeatRequest {
  int get floor => throw _privateConstructorUsedError;

  /// Serializes this GetAllSeatRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetAllSeatRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetAllSeatRequestCopyWith<GetAllSeatRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAllSeatRequestCopyWith<$Res> {
  factory $GetAllSeatRequestCopyWith(
          GetAllSeatRequest value, $Res Function(GetAllSeatRequest) then) =
      _$GetAllSeatRequestCopyWithImpl<$Res, GetAllSeatRequest>;
  @useResult
  $Res call({int floor});
}

/// @nodoc
class _$GetAllSeatRequestCopyWithImpl<$Res, $Val extends GetAllSeatRequest>
    implements $GetAllSeatRequestCopyWith<$Res> {
  _$GetAllSeatRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetAllSeatRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? floor = null,
  }) {
    return _then(_value.copyWith(
      floor: null == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetAllSeatRequestImplCopyWith<$Res>
    implements $GetAllSeatRequestCopyWith<$Res> {
  factory _$$GetAllSeatRequestImplCopyWith(_$GetAllSeatRequestImpl value,
          $Res Function(_$GetAllSeatRequestImpl) then) =
      __$$GetAllSeatRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int floor});
}

/// @nodoc
class __$$GetAllSeatRequestImplCopyWithImpl<$Res>
    extends _$GetAllSeatRequestCopyWithImpl<$Res, _$GetAllSeatRequestImpl>
    implements _$$GetAllSeatRequestImplCopyWith<$Res> {
  __$$GetAllSeatRequestImplCopyWithImpl(_$GetAllSeatRequestImpl _value,
      $Res Function(_$GetAllSeatRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetAllSeatRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? floor = null,
  }) {
    return _then(_$GetAllSeatRequestImpl(
      floor: null == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetAllSeatRequestImpl implements _GetAllSeatRequest {
  const _$GetAllSeatRequestImpl({required this.floor});

  factory _$GetAllSeatRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetAllSeatRequestImplFromJson(json);

  @override
  final int floor;

  @override
  String toString() {
    return 'GetAllSeatRequest(floor: $floor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAllSeatRequestImpl &&
            (identical(other.floor, floor) || other.floor == floor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, floor);

  /// Create a copy of GetAllSeatRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAllSeatRequestImplCopyWith<_$GetAllSeatRequestImpl> get copyWith =>
      __$$GetAllSeatRequestImplCopyWithImpl<_$GetAllSeatRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetAllSeatRequestImplToJson(
      this,
    );
  }
}

abstract class _GetAllSeatRequest implements GetAllSeatRequest {
  const factory _GetAllSeatRequest({required final int floor}) =
      _$GetAllSeatRequestImpl;

  factory _GetAllSeatRequest.fromJson(Map<String, dynamic> json) =
      _$GetAllSeatRequestImpl.fromJson;

  @override
  int get floor;

  /// Create a copy of GetAllSeatRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetAllSeatRequestImplCopyWith<_$GetAllSeatRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
