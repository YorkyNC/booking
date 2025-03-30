// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'events_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EventsFilter {
  DateFilter get date => throw _privateConstructorUsedError;
  Set<EventType> get eventTypes => throw _privateConstructorUsedError;

  /// Create a copy of EventsFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventsFilterCopyWith<EventsFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventsFilterCopyWith<$Res> {
  factory $EventsFilterCopyWith(
          EventsFilter value, $Res Function(EventsFilter) then) =
      _$EventsFilterCopyWithImpl<$Res, EventsFilter>;
  @useResult
  $Res call({DateFilter date, Set<EventType> eventTypes});

  $DateFilterCopyWith<$Res> get date;
}

/// @nodoc
class _$EventsFilterCopyWithImpl<$Res, $Val extends EventsFilter>
    implements $EventsFilterCopyWith<$Res> {
  _$EventsFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventsFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? eventTypes = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateFilter,
      eventTypes: null == eventTypes
          ? _value.eventTypes
          : eventTypes // ignore: cast_nullable_to_non_nullable
              as Set<EventType>,
    ) as $Val);
  }

  /// Create a copy of EventsFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DateFilterCopyWith<$Res> get date {
    return $DateFilterCopyWith<$Res>(_value.date, (value) {
      return _then(_value.copyWith(date: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EventsFilterImplCopyWith<$Res>
    implements $EventsFilterCopyWith<$Res> {
  factory _$$EventsFilterImplCopyWith(
          _$EventsFilterImpl value, $Res Function(_$EventsFilterImpl) then) =
      __$$EventsFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateFilter date, Set<EventType> eventTypes});

  @override
  $DateFilterCopyWith<$Res> get date;
}

/// @nodoc
class __$$EventsFilterImplCopyWithImpl<$Res>
    extends _$EventsFilterCopyWithImpl<$Res, _$EventsFilterImpl>
    implements _$$EventsFilterImplCopyWith<$Res> {
  __$$EventsFilterImplCopyWithImpl(
      _$EventsFilterImpl _value, $Res Function(_$EventsFilterImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventsFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? eventTypes = null,
  }) {
    return _then(_$EventsFilterImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateFilter,
      eventTypes: null == eventTypes
          ? _value._eventTypes
          : eventTypes // ignore: cast_nullable_to_non_nullable
              as Set<EventType>,
    ));
  }
}

/// @nodoc

class _$EventsFilterImpl implements _EventsFilter {
  _$EventsFilterImpl(
      {required this.date, final Set<EventType> eventTypes = const {}})
      : _eventTypes = eventTypes;

  @override
  final DateFilter date;
  final Set<EventType> _eventTypes;
  @override
  @JsonKey()
  Set<EventType> get eventTypes {
    if (_eventTypes is EqualUnmodifiableSetView) return _eventTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_eventTypes);
  }

  @override
  String toString() {
    return 'EventsFilter(date: $date, eventTypes: $eventTypes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventsFilterImpl &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality()
                .equals(other._eventTypes, _eventTypes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, date, const DeepCollectionEquality().hash(_eventTypes));

  /// Create a copy of EventsFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventsFilterImplCopyWith<_$EventsFilterImpl> get copyWith =>
      __$$EventsFilterImplCopyWithImpl<_$EventsFilterImpl>(this, _$identity);
}

abstract class _EventsFilter implements EventsFilter {
  factory _EventsFilter(
      {required final DateFilter date,
      final Set<EventType> eventTypes}) = _$EventsFilterImpl;

  @override
  DateFilter get date;
  @override
  Set<EventType> get eventTypes;

  /// Create a copy of EventsFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventsFilterImplCopyWith<_$EventsFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
