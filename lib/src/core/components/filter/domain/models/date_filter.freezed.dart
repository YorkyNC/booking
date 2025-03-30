// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'date_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DateFilter {
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime startDate, DateTime? endDate) day,
    required TResult Function(DateTime startDate, DateTime endDate) week,
    required TResult Function(DateTime startDate, DateTime endDate) month,
    required TResult Function(DateTime startDate, DateTime endDate) custom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime startDate, DateTime? endDate)? day,
    TResult? Function(DateTime startDate, DateTime endDate)? week,
    TResult? Function(DateTime startDate, DateTime endDate)? month,
    TResult? Function(DateTime startDate, DateTime endDate)? custom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime startDate, DateTime? endDate)? day,
    TResult Function(DateTime startDate, DateTime endDate)? week,
    TResult Function(DateTime startDate, DateTime endDate)? month,
    TResult Function(DateTime startDate, DateTime endDate)? custom,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DateFilterDay value) day,
    required TResult Function(DateFilterWeek value) week,
    required TResult Function(DateFilterMonth value) month,
    required TResult Function(DateFilterCustom value) custom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DateFilterDay value)? day,
    TResult? Function(DateFilterWeek value)? week,
    TResult? Function(DateFilterMonth value)? month,
    TResult? Function(DateFilterCustom value)? custom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DateFilterDay value)? day,
    TResult Function(DateFilterWeek value)? week,
    TResult Function(DateFilterMonth value)? month,
    TResult Function(DateFilterCustom value)? custom,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of DateFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DateFilterCopyWith<DateFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DateFilterCopyWith<$Res> {
  factory $DateFilterCopyWith(
          DateFilter value, $Res Function(DateFilter) then) =
      _$DateFilterCopyWithImpl<$Res, DateFilter>;
  @useResult
  $Res call({DateTime startDate, DateTime endDate});
}

/// @nodoc
class _$DateFilterCopyWithImpl<$Res, $Val extends DateFilter>
    implements $DateFilterCopyWith<$Res> {
  _$DateFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DateFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_value.copyWith(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate!
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DateFilterDayImplCopyWith<$Res>
    implements $DateFilterCopyWith<$Res> {
  factory _$$DateFilterDayImplCopyWith(
          _$DateFilterDayImpl value, $Res Function(_$DateFilterDayImpl) then) =
      __$$DateFilterDayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime startDate, DateTime? endDate});
}

/// @nodoc
class __$$DateFilterDayImplCopyWithImpl<$Res>
    extends _$DateFilterCopyWithImpl<$Res, _$DateFilterDayImpl>
    implements _$$DateFilterDayImplCopyWith<$Res> {
  __$$DateFilterDayImplCopyWithImpl(
      _$DateFilterDayImpl _value, $Res Function(_$DateFilterDayImpl) _then)
      : super(_value, _then);

  /// Create a copy of DateFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = freezed,
  }) {
    return _then(_$DateFilterDayImpl(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$DateFilterDayImpl implements DateFilterDay {
  _$DateFilterDayImpl({required this.startDate, this.endDate});

  @override
  final DateTime startDate;
  @override
  final DateTime? endDate;

  @override
  String toString() {
    return 'DateFilter.day(startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DateFilterDayImpl &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate);

  /// Create a copy of DateFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DateFilterDayImplCopyWith<_$DateFilterDayImpl> get copyWith =>
      __$$DateFilterDayImplCopyWithImpl<_$DateFilterDayImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime startDate, DateTime? endDate) day,
    required TResult Function(DateTime startDate, DateTime endDate) week,
    required TResult Function(DateTime startDate, DateTime endDate) month,
    required TResult Function(DateTime startDate, DateTime endDate) custom,
  }) {
    return day(startDate, endDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime startDate, DateTime? endDate)? day,
    TResult? Function(DateTime startDate, DateTime endDate)? week,
    TResult? Function(DateTime startDate, DateTime endDate)? month,
    TResult? Function(DateTime startDate, DateTime endDate)? custom,
  }) {
    return day?.call(startDate, endDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime startDate, DateTime? endDate)? day,
    TResult Function(DateTime startDate, DateTime endDate)? week,
    TResult Function(DateTime startDate, DateTime endDate)? month,
    TResult Function(DateTime startDate, DateTime endDate)? custom,
    required TResult orElse(),
  }) {
    if (day != null) {
      return day(startDate, endDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DateFilterDay value) day,
    required TResult Function(DateFilterWeek value) week,
    required TResult Function(DateFilterMonth value) month,
    required TResult Function(DateFilterCustom value) custom,
  }) {
    return day(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DateFilterDay value)? day,
    TResult? Function(DateFilterWeek value)? week,
    TResult? Function(DateFilterMonth value)? month,
    TResult? Function(DateFilterCustom value)? custom,
  }) {
    return day?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DateFilterDay value)? day,
    TResult Function(DateFilterWeek value)? week,
    TResult Function(DateFilterMonth value)? month,
    TResult Function(DateFilterCustom value)? custom,
    required TResult orElse(),
  }) {
    if (day != null) {
      return day(this);
    }
    return orElse();
  }
}

