// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_reservation_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateReservationEntity _$CreateReservationEntityFromJson(
    Map<String, dynamic> json) {
  return _CreateReservationEntity.fromJson(json);
}

/// @nodoc
mixin _$CreateReservationEntity {
  int get id => throw _privateConstructorUsedError;
  String get startTime => throw _privateConstructorUsedError;
  String get endTime => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  int get floor => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _statusFromJson)
  SeatStatus get status => throw _privateConstructorUsedError;
  SeatItemEntity get seat => throw _privateConstructorUsedError;
  UserEntity get user => throw _privateConstructorUsedError;

  /// Serializes this CreateReservationEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateReservationEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateReservationEntityCopyWith<CreateReservationEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateReservationEntityCopyWith<$Res> {
  factory $CreateReservationEntityCopyWith(CreateReservationEntity value,
          $Res Function(CreateReservationEntity) then) =
      _$CreateReservationEntityCopyWithImpl<$Res, CreateReservationEntity>;
  @useResult
  $Res call(
      {int id,
      String startTime,
      String endTime,
      String date,
      int floor,
      @JsonKey(fromJson: _statusFromJson) SeatStatus status,
      SeatItemEntity seat,
      UserEntity user});

  $SeatItemEntityCopyWith<$Res> get seat;
  $UserEntityCopyWith<$Res> get user;
}

/// @nodoc
class _$CreateReservationEntityCopyWithImpl<$Res,
        $Val extends CreateReservationEntity>
    implements $CreateReservationEntityCopyWith<$Res> {
  _$CreateReservationEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateReservationEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? date = null,
    Object? floor = null,
    Object? status = null,
    Object? seat = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      floor: null == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SeatStatus,
      seat: null == seat
          ? _value.seat
          : seat // ignore: cast_nullable_to_non_nullable
              as SeatItemEntity,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity,
    ) as $Val);
  }

  /// Create a copy of CreateReservationEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SeatItemEntityCopyWith<$Res> get seat {
    return $SeatItemEntityCopyWith<$Res>(_value.seat, (value) {
      return _then(_value.copyWith(seat: value) as $Val);
    });
  }

  /// Create a copy of CreateReservationEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserEntityCopyWith<$Res> get user {
    return $UserEntityCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateReservationEntityImplCopyWith<$Res>
    implements $CreateReservationEntityCopyWith<$Res> {
  factory _$$CreateReservationEntityImplCopyWith(
          _$CreateReservationEntityImpl value,
          $Res Function(_$CreateReservationEntityImpl) then) =
      __$$CreateReservationEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String startTime,
      String endTime,
      String date,
      int floor,
      @JsonKey(fromJson: _statusFromJson) SeatStatus status,
      SeatItemEntity seat,
      UserEntity user});

  @override
  $SeatItemEntityCopyWith<$Res> get seat;
  @override
  $UserEntityCopyWith<$Res> get user;
}

/// @nodoc
class __$$CreateReservationEntityImplCopyWithImpl<$Res>
    extends _$CreateReservationEntityCopyWithImpl<$Res,
        _$CreateReservationEntityImpl>
    implements _$$CreateReservationEntityImplCopyWith<$Res> {
  __$$CreateReservationEntityImplCopyWithImpl(
      _$CreateReservationEntityImpl _value,
      $Res Function(_$CreateReservationEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateReservationEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? date = null,
    Object? floor = null,
    Object? status = null,
    Object? seat = null,
    Object? user = null,
  }) {
    return _then(_$CreateReservationEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      floor: null == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SeatStatus,
      seat: null == seat
          ? _value.seat
          : seat // ignore: cast_nullable_to_non_nullable
              as SeatItemEntity,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateReservationEntityImpl implements _CreateReservationEntity {
  const _$CreateReservationEntityImpl(
      {required this.id,
      required this.startTime,
      required this.endTime,
      required this.date,
      required this.floor,
      @JsonKey(fromJson: _statusFromJson) required this.status,
      required this.seat,
      required this.user});

  factory _$CreateReservationEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateReservationEntityImplFromJson(json);

  @override
  final int id;
  @override
  final String startTime;
  @override
  final String endTime;
  @override
  final String date;
  @override
  final int floor;
  @override
  @JsonKey(fromJson: _statusFromJson)
  final SeatStatus status;
  @override
  final SeatItemEntity seat;
  @override
  final UserEntity user;

  @override
  String toString() {
    return 'CreateReservationEntity(id: $id, startTime: $startTime, endTime: $endTime, date: $date, floor: $floor, status: $status, seat: $seat, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateReservationEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.floor, floor) || other.floor == floor) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.seat, seat) || other.seat == seat) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, startTime, endTime, date, floor, status, seat, user);

  /// Create a copy of CreateReservationEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateReservationEntityImplCopyWith<_$CreateReservationEntityImpl>
      get copyWith => __$$CreateReservationEntityImplCopyWithImpl<
          _$CreateReservationEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateReservationEntityImplToJson(
      this,
    );
  }
}

abstract class _CreateReservationEntity implements CreateReservationEntity {
  const factory _CreateReservationEntity(
      {required final int id,
      required final String startTime,
      required final String endTime,
      required final String date,
      required final int floor,
      @JsonKey(fromJson: _statusFromJson) required final SeatStatus status,
      required final SeatItemEntity seat,
      required final UserEntity user}) = _$CreateReservationEntityImpl;

  factory _CreateReservationEntity.fromJson(Map<String, dynamic> json) =
      _$CreateReservationEntityImpl.fromJson;

  @override
  int get id;
  @override
  String get startTime;
  @override
  String get endTime;
  @override
  String get date;
  @override
  int get floor;
  @override
  @JsonKey(fromJson: _statusFromJson)
  SeatStatus get status;
  @override
  SeatItemEntity get seat;
  @override
  UserEntity get user;

  /// Create a copy of CreateReservationEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateReservationEntityImplCopyWith<_$CreateReservationEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
