// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ScheduleState {
  List<ScheduleDayEntity>? get schedules => throw _privateConstructorUsedError;
  bool get hasChanges => throw _privateConstructorUsedError;
  List<ScheduleSubjectEntity> get deletedSubjects =>
      throw _privateConstructorUsedError;
  ScheduleViewType get viewType => throw _privateConstructorUsedError;

  /// Create a copy of ScheduleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScheduleStateCopyWith<ScheduleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleStateCopyWith<$Res> {
  factory $ScheduleStateCopyWith(
          ScheduleState value, $Res Function(ScheduleState) then) =
      _$ScheduleStateCopyWithImpl<$Res, ScheduleState>;
  @useResult
  $Res call(
      {List<ScheduleDayEntity>? schedules,
      bool hasChanges,
      List<ScheduleSubjectEntity> deletedSubjects,
      ScheduleViewType viewType});
}

/// @nodoc
class _$ScheduleStateCopyWithImpl<$Res, $Val extends ScheduleState>
    implements $ScheduleStateCopyWith<$Res> {
  _$ScheduleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScheduleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? schedules = freezed,
    Object? hasChanges = null,
    Object? deletedSubjects = null,
    Object? viewType = null,
  }) {
    return _then(_value.copyWith(
      schedules: freezed == schedules
          ? _value.schedules
          : schedules // ignore: cast_nullable_to_non_nullable
              as List<ScheduleDayEntity>?,
      hasChanges: null == hasChanges
          ? _value.hasChanges
          : hasChanges // ignore: cast_nullable_to_non_nullable
              as bool,
      deletedSubjects: null == deletedSubjects
          ? _value.deletedSubjects
          : deletedSubjects // ignore: cast_nullable_to_non_nullable
              as List<ScheduleSubjectEntity>,
      viewType: null == viewType
          ? _value.viewType
          : viewType // ignore: cast_nullable_to_non_nullable
              as ScheduleViewType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScheduleStateImplCopyWith<$Res>
    implements $ScheduleStateCopyWith<$Res> {
  factory _$$ScheduleStateImplCopyWith(
          _$ScheduleStateImpl value, $Res Function(_$ScheduleStateImpl) then) =
      __$$ScheduleStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ScheduleDayEntity>? schedules,
      bool hasChanges,
      List<ScheduleSubjectEntity> deletedSubjects,
      ScheduleViewType viewType});
}

/// @nodoc
class __$$ScheduleStateImplCopyWithImpl<$Res>
    extends _$ScheduleStateCopyWithImpl<$Res, _$ScheduleStateImpl>
    implements _$$ScheduleStateImplCopyWith<$Res> {
  __$$ScheduleStateImplCopyWithImpl(
      _$ScheduleStateImpl _value, $Res Function(_$ScheduleStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScheduleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? schedules = freezed,
    Object? hasChanges = null,
    Object? deletedSubjects = null,
    Object? viewType = null,
  }) {
    return _then(_$ScheduleStateImpl(
      schedules: freezed == schedules
          ? _value._schedules
          : schedules // ignore: cast_nullable_to_non_nullable
              as List<ScheduleDayEntity>?,
      hasChanges: null == hasChanges
          ? _value.hasChanges
          : hasChanges // ignore: cast_nullable_to_non_nullable
              as bool,
      deletedSubjects: null == deletedSubjects
          ? _value._deletedSubjects
          : deletedSubjects // ignore: cast_nullable_to_non_nullable
              as List<ScheduleSubjectEntity>,
      viewType: null == viewType
          ? _value.viewType
          : viewType // ignore: cast_nullable_to_non_nullable
              as ScheduleViewType,
    ));
  }
}

/// @nodoc

class _$ScheduleStateImpl implements _ScheduleState {
  _$ScheduleStateImpl(
      {final List<ScheduleDayEntity>? schedules,
      this.hasChanges = false,
      final List<ScheduleSubjectEntity> deletedSubjects = const [],
      this.viewType = ScheduleViewType.calendar})
      : _schedules = schedules,
        _deletedSubjects = deletedSubjects;

  final List<ScheduleDayEntity>? _schedules;
  @override
  List<ScheduleDayEntity>? get schedules {
    final value = _schedules;
    if (value == null) return null;
    if (_schedules is EqualUnmodifiableListView) return _schedules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final bool hasChanges;
  final List<ScheduleSubjectEntity> _deletedSubjects;
  @override
  @JsonKey()
  List<ScheduleSubjectEntity> get deletedSubjects {
    if (_deletedSubjects is EqualUnmodifiableListView) return _deletedSubjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deletedSubjects);
  }

  @override
  @JsonKey()
  final ScheduleViewType viewType;

  @override
  String toString() {
    return 'ScheduleState(schedules: $schedules, hasChanges: $hasChanges, deletedSubjects: $deletedSubjects, viewType: $viewType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleStateImpl &&
            const DeepCollectionEquality()
                .equals(other._schedules, _schedules) &&
            (identical(other.hasChanges, hasChanges) ||
                other.hasChanges == hasChanges) &&
            const DeepCollectionEquality()
                .equals(other._deletedSubjects, _deletedSubjects) &&
            (identical(other.viewType, viewType) ||
                other.viewType == viewType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_schedules),
      hasChanges,
      const DeepCollectionEquality().hash(_deletedSubjects),
      viewType);

  /// Create a copy of ScheduleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleStateImplCopyWith<_$ScheduleStateImpl> get copyWith =>
      __$$ScheduleStateImplCopyWithImpl<_$ScheduleStateImpl>(this, _$identity);
}

abstract class _ScheduleState implements ScheduleState {
  factory _ScheduleState(
      {final List<ScheduleDayEntity>? schedules,
      final bool hasChanges,
      final List<ScheduleSubjectEntity> deletedSubjects,
      final ScheduleViewType viewType}) = _$ScheduleStateImpl;

  @override
  List<ScheduleDayEntity>? get schedules;
  @override
  bool get hasChanges;
  @override
  List<ScheduleSubjectEntity> get deletedSubjects;
  @override
  ScheduleViewType get viewType;

  /// Create a copy of ScheduleState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScheduleStateImplCopyWith<_$ScheduleStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