abstract class DateFilterDay implements DateFilter {
  factory DateFilterDay(
      {required final DateTime startDate,
      final DateTime? endDate}) = _$DateFilterDayImpl;

  @override
  DateTime get startDate;
  @override
  DateTime? get endDate;

  /// Create a copy of DateFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DateFilterDayImplCopyWith<_$DateFilterDayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DateFilterWeekImplCopyWith<$Res>
    implements $DateFilterCopyWith<$Res> {
  factory _$$DateFilterWeekImplCopyWith(_$DateFilterWeekImpl value,
          $Res Function(_$DateFilterWeekImpl) then) =
      __$$DateFilterWeekImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime startDate, DateTime endDate});
}

/// @nodoc
class __$$DateFilterWeekImplCopyWithImpl<$Res>
    extends _$DateFilterCopyWithImpl<$Res, _$DateFilterWeekImpl>
    implements _$$DateFilterWeekImplCopyWith<$Res> {
  __$$DateFilterWeekImplCopyWithImpl(
      _$DateFilterWeekImpl _value, $Res Function(_$DateFilterWeekImpl) _then)
      : super(_value, _then);

  /// Create a copy of DateFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_$DateFilterWeekImpl(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$DateFilterWeekImpl implements DateFilterWeek {
  _$DateFilterWeekImpl({required this.startDate, required this.endDate});

  @override
  final DateTime startDate;
  @override
  final DateTime endDate;

  @override
  String toString() {
    return 'DateFilter.week(startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DateFilterWeekImpl &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate);

  /// Create a copy of DateFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DateFilterWeekImplCopyWith<_$DateFilterWeekImpl> get copyWith =>
      __$$DateFilterWeekImplCopyWithImpl<_$DateFilterWeekImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime startDate, DateTime? endDate) day,
    required TResult Function(DateTime startDate, DateTime endDate) week,
    required TResult Function(DateTime startDate, DateTime endDate) month,
    required TResult Function(DateTime startDate, DateTime endDate) custom,
  }) {
    return week(startDate, endDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime startDate, DateTime? endDate)? day,
    TResult? Function(DateTime startDate, DateTime endDate)? week,
    TResult? Function(DateTime startDate, DateTime endDate)? month,
    TResult? Function(DateTime startDate, DateTime endDate)? custom,
  }) {
    return week?.call(startDate, endDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime startDate, DateTime? endDate)? day,
    TResult Function(DateTime startDate, DateTime endDate)? week,
    TResult Function(DateTime startDate, DateTime endDate)? month,
    TResult Function(DateTime startDate, DateTime endDate)? custom,
    required TResult orElse(),
  }) {
    if (week != null) {
      return week(startDate, endDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DateFilterDay value) day,
    required TResult Function(DateFilterWeek value) week,
    required TResult Function(DateFilterMonth value) month,
    required TResult Function(DateFilterCustom value) custom,
  }) {
    return week(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DateFilterDay value)? day,
    TResult? Function(DateFilterWeek value)? week,
    TResult? Function(DateFilterMonth value)? month,
    TResult? Function(DateFilterCustom value)? custom,
  }) {
    return week?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DateFilterDay value)? day,
    TResult Function(DateFilterWeek value)? week,
    TResult Function(DateFilterMonth value)? month,
    TResult Function(DateFilterCustom value)? custom,
    required TResult orElse(),
  }) {
    if (week != null) {
      return week(this);
    }
    return orElse();
  }
}

