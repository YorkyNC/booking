// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seat_item_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SeatItemEntity _$SeatItemEntityFromJson(Map<String, dynamic> json) {
  return _SeatItemEntity.fromJson(json);
}

/// @nodoc
mixin _$SeatItemEntity {
  int get id => throw _privateConstructorUsedError;
  String get number => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _statusFromJson)
  SeatStatus get status => throw _privateConstructorUsedError;
  int get floor => throw _privateConstructorUsedError;

  /// Serializes this SeatItemEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SeatItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SeatItemEntityCopyWith<SeatItemEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeatItemEntityCopyWith<$Res> {
  factory $SeatItemEntityCopyWith(
          SeatItemEntity value, $Res Function(SeatItemEntity) then) =
      _$SeatItemEntityCopyWithImpl<$Res, SeatItemEntity>;
  @useResult
  $Res call(
      {int id,
      String number,
      String location,
      @JsonKey(fromJson: _statusFromJson) SeatStatus status,
      int floor});
}

/// @nodoc
class _$SeatItemEntityCopyWithImpl<$Res, $Val extends SeatItemEntity>
    implements $SeatItemEntityCopyWith<$Res> {
  _$SeatItemEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SeatItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? number = null,
    Object? location = null,
    Object? status = null,
    Object? floor = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SeatStatus,
      floor: null == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SeatItemEntityImplCopyWith<$Res>
    implements $SeatItemEntityCopyWith<$Res> {
  factory _$$SeatItemEntityImplCopyWith(_$SeatItemEntityImpl value,
          $Res Function(_$SeatItemEntityImpl) then) =
      __$$SeatItemEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String number,
      String location,
      @JsonKey(fromJson: _statusFromJson) SeatStatus status,
      int floor});
}

/// @nodoc
class __$$SeatItemEntityImplCopyWithImpl<$Res>
    extends _$SeatItemEntityCopyWithImpl<$Res, _$SeatItemEntityImpl>
    implements _$$SeatItemEntityImplCopyWith<$Res> {
  __$$SeatItemEntityImplCopyWithImpl(
      _$SeatItemEntityImpl _value, $Res Function(_$SeatItemEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of SeatItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? number = null,
    Object? location = null,
    Object? status = null,
    Object? floor = null,
  }) {
    return _then(_$SeatItemEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SeatStatus,
      floor: null == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SeatItemEntityImpl implements _SeatItemEntity {
  const _$SeatItemEntityImpl(
      {required this.id,
      required this.number,
      required this.location,
      @JsonKey(fromJson: _statusFromJson) required this.status,
      required this.floor});

  factory _$SeatItemEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$SeatItemEntityImplFromJson(json);

  @override
  final int id;
  @override
  final String number;
  @override
  final String location;
  @override
  @JsonKey(fromJson: _statusFromJson)
  final SeatStatus status;
  @override
  final int floor;

  @override
  String toString() {
    return 'SeatItemEntity(id: $id, number: $number, location: $location, status: $status, floor: $floor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeatItemEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.floor, floor) || other.floor == floor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, number, location, status, floor);

  /// Create a copy of SeatItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SeatItemEntityImplCopyWith<_$SeatItemEntityImpl> get copyWith =>
      __$$SeatItemEntityImplCopyWithImpl<_$SeatItemEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SeatItemEntityImplToJson(
      this,
    );
  }
}

abstract class _SeatItemEntity implements SeatItemEntity {
  const factory _SeatItemEntity(
      {required final int id,
      required final String number,
      required final String location,
      @JsonKey(fromJson: _statusFromJson) required final SeatStatus status,
      required final int floor}) = _$SeatItemEntityImpl;

  factory _SeatItemEntity.fromJson(Map<String, dynamic> json) =
      _$SeatItemEntityImpl.fromJson;

  @override
  int get id;
  @override
  String get number;
  @override
  String get location;
  @override
  @JsonKey(fromJson: _statusFromJson)
  SeatStatus get status;
  @override
  int get floor;

  /// Create a copy of SeatItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SeatItemEntityImplCopyWith<_$SeatItemEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
