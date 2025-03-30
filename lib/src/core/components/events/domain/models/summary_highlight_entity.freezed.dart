// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'summary_highlight_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SummaryHighlightEntity _$SummaryHighlightEntityFromJson(
    Map<String, dynamic> json) {
  return _SummaryHighlightEntity.fromJson(json);
}

/// @nodoc
mixin _$SummaryHighlightEntity {
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  /// Serializes this SummaryHighlightEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SummaryHighlightEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SummaryHighlightEntityCopyWith<SummaryHighlightEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SummaryHighlightEntityCopyWith<$Res> {
  factory $SummaryHighlightEntityCopyWith(SummaryHighlightEntity value,
          $Res Function(SummaryHighlightEntity) then) =
      _$SummaryHighlightEntityCopyWithImpl<$Res, SummaryHighlightEntity>;
  @useResult
  $Res call({String title, String content});
}

/// @nodoc
class _$SummaryHighlightEntityCopyWithImpl<$Res,
        $Val extends SummaryHighlightEntity>
    implements $SummaryHighlightEntityCopyWith<$Res> {
  _$SummaryHighlightEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SummaryHighlightEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SummaryHighlightEntityImplCopyWith<$Res>
    implements $SummaryHighlightEntityCopyWith<$Res> {
  factory _$$SummaryHighlightEntityImplCopyWith(
          _$SummaryHighlightEntityImpl value,
          $Res Function(_$SummaryHighlightEntityImpl) then) =
      __$$SummaryHighlightEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String content});
}

/// @nodoc
class __$$SummaryHighlightEntityImplCopyWithImpl<$Res>
    extends _$SummaryHighlightEntityCopyWithImpl<$Res,
        _$SummaryHighlightEntityImpl>
    implements _$$SummaryHighlightEntityImplCopyWith<$Res> {
  __$$SummaryHighlightEntityImplCopyWithImpl(
      _$SummaryHighlightEntityImpl _value,
      $Res Function(_$SummaryHighlightEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of SummaryHighlightEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
  }) {
    return _then(_$SummaryHighlightEntityImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SummaryHighlightEntityImpl implements _SummaryHighlightEntity {
  _$SummaryHighlightEntityImpl({required this.title, required this.content});

  factory _$SummaryHighlightEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$SummaryHighlightEntityImplFromJson(json);

  @override
  final String title;
  @override
  final String content;

  @override
  String toString() {
    return 'SummaryHighlightEntity(title: $title, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SummaryHighlightEntityImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, content);

  /// Create a copy of SummaryHighlightEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SummaryHighlightEntityImplCopyWith<_$SummaryHighlightEntityImpl>
      get copyWith => __$$SummaryHighlightEntityImplCopyWithImpl<
          _$SummaryHighlightEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SummaryHighlightEntityImplToJson(
      this,
    );
  }
}

abstract class _SummaryHighlightEntity implements SummaryHighlightEntity {
  factory _SummaryHighlightEntity(
      {required final String title,
      required final String content}) = _$SummaryHighlightEntityImpl;

  factory _SummaryHighlightEntity.fromJson(Map<String, dynamic> json) =
      _$SummaryHighlightEntityImpl.fromJson;

  @override
  String get title;
  @override
  String get content;

  /// Create a copy of SummaryHighlightEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SummaryHighlightEntityImplCopyWith<_$SummaryHighlightEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
