// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seat_item_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SeatItemEntityImpl _$$SeatItemEntityImplFromJson(Map<String, dynamic> json) =>
    _$SeatItemEntityImpl(
      id: (json['id'] as num).toInt(),
      number: json['number'] as String,
      location: json['location'] as String,
      status: _statusFromJson(json['status']),
      floor: (json['floor'] as num).toInt(),
    );

Map<String, dynamic> _$$SeatItemEntityImplToJson(
        _$SeatItemEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'location': instance.location,
      'status': _$SeatStatusEnumMap[instance.status]!,
      'floor': instance.floor,
    };

const _$SeatStatusEnumMap = {
  SeatStatus.available: 'AVAILABLE',
  SeatStatus.unavailable: 'UNAVAILABLE',
  SeatStatus.pending: 'PENDING',
  SeatStatus.deleted: 'DELETED',
};
