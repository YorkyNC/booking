// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_attachment_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetAttachmentRequest _$GetAttachmentRequestFromJson(Map<String, dynamic> json) {
  return _GetAttachmentRequest.fromJson(json);
}

/// @nodoc
mixin _$GetAttachmentRequest {
  String get attachmentId => throw _privateConstructorUsedError;

  /// Serializes this GetAttachmentRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetAttachmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetAttachmentRequestCopyWith<GetAttachmentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAttachmentRequestCopyWith<$Res> {
  factory $GetAttachmentRequestCopyWith(GetAttachmentRequest value,
          $Res Function(GetAttachmentRequest) then) =
      _$GetAttachmentRequestCopyWithImpl<$Res, GetAttachmentRequest>;
  @useResult
  $Res call({String attachmentId});
}

/// @nodoc
class _$GetAttachmentRequestCopyWithImpl<$Res,
        $Val extends GetAttachmentRequest>
    implements $GetAttachmentRequestCopyWith<$Res> {
  _$GetAttachmentRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetAttachmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attachmentId = null,
  }) {
    return _then(_value.copyWith(
      attachmentId: null == attachmentId
          ? _value.attachmentId
          : attachmentId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetAttachmentRequestImplCopyWith<$Res>
    implements $GetAttachmentRequestCopyWith<$Res> {
  factory _$$GetAttachmentRequestImplCopyWith(_$GetAttachmentRequestImpl value,
          $Res Function(_$GetAttachmentRequestImpl) then) =
      __$$GetAttachmentRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String attachmentId});
}

/// @nodoc
class __$$GetAttachmentRequestImplCopyWithImpl<$Res>
    extends _$GetAttachmentRequestCopyWithImpl<$Res, _$GetAttachmentRequestImpl>
    implements _$$GetAttachmentRequestImplCopyWith<$Res> {
  __$$GetAttachmentRequestImplCopyWithImpl(_$GetAttachmentRequestImpl _value,
      $Res Function(_$GetAttachmentRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetAttachmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attachmentId = null,
  }) {
    return _then(_$GetAttachmentRequestImpl(
      attachmentId: null == attachmentId
          ? _value.attachmentId
          : attachmentId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetAttachmentRequestImpl implements _GetAttachmentRequest {
  const _$GetAttachmentRequestImpl({required this.attachmentId});

  factory _$GetAttachmentRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetAttachmentRequestImplFromJson(json);

  @override
  final String attachmentId;

  @override
  String toString() {
    return 'GetAttachmentRequest(attachmentId: $attachmentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAttachmentRequestImpl &&
            (identical(other.attachmentId, attachmentId) ||
                other.attachmentId == attachmentId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, attachmentId);

  /// Create a copy of GetAttachmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAttachmentRequestImplCopyWith<_$GetAttachmentRequestImpl>
      get copyWith =>
          __$$GetAttachmentRequestImplCopyWithImpl<_$GetAttachmentRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetAttachmentRequestImplToJson(
      this,
    );
  }
}

abstract class _GetAttachmentRequest implements GetAttachmentRequest {
  const factory _GetAttachmentRequest({required final String attachmentId}) =
      _$GetAttachmentRequestImpl;

  factory _GetAttachmentRequest.fromJson(Map<String, dynamic> json) =
      _$GetAttachmentRequestImpl.fromJson;

  @override
  String get attachmentId;

  /// Create a copy of GetAttachmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetAttachmentRequestImplCopyWith<_$GetAttachmentRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
