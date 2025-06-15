// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cancel_reservation_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CancelReservationRequest _$CancelReservationRequestFromJson(
    Map<String, dynamic> json) {
  return _CancelReservationRequest.fromJson(json);
}

/// @nodoc
mixin _$CancelReservationRequest {
  int get id => throw _privateConstructorUsedError;

  /// Serializes this CancelReservationRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CancelReservationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CancelReservationRequestCopyWith<CancelReservationRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CancelReservationRequestCopyWith<$Res> {
  factory $CancelReservationRequestCopyWith(CancelReservationRequest value,
          $Res Function(CancelReservationRequest) then) =
      _$CancelReservationRequestCopyWithImpl<$Res, CancelReservationRequest>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$CancelReservationRequestCopyWithImpl<$Res,
        $Val extends CancelReservationRequest>
    implements $CancelReservationRequestCopyWith<$Res> {
  _$CancelReservationRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CancelReservationRequest
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
abstract class _$$CancelReservationRequestImplCopyWith<$Res>
    implements $CancelReservationRequestCopyWith<$Res> {
  factory _$$CancelReservationRequestImplCopyWith(
          _$CancelReservationRequestImpl value,
          $Res Function(_$CancelReservationRequestImpl) then) =
      __$$CancelReservationRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$CancelReservationRequestImplCopyWithImpl<$Res>
    extends _$CancelReservationRequestCopyWithImpl<$Res,
        _$CancelReservationRequestImpl>
    implements _$$CancelReservationRequestImplCopyWith<$Res> {
  __$$CancelReservationRequestImplCopyWithImpl(
      _$CancelReservationRequestImpl _value,
      $Res Function(_$CancelReservationRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CancelReservationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$CancelReservationRequestImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CancelReservationRequestImpl implements _CancelReservationRequest {
  const _$CancelReservationRequestImpl({required this.id});

  factory _$CancelReservationRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CancelReservationRequestImplFromJson(json);

  @override
  final int id;

  @override
  String toString() {
    return 'CancelReservationRequest(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelReservationRequestImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of CancelReservationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelReservationRequestImplCopyWith<_$CancelReservationRequestImpl>
      get copyWith => __$$CancelReservationRequestImplCopyWithImpl<
          _$CancelReservationRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CancelReservationRequestImplToJson(
      this,
    );
  }
}

abstract class _CancelReservationRequest implements CancelReservationRequest {
  const factory _CancelReservationRequest({required final int id}) =
      _$CancelReservationRequestImpl;

  factory _CancelReservationRequest.fromJson(Map<String, dynamic> json) =
      _$CancelReservationRequestImpl.fromJson;

  @override
  int get id;

  /// Create a copy of CancelReservationRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CancelReservationRequestImplCopyWith<_$CancelReservationRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
