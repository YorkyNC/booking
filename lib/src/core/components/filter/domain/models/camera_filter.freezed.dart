// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'camera_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CameraFilter {
  DateFilter get date => throw _privateConstructorUsedError;
  Set<EventType> get eventTypes => throw _privateConstructorUsedError;

  /// Create a copy of CameraFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CameraFilterCopyWith<CameraFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CameraFilterCopyWith<$Res> {
  factory $CameraFilterCopyWith(
          CameraFilter value, $Res Function(CameraFilter) then) =
      _$CameraFilterCopyWithImpl<$Res, CameraFilter>;
  @useResult
  $Res call({DateFilter date, Set<EventType> eventTypes});

  $DateFilterCopyWith<$Res> get date;
}

/// @nodoc
class _$CameraFilterCopyWithImpl<$Res, $Val extends CameraFilter>
    implements $CameraFilterCopyWith<$Res> {
  _$CameraFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CameraFilter
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

  /// Create a copy of CameraFilter
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
abstract class _$$CameraFilterImplCopyWith<$Res>
    implements $CameraFilterCopyWith<$Res> {
  factory _$$CameraFilterImplCopyWith(
          _$CameraFilterImpl value, $Res Function(_$CameraFilterImpl) then) =
      __$$CameraFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateFilter date, Set<EventType> eventTypes});

  @override
  $DateFilterCopyWith<$Res> get date;
}

/// @nodoc
class __$$CameraFilterImplCopyWithImpl<$Res>
    extends _$CameraFilterCopyWithImpl<$Res, _$CameraFilterImpl>
    implements _$$CameraFilterImplCopyWith<$Res> {
  __$$CameraFilterImplCopyWithImpl(
      _$CameraFilterImpl _value, $Res Function(_$CameraFilterImpl) _then)
      : super(_value, _then);

  /// Create a copy of CameraFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? eventTypes = null,
  }) {
    return _then(_$CameraFilterImpl(
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

class _$CameraFilterImpl implements _CameraFilter {
  _$CameraFilterImpl(
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
    return 'CameraFilter(date: $date, eventTypes: $eventTypes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CameraFilterImpl &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality()
                .equals(other._eventTypes, _eventTypes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, date, const DeepCollectionEquality().hash(_eventTypes));

  /// Create a copy of CameraFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CameraFilterImplCopyWith<_$CameraFilterImpl> get copyWith =>
      __$$CameraFilterImplCopyWithImpl<_$CameraFilterImpl>(this, _$identity);
}

abstract class _CameraFilter implements CameraFilter {
  factory _CameraFilter(
      {required final DateFilter date,
      final Set<EventType> eventTypes}) = _$CameraFilterImpl;

  @override
  DateFilter get date;
  @override
  Set<EventType> get eventTypes;

  /// Create a copy of CameraFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CameraFilterImplCopyWith<_$CameraFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
