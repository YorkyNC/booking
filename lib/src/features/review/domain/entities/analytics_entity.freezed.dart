// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analytics_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AnalyticsEntity {
  int get conflicts => throw _privateConstructorUsedError;
  int get smoking => throw _privateConstructorUsedError;
  int get cheating => throw _privateConstructorUsedError;
  String get hotspot => throw _privateConstructorUsedError;
  String get troubleClass => throw _privateConstructorUsedError;

  /// Create a copy of AnalyticsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnalyticsEntityCopyWith<AnalyticsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsEntityCopyWith<$Res> {
  factory $AnalyticsEntityCopyWith(
          AnalyticsEntity value, $Res Function(AnalyticsEntity) then) =
      _$AnalyticsEntityCopyWithImpl<$Res, AnalyticsEntity>;
  @useResult
  $Res call(
      {int conflicts,
      int smoking,
      int cheating,
      String hotspot,
      String troubleClass});
}

/// @nodoc
class _$AnalyticsEntityCopyWithImpl<$Res, $Val extends AnalyticsEntity>
    implements $AnalyticsEntityCopyWith<$Res> {
  _$AnalyticsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnalyticsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conflicts = null,
    Object? smoking = null,
    Object? cheating = null,
    Object? hotspot = null,
    Object? troubleClass = null,
  }) {
    return _then(_value.copyWith(
      conflicts: null == conflicts
          ? _value.conflicts
          : conflicts // ignore: cast_nullable_to_non_nullable
              as int,
      smoking: null == smoking
          ? _value.smoking
          : smoking // ignore: cast_nullable_to_non_nullable
              as int,
      cheating: null == cheating
          ? _value.cheating
          : cheating // ignore: cast_nullable_to_non_nullable
              as int,
      hotspot: null == hotspot
          ? _value.hotspot
          : hotspot // ignore: cast_nullable_to_non_nullable
              as String,
      troubleClass: null == troubleClass
          ? _value.troubleClass
          : troubleClass // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnalyticsEntityImplCopyWith<$Res>
    implements $AnalyticsEntityCopyWith<$Res> {
  factory _$$AnalyticsEntityImplCopyWith(_$AnalyticsEntityImpl value,
          $Res Function(_$AnalyticsEntityImpl) then) =
      __$$AnalyticsEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int conflicts,
      int smoking,
      int cheating,
      String hotspot,
      String troubleClass});
}

/// @nodoc
class __$$AnalyticsEntityImplCopyWithImpl<$Res>
    extends _$AnalyticsEntityCopyWithImpl<$Res, _$AnalyticsEntityImpl>
    implements _$$AnalyticsEntityImplCopyWith<$Res> {
  __$$AnalyticsEntityImplCopyWithImpl(
      _$AnalyticsEntityImpl _value, $Res Function(_$AnalyticsEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnalyticsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conflicts = null,
    Object? smoking = null,
    Object? cheating = null,
    Object? hotspot = null,
    Object? troubleClass = null,
  }) {
    return _then(_$AnalyticsEntityImpl(
      conflicts: null == conflicts
          ? _value.conflicts
          : conflicts // ignore: cast_nullable_to_non_nullable
              as int,
      smoking: null == smoking
          ? _value.smoking
          : smoking // ignore: cast_nullable_to_non_nullable
              as int,
      cheating: null == cheating
          ? _value.cheating
          : cheating // ignore: cast_nullable_to_non_nullable
              as int,
      hotspot: null == hotspot
          ? _value.hotspot
          : hotspot // ignore: cast_nullable_to_non_nullable
              as String,
      troubleClass: null == troubleClass
          ? _value.troubleClass
          : troubleClass // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AnalyticsEntityImpl implements _AnalyticsEntity {
  _$AnalyticsEntityImpl(
      {required this.conflicts,
      required this.smoking,
      required this.cheating,
      required this.hotspot,
      required this.troubleClass});

  @override
  final int conflicts;
  @override
  final int smoking;
  @override
  final int cheating;
  @override
  final String hotspot;
  @override
  final String troubleClass;

  @override
  String toString() {
    return 'AnalyticsEntity(conflicts: $conflicts, smoking: $smoking, cheating: $cheating, hotspot: $hotspot, troubleClass: $troubleClass)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticsEntityImpl &&
            (identical(other.conflicts, conflicts) ||
                other.conflicts == conflicts) &&
            (identical(other.smoking, smoking) || other.smoking == smoking) &&
            (identical(other.cheating, cheating) ||
                other.cheating == cheating) &&
            (identical(other.hotspot, hotspot) || other.hotspot == hotspot) &&
            (identical(other.troubleClass, troubleClass) ||
                other.troubleClass == troubleClass));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, conflicts, smoking, cheating, hotspot, troubleClass);

  /// Create a copy of AnalyticsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyticsEntityImplCopyWith<_$AnalyticsEntityImpl> get copyWith =>
      __$$AnalyticsEntityImplCopyWithImpl<_$AnalyticsEntityImpl>(
          this, _$identity);
}

abstract class _AnalyticsEntity implements AnalyticsEntity {
  factory _AnalyticsEntity(
      {required final int conflicts,
      required final int smoking,
      required final int cheating,
      required final String hotspot,
      required final String troubleClass}) = _$AnalyticsEntityImpl;

  @override
  int get conflicts;
  @override
  int get smoking;
  @override
  int get cheating;
  @override
  String get hotspot;
  @override
  String get troubleClass;

  /// Create a copy of AnalyticsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalyticsEntityImplCopyWith<_$AnalyticsEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
