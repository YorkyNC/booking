// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_history_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetHistoryEntity _$GetHistoryEntityFromJson(Map<String, dynamic> json) {
  return _GetHistoryEntity.fromJson(json);
}

/// @nodoc
mixin _$GetHistoryEntity {
  int get id => throw _privateConstructorUsedError;
  UserEntity get user => throw _privateConstructorUsedError;
  SeatItemEntity get seat => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
  BookingStatus get status => throw _privateConstructorUsedError;
  int get floor => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;

  /// Serializes this GetHistoryEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetHistoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetHistoryEntityCopyWith<GetHistoryEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetHistoryEntityCopyWith<$Res> {
  factory $GetHistoryEntityCopyWith(
          GetHistoryEntity value, $Res Function(GetHistoryEntity) then) =
      _$GetHistoryEntityCopyWithImpl<$Res, GetHistoryEntity>;
  @useResult
  $Res call(
      {int id,
      UserEntity user,
      SeatItemEntity seat,
      DateTime startTime,
      DateTime endTime,
      @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
      BookingStatus status,
      int floor,
      String date});

  $UserEntityCopyWith<$Res> get user;
  $SeatItemEntityCopyWith<$Res> get seat;
}

/// @nodoc
class _$GetHistoryEntityCopyWithImpl<$Res, $Val extends GetHistoryEntity>
    implements $GetHistoryEntityCopyWith<$Res> {
  _$GetHistoryEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetHistoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? seat = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? status = null,
    Object? floor = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity,
      seat: null == seat
          ? _value.seat
          : seat // ignore: cast_nullable_to_non_nullable
              as SeatItemEntity,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BookingStatus,
      floor: null == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of GetHistoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserEntityCopyWith<$Res> get user {
    return $UserEntityCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  /// Create a copy of GetHistoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SeatItemEntityCopyWith<$Res> get seat {
    return $SeatItemEntityCopyWith<$Res>(_value.seat, (value) {
      return _then(_value.copyWith(seat: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetHistoryEntityImplCopyWith<$Res>
    implements $GetHistoryEntityCopyWith<$Res> {
  factory _$$GetHistoryEntityImplCopyWith(_$GetHistoryEntityImpl value,
          $Res Function(_$GetHistoryEntityImpl) then) =
      __$$GetHistoryEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      UserEntity user,
      SeatItemEntity seat,
      DateTime startTime,
      DateTime endTime,
      @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
      BookingStatus status,
      int floor,
      String date});

  @override
  $UserEntityCopyWith<$Res> get user;
  @override
  $SeatItemEntityCopyWith<$Res> get seat;
}

/// @nodoc
class __$$GetHistoryEntityImplCopyWithImpl<$Res>
    extends _$GetHistoryEntityCopyWithImpl<$Res, _$GetHistoryEntityImpl>
    implements _$$GetHistoryEntityImplCopyWith<$Res> {
  __$$GetHistoryEntityImplCopyWithImpl(_$GetHistoryEntityImpl _value,
      $Res Function(_$GetHistoryEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetHistoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? seat = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? status = null,
    Object? floor = null,
    Object? date = null,
  }) {
    return _then(_$GetHistoryEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity,
      seat: null == seat
          ? _value.seat
          : seat // ignore: cast_nullable_to_non_nullable
              as SeatItemEntity,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BookingStatus,
      floor: null == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetHistoryEntityImpl implements _GetHistoryEntity {
  const _$GetHistoryEntityImpl(
      {required this.id,
      required this.user,
      required this.seat,
      required this.startTime,
      required this.endTime,
      @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
      required this.status,
      required this.floor,
      required this.date});

  factory _$GetHistoryEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetHistoryEntityImplFromJson(json);

  @override
  final int id;
  @override
  final UserEntity user;
  @override
  final SeatItemEntity seat;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
  final BookingStatus status;
  @override
  final int floor;
  @override
  final String date;

  @override
  String toString() {
    return 'GetHistoryEntity(id: $id, user: $user, seat: $seat, startTime: $startTime, endTime: $endTime, status: $status, floor: $floor, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetHistoryEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.seat, seat) || other.seat == seat) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.floor, floor) || other.floor == floor) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, user, seat, startTime, endTime, status, floor, date);

  /// Create a copy of GetHistoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetHistoryEntityImplCopyWith<_$GetHistoryEntityImpl> get copyWith =>
      __$$GetHistoryEntityImplCopyWithImpl<_$GetHistoryEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetHistoryEntityImplToJson(
      this,
    );
  }
}

abstract class _GetHistoryEntity implements GetHistoryEntity {
  const factory _GetHistoryEntity(
      {required final int id,
      required final UserEntity user,
      required final SeatItemEntity seat,
      required final DateTime startTime,
      required final DateTime endTime,
      @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
      required final BookingStatus status,
      required final int floor,
      required final String date}) = _$GetHistoryEntityImpl;

  factory _GetHistoryEntity.fromJson(Map<String, dynamic> json) =
      _$GetHistoryEntityImpl.fromJson;

  @override
  int get id;
  @override
  UserEntity get user;
  @override
  SeatItemEntity get seat;
  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
  BookingStatus get status;
  @override
  int get floor;
  @override
  String get date;

  /// Create a copy of GetHistoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetHistoryEntityImplCopyWith<_$GetHistoryEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GetHistoryList _$GetHistoryListFromJson(Map<String, dynamic> json) {
  return _GetHistoryList.fromJson(json);
}

/// @nodoc
mixin _$GetHistoryList {
  List<GetHistoryEntity> get bookings => throw _privateConstructorUsedError;

  /// Serializes this GetHistoryList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetHistoryList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetHistoryListCopyWith<GetHistoryList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetHistoryListCopyWith<$Res> {
  factory $GetHistoryListCopyWith(
          GetHistoryList value, $Res Function(GetHistoryList) then) =
      _$GetHistoryListCopyWithImpl<$Res, GetHistoryList>;
  @useResult
  $Res call({List<GetHistoryEntity> bookings});
}

/// @nodoc
class _$GetHistoryListCopyWithImpl<$Res, $Val extends GetHistoryList>
    implements $GetHistoryListCopyWith<$Res> {
  _$GetHistoryListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetHistoryList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookings = null,
  }) {
    return _then(_value.copyWith(
      bookings: null == bookings
          ? _value.bookings
          : bookings // ignore: cast_nullable_to_non_nullable
              as List<GetHistoryEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetHistoryListImplCopyWith<$Res>
    implements $GetHistoryListCopyWith<$Res> {
  factory _$$GetHistoryListImplCopyWith(_$GetHistoryListImpl value,
          $Res Function(_$GetHistoryListImpl) then) =
      __$$GetHistoryListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<GetHistoryEntity> bookings});
}

/// @nodoc
class __$$GetHistoryListImplCopyWithImpl<$Res>
    extends _$GetHistoryListCopyWithImpl<$Res, _$GetHistoryListImpl>
    implements _$$GetHistoryListImplCopyWith<$Res> {
  __$$GetHistoryListImplCopyWithImpl(
      _$GetHistoryListImpl _value, $Res Function(_$GetHistoryListImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetHistoryList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookings = null,
  }) {
    return _then(_$GetHistoryListImpl(
      bookings: null == bookings
          ? _value._bookings
          : bookings // ignore: cast_nullable_to_non_nullable
              as List<GetHistoryEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetHistoryListImpl implements _GetHistoryList {
  const _$GetHistoryListImpl({required final List<GetHistoryEntity> bookings})
      : _bookings = bookings;

  factory _$GetHistoryListImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetHistoryListImplFromJson(json);

  final List<GetHistoryEntity> _bookings;
  @override
  List<GetHistoryEntity> get bookings {
    if (_bookings is EqualUnmodifiableListView) return _bookings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookings);
  }

  @override
  String toString() {
    return 'GetHistoryList(bookings: $bookings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetHistoryListImpl &&
            const DeepCollectionEquality().equals(other._bookings, _bookings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_bookings));

  /// Create a copy of GetHistoryList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetHistoryListImplCopyWith<_$GetHistoryListImpl> get copyWith =>
      __$$GetHistoryListImplCopyWithImpl<_$GetHistoryListImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetHistoryListImplToJson(
      this,
    );
  }
}

abstract class _GetHistoryList implements GetHistoryList {
  const factory _GetHistoryList(
      {required final List<GetHistoryEntity> bookings}) = _$GetHistoryListImpl;

  factory _GetHistoryList.fromJson(Map<String, dynamic> json) =
      _$GetHistoryListImpl.fromJson;

  @override
  List<GetHistoryEntity> get bookings;

  /// Create a copy of GetHistoryList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetHistoryListImplCopyWith<_$GetHistoryListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
