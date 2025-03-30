// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReviewState {
  List<EventEntity>? get conflicts => throw _privateConstructorUsedError;
  AnalyticsEntity? get analytics => throw _privateConstructorUsedError;
  DateFilter get analyticsDateFilter => throw _privateConstructorUsedError;

  /// Create a copy of ReviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewStateCopyWith<ReviewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewStateCopyWith<$Res> {
  factory $ReviewStateCopyWith(
          ReviewState value, $Res Function(ReviewState) then) =
      _$ReviewStateCopyWithImpl<$Res, ReviewState>;
  @useResult
  $Res call(
      {List<EventEntity>? conflicts,
      AnalyticsEntity? analytics,
      DateFilter analyticsDateFilter});

  $AnalyticsEntityCopyWith<$Res>? get analytics;
  $DateFilterCopyWith<$Res> get analyticsDateFilter;
}

/// @nodoc
class _$ReviewStateCopyWithImpl<$Res, $Val extends ReviewState>
    implements $ReviewStateCopyWith<$Res> {
  _$ReviewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conflicts = freezed,
    Object? analytics = freezed,
    Object? analyticsDateFilter = null,
  }) {
    return _then(_value.copyWith(
      conflicts: freezed == conflicts
          ? _value.conflicts
          : conflicts // ignore: cast_nullable_to_non_nullable
              as List<EventEntity>?,
      analytics: freezed == analytics
          ? _value.analytics
          : analytics // ignore: cast_nullable_to_non_nullable
              as AnalyticsEntity?,
      analyticsDateFilter: null == analyticsDateFilter
          ? _value.analyticsDateFilter
          : analyticsDateFilter // ignore: cast_nullable_to_non_nullable
              as DateFilter,
    ) as $Val);
  }

  /// Create a copy of ReviewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnalyticsEntityCopyWith<$Res>? get analytics {
    if (_value.analytics == null) {
      return null;
    }

    return $AnalyticsEntityCopyWith<$Res>(_value.analytics!, (value) {
      return _then(_value.copyWith(analytics: value) as $Val);
    });
  }

  /// Create a copy of ReviewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DateFilterCopyWith<$Res> get analyticsDateFilter {
    return $DateFilterCopyWith<$Res>(_value.analyticsDateFilter, (value) {
      return _then(_value.copyWith(analyticsDateFilter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReviewStateImplCopyWith<$Res>
    implements $ReviewStateCopyWith<$Res> {
  factory _$$ReviewStateImplCopyWith(
          _$ReviewStateImpl value, $Res Function(_$ReviewStateImpl) then) =
      __$$ReviewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<EventEntity>? conflicts,
      AnalyticsEntity? analytics,
      DateFilter analyticsDateFilter});

  @override
  $AnalyticsEntityCopyWith<$Res>? get analytics;
  @override
  $DateFilterCopyWith<$Res> get analyticsDateFilter;
}

/// @nodoc
class __$$ReviewStateImplCopyWithImpl<$Res>
    extends _$ReviewStateCopyWithImpl<$Res, _$ReviewStateImpl>
    implements _$$ReviewStateImplCopyWith<$Res> {
  __$$ReviewStateImplCopyWithImpl(
      _$ReviewStateImpl _value, $Res Function(_$ReviewStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conflicts = freezed,
    Object? analytics = freezed,
    Object? analyticsDateFilter = null,
  }) {
    return _then(_$ReviewStateImpl(
      conflicts: freezed == conflicts
          ? _value._conflicts
          : conflicts // ignore: cast_nullable_to_non_nullable
              as List<EventEntity>?,
      analytics: freezed == analytics
          ? _value.analytics
          : analytics // ignore: cast_nullable_to_non_nullable
              as AnalyticsEntity?,
      analyticsDateFilter: null == analyticsDateFilter
          ? _value.analyticsDateFilter
          : analyticsDateFilter // ignore: cast_nullable_to_non_nullable
              as DateFilter,
    ));
  }
}

/// @nodoc

class _$ReviewStateImpl implements _ReviewState {
  _$ReviewStateImpl(
      {final List<EventEntity>? conflicts,
      this.analytics,
      required this.analyticsDateFilter})
      : _conflicts = conflicts;

  final List<EventEntity>? _conflicts;
  @override
  List<EventEntity>? get conflicts {
    final value = _conflicts;
    if (value == null) return null;
    if (_conflicts is EqualUnmodifiableListView) return _conflicts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final AnalyticsEntity? analytics;
  @override
  final DateFilter analyticsDateFilter;

  @override
  String toString() {
    return 'ReviewState(conflicts: $conflicts, analytics: $analytics, analyticsDateFilter: $analyticsDateFilter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewStateImpl &&
            const DeepCollectionEquality()
                .equals(other._conflicts, _conflicts) &&
            (identical(other.analytics, analytics) ||
                other.analytics == analytics) &&
            (identical(other.analyticsDateFilter, analyticsDateFilter) ||
                other.analyticsDateFilter == analyticsDateFilter));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_conflicts),
      analytics,
      analyticsDateFilter);

  /// Create a copy of ReviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewStateImplCopyWith<_$ReviewStateImpl> get copyWith =>
      __$$ReviewStateImplCopyWithImpl<_$ReviewStateImpl>(this, _$identity);
}

abstract class _ReviewState implements ReviewState {
  factory _ReviewState(
      {final List<EventEntity>? conflicts,
      final AnalyticsEntity? analytics,
      required final DateFilter analyticsDateFilter}) = _$ReviewStateImpl;

  @override
  List<EventEntity>? get conflicts;
  @override
  AnalyticsEntity? get analytics;
  @override
  DateFilter get analyticsDateFilter;

  /// Create a copy of ReviewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewStateImplCopyWith<_$ReviewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
