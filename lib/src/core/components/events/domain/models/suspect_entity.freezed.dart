// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'suspect_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SuspectEntity _$SuspectEntityFromJson(Map<String, dynamic> json) {
  return _SuspectEntity.fromJson(json);
}

/// @nodoc
mixin _$SuspectEntity {
  String get id => throw _privateConstructorUsedError;
  UserEntity? get user => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<SummaryHighlightEntity> get highlights =>
      throw _privateConstructorUsedError;

  /// Serializes this SuspectEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SuspectEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SuspectEntityCopyWith<SuspectEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuspectEntityCopyWith<$Res> {
  factory $SuspectEntityCopyWith(
          SuspectEntity value, $Res Function(SuspectEntity) then) =
      _$SuspectEntityCopyWithImpl<$Res, SuspectEntity>;
  @useResult
  $Res call(
      {String id,
      UserEntity? user,
      String imageUrl,
      String? description,
      List<SummaryHighlightEntity> highlights});

  $UserEntityCopyWith<$Res>? get user;
}

/// @nodoc
class _$SuspectEntityCopyWithImpl<$Res, $Val extends SuspectEntity>
    implements $SuspectEntityCopyWith<$Res> {
  _$SuspectEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SuspectEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = freezed,
    Object? imageUrl = null,
    Object? description = freezed,
    Object? highlights = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      highlights: null == highlights
          ? _value.highlights
          : highlights // ignore: cast_nullable_to_non_nullable
              as List<SummaryHighlightEntity>,
    ) as $Val);
  }

  /// Create a copy of SuspectEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserEntityCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserEntityCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SuspectEntityImplCopyWith<$Res>
    implements $SuspectEntityCopyWith<$Res> {
  factory _$$SuspectEntityImplCopyWith(
          _$SuspectEntityImpl value, $Res Function(_$SuspectEntityImpl) then) =
      __$$SuspectEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      UserEntity? user,
      String imageUrl,
      String? description,
      List<SummaryHighlightEntity> highlights});

  @override
  $UserEntityCopyWith<$Res>? get user;
}

/// @nodoc
class __$$SuspectEntityImplCopyWithImpl<$Res>
    extends _$SuspectEntityCopyWithImpl<$Res, _$SuspectEntityImpl>
    implements _$$SuspectEntityImplCopyWith<$Res> {
  __$$SuspectEntityImplCopyWithImpl(
      _$SuspectEntityImpl _value, $Res Function(_$SuspectEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of SuspectEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = freezed,
    Object? imageUrl = null,
    Object? description = freezed,
    Object? highlights = null,
  }) {
    return _then(_$SuspectEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      highlights: null == highlights
          ? _value._highlights
          : highlights // ignore: cast_nullable_to_non_nullable
              as List<SummaryHighlightEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SuspectEntityImpl implements _SuspectEntity {
  _$SuspectEntityImpl(
      {required this.id,
      this.user,
      required this.imageUrl,
      this.description,
      final List<SummaryHighlightEntity> highlights = const []})
      : _highlights = highlights;

  factory _$SuspectEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$SuspectEntityImplFromJson(json);

  @override
  final String id;
  @override
  final UserEntity? user;
  @override
  final String imageUrl;
  @override
  final String? description;
  final List<SummaryHighlightEntity> _highlights;
  @override
  @JsonKey()
  List<SummaryHighlightEntity> get highlights {
    if (_highlights is EqualUnmodifiableListView) return _highlights;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_highlights);
  }

  @override
  String toString() {
    return 'SuspectEntity(id: $id, user: $user, imageUrl: $imageUrl, description: $description, highlights: $highlights)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuspectEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._highlights, _highlights));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, user, imageUrl, description,
      const DeepCollectionEquality().hash(_highlights));

  /// Create a copy of SuspectEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuspectEntityImplCopyWith<_$SuspectEntityImpl> get copyWith =>
      __$$SuspectEntityImplCopyWithImpl<_$SuspectEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SuspectEntityImplToJson(
      this,
    );
  }
}

abstract class _SuspectEntity implements SuspectEntity {
  factory _SuspectEntity(
      {required final String id,
      final UserEntity? user,
      required final String imageUrl,
      final String? description,
      final List<SummaryHighlightEntity> highlights}) = _$SuspectEntityImpl;

  factory _SuspectEntity.fromJson(Map<String, dynamic> json) =
      _$SuspectEntityImpl.fromJson;

  @override
  String get id;
  @override
  UserEntity? get user;
  @override
  String get imageUrl;
  @override
  String? get description;
  @override
  List<SummaryHighlightEntity> get highlights;

  /// Create a copy of SuspectEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuspectEntityImplCopyWith<_$SuspectEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
