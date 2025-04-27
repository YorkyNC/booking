// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_attachment_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetAttachmentResponse _$GetAttachmentResponseFromJson(
    Map<String, dynamic> json) {
  return _GetAttachmentResponse.fromJson(json);
}

/// @nodoc
mixin _$GetAttachmentResponse {
  String get url => throw _privateConstructorUsedError;

  /// Serializes this GetAttachmentResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetAttachmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetAttachmentResponseCopyWith<GetAttachmentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAttachmentResponseCopyWith<$Res> {
  factory $GetAttachmentResponseCopyWith(GetAttachmentResponse value,
          $Res Function(GetAttachmentResponse) then) =
      _$GetAttachmentResponseCopyWithImpl<$Res, GetAttachmentResponse>;
  @useResult
  $Res call({String url});
}

/// @nodoc
class _$GetAttachmentResponseCopyWithImpl<$Res,
        $Val extends GetAttachmentResponse>
    implements $GetAttachmentResponseCopyWith<$Res> {
  _$GetAttachmentResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetAttachmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetAttachmentResponseImplCopyWith<$Res>
    implements $GetAttachmentResponseCopyWith<$Res> {
  factory _$$GetAttachmentResponseImplCopyWith(
          _$GetAttachmentResponseImpl value,
          $Res Function(_$GetAttachmentResponseImpl) then) =
      __$$GetAttachmentResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url});
}

/// @nodoc
class __$$GetAttachmentResponseImplCopyWithImpl<$Res>
    extends _$GetAttachmentResponseCopyWithImpl<$Res,
        _$GetAttachmentResponseImpl>
    implements _$$GetAttachmentResponseImplCopyWith<$Res> {
  __$$GetAttachmentResponseImplCopyWithImpl(_$GetAttachmentResponseImpl _value,
      $Res Function(_$GetAttachmentResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetAttachmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_$GetAttachmentResponseImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetAttachmentResponseImpl implements _GetAttachmentResponse {
  const _$GetAttachmentResponseImpl({required this.url});

  factory _$GetAttachmentResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetAttachmentResponseImplFromJson(json);

  @override
  final String url;

  @override
  String toString() {
    return 'GetAttachmentResponse(url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAttachmentResponseImpl &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url);

  /// Create a copy of GetAttachmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAttachmentResponseImplCopyWith<_$GetAttachmentResponseImpl>
      get copyWith => __$$GetAttachmentResponseImplCopyWithImpl<
          _$GetAttachmentResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetAttachmentResponseImplToJson(
      this,
    );
  }
}

abstract class _GetAttachmentResponse implements GetAttachmentResponse {
  const factory _GetAttachmentResponse({required final String url}) =
      _$GetAttachmentResponseImpl;

  factory _GetAttachmentResponse.fromJson(Map<String, dynamic> json) =
      _$GetAttachmentResponseImpl.fromJson;

  @override
  String get url;

  /// Create a copy of GetAttachmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetAttachmentResponseImplCopyWith<_$GetAttachmentResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
