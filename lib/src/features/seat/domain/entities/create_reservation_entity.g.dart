// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_reservation_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateReservationEntityImpl _$$CreateReservationEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateReservationEntityImpl(
      id: (json['id'] as num).toInt(),
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      date: json['date'] as String,
      floor: (json['floor'] as num).toInt(),
      status: _statusFromJson(json['status']),
      seat: SeatItemEntity.fromJson(json['seat'] as Map<String, dynamic>),
      user: UserEntity.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CreateReservationEntityImplToJson(
        _$CreateReservationEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'date': instance.date,
      'floor': instance.floor,
      'status': _$SeatStatusEnumMap[instance.status]!,
      'seat': instance.seat,
      'user': instance.user,
    };

const _$SeatStatusEnumMap = {
  SeatStatus.available: 'AVAILABLE',
  SeatStatus.unavailable: 'UNAVAILABLE',
  SeatStatus.pending: 'PENDING',
  SeatStatus.deleted: 'DELETED',
};
