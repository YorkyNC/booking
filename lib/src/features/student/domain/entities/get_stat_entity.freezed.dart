// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_stat_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetStatEntity _$GetStatEntityFromJson(Map<String, dynamic> json) {
  return _GetStatEntity.fromJson(json);
}

/// @nodoc
mixin _$GetStatEntity {
  int get hoursInLibrary => throw _privateConstructorUsedError;
  int get minutesInLibrary => throw _privateConstructorUsedError;
  int get bookingDaysInMonth => throw _privateConstructorUsedError;
  int get recordDay => throw _privateConstructorUsedError;
  int get recordHours => throw _privateConstructorUsedError;

  /// Serializes this GetStatEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetStatEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetStatEntityCopyWith<GetStatEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetStatEntityCopyWith<$Res> {
  factory $GetStatEntityCopyWith(
          GetStatEntity value, $Res Function(GetStatEntity) then) =
      _$GetStatEntityCopyWithImpl<$Res, GetStatEntity>;
  @useResult
  $Res call(
      {int hoursInLibrary,
      int minutesInLibrary,
      int bookingDaysInMonth,
      int recordDay,
      int recordHours});
}

/// @nodoc
class _$GetStatEntityCopyWithImpl<$Res, $Val extends GetStatEntity>
    implements $GetStatEntityCopyWith<$Res> {
  _$GetStatEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetStatEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hoursInLibrary = null,
    Object? minutesInLibrary = null,
    Object? bookingDaysInMonth = null,
    Object? recordDay = null,
    Object? recordHours = null,
  }) {
    return _then(_value.copyWith(
      hoursInLibrary: null == hoursInLibrary
          ? _value.hoursInLibrary
          : hoursInLibrary // ignore: cast_nullable_to_non_nullable
              as int,
      minutesInLibrary: null == minutesInLibrary
          ? _value.minutesInLibrary
          : minutesInLibrary // ignore: cast_nullable_to_non_nullable
              as int,
      bookingDaysInMonth: null == bookingDaysInMonth
          ? _value.bookingDaysInMonth
          : bookingDaysInMonth // ignore: cast_nullable_to_non_nullable
              as int,
      recordDay: null == recordDay
          ? _value.recordDay
          : recordDay // ignore: cast_nullable_to_non_nullable
              as int,
      recordHours: null == recordHours
          ? _value.recordHours
          : recordHours // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetStatEntityImplCopyWith<$Res>
    implements $GetStatEntityCopyWith<$Res> {
  factory _$$GetStatEntityImplCopyWith(
          _$GetStatEntityImpl value, $Res Function(_$GetStatEntityImpl) then) =
      __$$GetStatEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int hoursInLibrary,
      int minutesInLibrary,
      int bookingDaysInMonth,
      int recordDay,
      int recordHours});
}

/// @nodoc
class __$$GetStatEntityImplCopyWithImpl<$Res>
    extends _$GetStatEntityCopyWithImpl<$Res, _$GetStatEntityImpl>
    implements _$$GetStatEntityImplCopyWith<$Res> {
  __$$GetStatEntityImplCopyWithImpl(
      _$GetStatEntityImpl _value, $Res Function(_$GetStatEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetStatEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hoursInLibrary = null,
    Object? minutesInLibrary = null,
    Object? bookingDaysInMonth = null,
    Object? recordDay = null,
    Object? recordHours = null,
  }) {
    return _then(_$GetStatEntityImpl(
      hoursInLibrary: null == hoursInLibrary
          ? _value.hoursInLibrary
          : hoursInLibrary // ignore: cast_nullable_to_non_nullable
              as int,
      minutesInLibrary: null == minutesInLibrary
          ? _value.minutesInLibrary
          : minutesInLibrary // ignore: cast_nullable_to_non_nullable
              as int,
      bookingDaysInMonth: null == bookingDaysInMonth
          ? _value.bookingDaysInMonth
          : bookingDaysInMonth // ignore: cast_nullable_to_non_nullable
              as int,
      recordDay: null == recordDay
          ? _value.recordDay
          : recordDay // ignore: cast_nullable_to_non_nullable
              as int,
      recordHours: null == recordHours
          ? _value.recordHours
          : recordHours // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetStatEntityImpl implements _GetStatEntity {
  const _$GetStatEntityImpl(
      {required this.hoursInLibrary,
      required this.minutesInLibrary,
      required this.bookingDaysInMonth,
      required this.recordDay,
      required this.recordHours});

  factory _$GetStatEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetStatEntityImplFromJson(json);

  @override
  final int hoursInLibrary;
  @override
  final int minutesInLibrary;
  @override
  final int bookingDaysInMonth;
  @override
  final int recordDay;
  @override
  final int recordHours;

  @override
  String toString() {
    return 'GetStatEntity(hoursInLibrary: $hoursInLibrary, minutesInLibrary: $minutesInLibrary, bookingDaysInMonth: $bookingDaysInMonth, recordDay: $recordDay, recordHours: $recordHours)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetStatEntityImpl &&
            (identical(other.hoursInLibrary, hoursInLibrary) ||
                other.hoursInLibrary == hoursInLibrary) &&
            (identical(other.minutesInLibrary, minutesInLibrary) ||
                other.minutesInLibrary == minutesInLibrary) &&
            (identical(other.bookingDaysInMonth, bookingDaysInMonth) ||
                other.bookingDaysInMonth == bookingDaysInMonth) &&
            (identical(other.recordDay, recordDay) ||
                other.recordDay == recordDay) &&
            (identical(other.recordHours, recordHours) ||
                other.recordHours == recordHours));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hoursInLibrary, minutesInLibrary,
      bookingDaysInMonth, recordDay, recordHours);

  /// Create a copy of GetStatEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetStatEntityImplCopyWith<_$GetStatEntityImpl> get copyWith =>
      __$$GetStatEntityImplCopyWithImpl<_$GetStatEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetStatEntityImplToJson(
      this,
    );
  }
}

abstract class _GetStatEntity implements GetStatEntity {
  const factory _GetStatEntity(
      {required final int hoursInLibrary,
      required final int minutesInLibrary,
      required final int bookingDaysInMonth,
      required final int recordDay,
      required final int recordHours}) = _$GetStatEntityImpl;

  factory _GetStatEntity.fromJson(Map<String, dynamic> json) =
      _$GetStatEntityImpl.fromJson;

  @override
  int get hoursInLibrary;
  @override
  int get minutesInLibrary;
  @override
  int get bookingDaysInMonth;
  @override
  int get recordDay;
  @override
  int get recordHours;

  /// Create a copy of GetStatEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetStatEntityImplCopyWith<_$GetStatEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