abstract class DateFilterWeek implements DateFilter {
  factory DateFilterWeek(
      {required final DateTime startDate,
      required final DateTime endDate}) = _$DateFilterWeekImpl;

  @override
  DateTime get startDate;
  @override
  DateTime get endDate;

  /// Create a copy of DateFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DateFilterWeekImplCopyWith<_$DateFilterWeekImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DateFilterMonthImplCopyWith<$Res>
    implements $DateFilterCopyWith<$Res> {
  factory _$$DateFilterMonthImplCopyWith(_$DateFilterMonthImpl value,
          $Res Function(_$DateFilterMonthImpl) then) =
      __$$DateFilterMonthImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime startDate, DateTime endDate});
}

/// @nodoc
class __$$DateFilterMonthImplCopyWithImpl<$Res>
    extends _$DateFilterCopyWithImpl<$Res, _$DateFilterMonthImpl>
    implements _$$DateFilterMonthImplCopyWith<$Res> {
  __$$DateFilterMonthImplCopyWithImpl(
      _$DateFilterMonthImpl _value, $Res Function(_$DateFilterMonthImpl) _then)
      : super(_value, _then);

  /// Create a copy of DateFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_$DateFilterMonthImpl(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$DateFilterMonthImpl implements DateFilterMonth {
  _$DateFilterMonthImpl({required this.startDate, required this.endDate});

  @override
  final DateTime startDate;
  @override
  final DateTime endDate;

  @override
  String toString() {
    return 'DateFilter.month(startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DateFilterMonthImpl &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate);

  /// Create a copy of DateFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DateFilterMonthImplCopyWith<_$DateFilterMonthImpl> get copyWith =>
      __$$DateFilterMonthImplCopyWithImpl<_$DateFilterMonthImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime startDate, DateTime? endDate) day,
    required TResult Function(DateTime startDate, DateTime endDate) week,
    required TResult Function(DateTime startDate, DateTime endDate) month,
    required TResult Function(DateTime startDate, DateTime endDate) custom,
  }) {
    return month(startDate, endDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime startDate, DateTime? endDate)? day,
    TResult? Function(DateTime startDate, DateTime endDate)? week,
    TResult? Function(DateTime startDate, DateTime endDate)? month,
    TResult? Function(DateTime startDate, DateTime endDate)? custom,
  }) {
    return month?.call(startDate, endDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime startDate, DateTime? endDate)? day,
    TResult Function(DateTime startDate, DateTime endDate)? week,
    TResult Function(DateTime startDate, DateTime endDate)? month,
    TResult Function(DateTime startDate, DateTime endDate)? custom,
    required TResult orElse(),
  }) {
    if (month != null) {
      return month(startDate, endDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DateFilterDay value) day,
    required TResult Function(DateFilterWeek value) week,
    required TResult Function(DateFilterMonth value) month,
    required TResult Function(DateFilterCustom value) custom,
  }) {
    return month(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DateFilterDay value)? day,
    TResult? Function(DateFilterWeek value)? week,
    TResult? Function(DateFilterMonth value)? month,
    TResult? Function(DateFilterCustom value)? custom,
  }) {
    return month?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DateFilterDay value)? day,
    TResult Function(DateFilterWeek value)? week,
    TResult Function(DateFilterMonth value)? month,
    TResult Function(DateFilterCustom value)? custom,
    required TResult orElse(),
  }) {
    if (month != null) {
      return month(this);
    }
    return orElse();
  }
}

