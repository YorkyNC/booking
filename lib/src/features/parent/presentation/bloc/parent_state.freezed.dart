// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parent_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ParentState {
  List<ScheduleSubjectEntity>? get schedule =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  /// Create a copy of ParentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ParentStateCopyWith<ParentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParentStateCopyWith<$Res> {
  factory $ParentStateCopyWith(
          ParentState value, $Res Function(ParentState) then) =
      _$ParentStateCopyWithImpl<$Res, ParentState>;
  @useResult
  $Res call({List<ScheduleSubjectEntity>? schedule, bool isLoading});
}

/// @nodoc
class _$ParentStateCopyWithImpl<$Res, $Val extends ParentState>
    implements $ParentStateCopyWith<$Res> {
  _$ParentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ParentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? schedule = freezed,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      schedule: freezed == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as List<ScheduleSubjectEntity>?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ParentStateImplCopyWith<$Res>
    implements $ParentStateCopyWith<$Res> {
  factory _$$ParentStateImplCopyWith(
          _$ParentStateImpl value, $Res Function(_$ParentStateImpl) then) =
      __$$ParentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ScheduleSubjectEntity>? schedule, bool isLoading});
}

/// @nodoc
class __$$ParentStateImplCopyWithImpl<$Res>
    extends _$ParentStateCopyWithImpl<$Res, _$ParentStateImpl>
    implements _$$ParentStateImplCopyWith<$Res> {
  __$$ParentStateImplCopyWithImpl(
      _$ParentStateImpl _value, $Res Function(_$ParentStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ParentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? schedule = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$ParentStateImpl(
      schedule: freezed == schedule
          ? _value._schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as List<ScheduleSubjectEntity>?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ParentStateImpl implements _ParentState {
  _$ParentStateImpl(
      {final List<ScheduleSubjectEntity>? schedule, this.isLoading = false})
      : _schedule = schedule;

  final List<ScheduleSubjectEntity>? _schedule;
  @override
  List<ScheduleSubjectEntity>? get schedule {
    final value = _schedule;
    if (value == null) return null;
    if (_schedule is EqualUnmodifiableListView) return _schedule;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'ParentState(schedule: $schedule, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParentStateImpl &&
            const DeepCollectionEquality().equals(other._schedule, _schedule) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_schedule), isLoading);

  /// Create a copy of ParentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParentStateImplCopyWith<_$ParentStateImpl> get copyWith =>
      __$$ParentStateImplCopyWithImpl<_$ParentStateImpl>(this, _$identity);
}

abstract class _ParentState implements ParentState {
  factory _ParentState(
      {final List<ScheduleSubjectEntity>? schedule,
      final bool isLoading}) = _$ParentStateImpl;

  @override
  List<ScheduleSubjectEntity>? get schedule;
  @override
  bool get isLoading;

  /// Create a copy of ParentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParentStateImplCopyWith<_$ParentStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
