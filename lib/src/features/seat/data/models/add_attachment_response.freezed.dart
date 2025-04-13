// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_attachment_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddAttachmentResponse _$AddAttachmentResponseFromJson(
    Map<String, dynamic> json) {
  return _AddAttachmentResponse.fromJson(json);
}

/// @nodoc
mixin _$AddAttachmentResponse {
  String get id => throw _privateConstructorUsedError;

  /// Serializes this AddAttachmentResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddAttachmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddAttachmentResponseCopyWith<AddAttachmentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddAttachmentResponseCopyWith<$Res> {
  factory $AddAttachmentResponseCopyWith(AddAttachmentResponse value,
          $Res Function(AddAttachmentResponse) then) =
      _$AddAttachmentResponseCopyWithImpl<$Res, AddAttachmentResponse>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$AddAttachmentResponseCopyWithImpl<$Res,
        $Val extends AddAttachmentResponse>
    implements $AddAttachmentResponseCopyWith<$Res> {
  _$AddAttachmentResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddAttachmentResponse
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
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddAttachmentResponseImplCopyWith<$Res>
    implements $AddAttachmentResponseCopyWith<$Res> {
  factory _$$AddAttachmentResponseImplCopyWith(
          _$AddAttachmentResponseImpl value,
          $Res Function(_$AddAttachmentResponseImpl) then) =
      __$$AddAttachmentResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$AddAttachmentResponseImplCopyWithImpl<$Res>
    extends _$AddAttachmentResponseCopyWithImpl<$Res,
        _$AddAttachmentResponseImpl>
    implements _$$AddAttachmentResponseImplCopyWith<$Res> {
  __$$AddAttachmentResponseImplCopyWithImpl(_$AddAttachmentResponseImpl _value,
      $Res Function(_$AddAttachmentResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddAttachmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$AddAttachmentResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddAttachmentResponseImpl implements _AddAttachmentResponse {
  const _$AddAttachmentResponseImpl({required this.id});

  factory _$AddAttachmentResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddAttachmentResponseImplFromJson(json);

  @override
  final String id;

  @override
  String toString() {
    return 'AddAttachmentResponse(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddAttachmentResponseImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of AddAttachmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddAttachmentResponseImplCopyWith<_$AddAttachmentResponseImpl>
      get copyWith => __$$AddAttachmentResponseImplCopyWithImpl<
          _$AddAttachmentResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddAttachmentResponseImplToJson(
      this,
    );
  }
}

abstract class _AddAttachmentResponse implements AddAttachmentResponse {
  const factory _AddAttachmentResponse({required final String id}) =
      _$AddAttachmentResponseImpl;

  factory _AddAttachmentResponse.fromJson(Map<String, dynamic> json) =
      _$AddAttachmentResponseImpl.fromJson;

  @override
  String get id;

  /// Create a copy of AddAttachmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddAttachmentResponseImplCopyWith<_$AddAttachmentResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