abstract class DateFilterMonth implements DateFilter {
  factory DateFilterMonth(
      {required final DateTime startDate,
      required final DateTime endDate}) = _$DateFilterMonthImpl;

  @override
  DateTime get startDate;
  @override
  DateTime get endDate;

  /// Create a copy of DateFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DateFilterMonthImplCopyWith<_$DateFilterMonthImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DateFilterCustomImplCopyWith<$Res>
    implements $DateFilterCopyWith<$Res> {
  factory _$$DateFilterCustomImplCopyWith(_$DateFilterCustomImpl value,
          $Res Function(_$DateFilterCustomImpl) then) =
      __$$DateFilterCustomImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime startDate, DateTime endDate});
}

/// @nodoc
class __$$DateFilterCustomImplCopyWithImpl<$Res>
    extends _$DateFilterCopyWithImpl<$Res, _$DateFilterCustomImpl>
    implements _$$DateFilterCustomImplCopyWith<$Res> {
  __$$DateFilterCustomImplCopyWithImpl(_$DateFilterCustomImpl _value,
      $Res Function(_$DateFilterCustomImpl) _then)
      : super(_value, _then);

  /// Create a copy of DateFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_$DateFilterCustomImpl(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$DateFilterCustomImpl implements DateFilterCustom {
  _$DateFilterCustomImpl({required this.startDate, required this.endDate});

  @override
  final DateTime startDate;
  @override
  final DateTime endDate;

  @override
  String toString() {
    return 'DateFilter.custom(startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DateFilterCustomImpl &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate);

  /// Create a copy of DateFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DateFilterCustomImplCopyWith<_$DateFilterCustomImpl> get copyWith =>
      __$$DateFilterCustomImplCopyWithImpl<_$DateFilterCustomImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime startDate, DateTime? endDate) day,
    required TResult Function(DateTime startDate, DateTime endDate) week,
    required TResult Function(DateTime startDate, DateTime endDate) month,
    required TResult Function(DateTime startDate, DateTime endDate) custom,
  }) {
    return custom(startDate, endDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime startDate, DateTime? endDate)? day,
    TResult? Function(DateTime startDate, DateTime endDate)? week,
    TResult? Function(DateTime startDate, DateTime endDate)? month,
    TResult? Function(DateTime startDate, DateTime endDate)? custom,
  }) {
    return custom?.call(startDate, endDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime startDate, DateTime? endDate)? day,
    TResult Function(DateTime startDate, DateTime endDate)? week,
    TResult Function(DateTime startDate, DateTime endDate)? month,
    TResult Function(DateTime startDate, DateTime endDate)? custom,
    required TResult orElse(),
  }) {
    if (custom != null) {
      return custom(startDate, endDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DateFilterDay value) day,
    required TResult Function(DateFilterWeek value) week,
    required TResult Function(DateFilterMonth value) month,
    required TResult Function(DateFilterCustom value) custom,
  }) {
    return custom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DateFilterDay value)? day,
    TResult? Function(DateFilterWeek value)? week,
    TResult? Function(DateFilterMonth value)? month,
    TResult? Function(DateFilterCustom value)? custom,
  }) {
    return custom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DateFilterDay value)? day,
    TResult Function(DateFilterWeek value)? week,
    TResult Function(DateFilterMonth value)? month,
    TResult Function(DateFilterCustom value)? custom,
    required TResult orElse(),
  }) {
    if (custom != null) {
      return custom(this);
    }
    return orElse();
  }
}

abstract class DateFilterCustom implements DateFilter {
  factory DateFilterCustom(
      {required final DateTime startDate,
      required final DateTime endDate}) = _$DateFilterCustomImpl;

  @override
  DateTime get startDate;
  @override
  DateTime get endDate;

  /// Create a copy of DateFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DateFilterCustomImplCopyWith<_$DateFilterCustomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
