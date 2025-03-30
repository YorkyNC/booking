// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_attachment_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddAttachmentRequest {
  XFile get attachment => throw _privateConstructorUsedError;

  /// Create a copy of AddAttachmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddAttachmentRequestCopyWith<AddAttachmentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddAttachmentRequestCopyWith<$Res> {
  factory $AddAttachmentRequestCopyWith(AddAttachmentRequest value,
          $Res Function(AddAttachmentRequest) then) =
      _$AddAttachmentRequestCopyWithImpl<$Res, AddAttachmentRequest>;
  @useResult
  $Res call({XFile attachment});
}

/// @nodoc
class _$AddAttachmentRequestCopyWithImpl<$Res,
        $Val extends AddAttachmentRequest>
    implements $AddAttachmentRequestCopyWith<$Res> {
  _$AddAttachmentRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddAttachmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attachment = null,
  }) {
    return _then(_value.copyWith(
      attachment: null == attachment
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as XFile,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddAttachmentRequestImplCopyWith<$Res>
    implements $AddAttachmentRequestCopyWith<$Res> {
  factory _$$AddAttachmentRequestImplCopyWith(_$AddAttachmentRequestImpl value,
          $Res Function(_$AddAttachmentRequestImpl) then) =
      __$$AddAttachmentRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({XFile attachment});
}

/// @nodoc
class __$$AddAttachmentRequestImplCopyWithImpl<$Res>
    extends _$AddAttachmentRequestCopyWithImpl<$Res, _$AddAttachmentRequestImpl>
    implements _$$AddAttachmentRequestImplCopyWith<$Res> {
  __$$AddAttachmentRequestImplCopyWithImpl(_$AddAttachmentRequestImpl _value,
      $Res Function(_$AddAttachmentRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddAttachmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attachment = null,
  }) {
    return _then(_$AddAttachmentRequestImpl(
      attachment: null == attachment
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as XFile,
    ));
  }
}

/// @nodoc

class _$AddAttachmentRequestImpl implements _AddAttachmentRequest {
  const _$AddAttachmentRequestImpl({required this.attachment});

  @override
  final XFile attachment;

  @override
  String toString() {
    return 'AddAttachmentRequest(attachment: $attachment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddAttachmentRequestImpl &&
            (identical(other.attachment, attachment) ||
                other.attachment == attachment));
  }

  @override
  int get hashCode => Object.hash(runtimeType, attachment);

  /// Create a copy of AddAttachmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddAttachmentRequestImplCopyWith<_$AddAttachmentRequestImpl>
      get copyWith =>
          __$$AddAttachmentRequestImplCopyWithImpl<_$AddAttachmentRequestImpl>(
              this, _$identity);
}

abstract class _AddAttachmentRequest implements AddAttachmentRequest {
  const factory _AddAttachmentRequest({required final XFile attachment}) =
      _$AddAttachmentRequestImpl;

  @override
  XFile get attachment;

  /// Create a copy of AddAttachmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddAttachmentRequestImplCopyWith<_$AddAttachmentRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
