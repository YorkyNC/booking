// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'teacher_review_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TeacherReviewState {
  List<ClassEntity>? get events => throw _privateConstructorUsedError;
  DateFilter get analyticsDateFilter => throw _privateConstructorUsedError;

  /// Create a copy of TeacherReviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TeacherReviewStateCopyWith<TeacherReviewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeacherReviewStateCopyWith<$Res> {
  factory $TeacherReviewStateCopyWith(
          TeacherReviewState value, $Res Function(TeacherReviewState) then) =
      _$TeacherReviewStateCopyWithImpl<$Res, TeacherReviewState>;
  @useResult
  $Res call({List<ClassEntity>? events, DateFilter analyticsDateFilter});

  $DateFilterCopyWith<$Res> get analyticsDateFilter;
}

/// @nodoc
class _$TeacherReviewStateCopyWithImpl<$Res, $Val extends TeacherReviewState>
    implements $TeacherReviewStateCopyWith<$Res> {
  _$TeacherReviewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TeacherReviewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = freezed,
    Object? analyticsDateFilter = null,
  }) {
    return _then(_value.copyWith(
      events: freezed == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<ClassEntity>?,
      analyticsDateFilter: null == analyticsDateFilter
          ? _value.analyticsDateFilter
          : analyticsDateFilter // ignore: cast_nullable_to_non_nullable
              as DateFilter,
    ) as $Val);
  }

  /// Create a copy of TeacherReviewState
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
abstract class _$$TeacherReviewStateImplCopyWith<$Res>
    implements $TeacherReviewStateCopyWith<$Res> {
  factory _$$TeacherReviewStateImplCopyWith(_$TeacherReviewStateImpl value,
          $Res Function(_$TeacherReviewStateImpl) then) =
      __$$TeacherReviewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ClassEntity>? events, DateFilter analyticsDateFilter});

  @override
  $DateFilterCopyWith<$Res> get analyticsDateFilter;
}

/// @nodoc
class __$$TeacherReviewStateImplCopyWithImpl<$Res>
    extends _$TeacherReviewStateCopyWithImpl<$Res, _$TeacherReviewStateImpl>
    implements _$$TeacherReviewStateImplCopyWith<$Res> {
  __$$TeacherReviewStateImplCopyWithImpl(_$TeacherReviewStateImpl _value,
      $Res Function(_$TeacherReviewStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TeacherReviewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = freezed,
    Object? analyticsDateFilter = null,
  }) {
    return _then(_$TeacherReviewStateImpl(
      events: freezed == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<ClassEntity>?,
      analyticsDateFilter: null == analyticsDateFilter
          ? _value.analyticsDateFilter
          : analyticsDateFilter // ignore: cast_nullable_to_non_nullable
              as DateFilter,
    ));
  }
}

/// @nodoc

class _$TeacherReviewStateImpl implements _TeacherReviewState {
  _$TeacherReviewStateImpl(
      {final List<ClassEntity>? events, required this.analyticsDateFilter})
      : _events = events;

  final List<ClassEntity>? _events;
  @override
  List<ClassEntity>? get events {
    final value = _events;
    if (value == null) return null;
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateFilter analyticsDateFilter;

  @override
  String toString() {
    return 'TeacherReviewState(events: $events, analyticsDateFilter: $analyticsDateFilter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeacherReviewStateImpl &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            (identical(other.analyticsDateFilter, analyticsDateFilter) ||
                other.analyticsDateFilter == analyticsDateFilter));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_events), analyticsDateFilter);

  /// Create a copy of TeacherReviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TeacherReviewStateImplCopyWith<_$TeacherReviewStateImpl> get copyWith =>
      __$$TeacherReviewStateImplCopyWithImpl<_$TeacherReviewStateImpl>(
          this, _$identity);
}

abstract class _TeacherReviewState implements TeacherReviewState {
  factory _TeacherReviewState(
          {final List<ClassEntity>? events,
          required final DateFilter analyticsDateFilter}) =
      _$TeacherReviewStateImpl;

  @override
  List<ClassEntity>? get events;
  @override
  DateFilter get analyticsDateFilter;

  /// Create a copy of TeacherReviewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TeacherReviewStateImplCopyWith<_$TeacherReviewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
