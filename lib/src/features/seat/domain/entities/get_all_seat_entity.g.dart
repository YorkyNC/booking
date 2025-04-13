// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_seat_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetAllSeatEntityImpl _$$GetAllSeatEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$GetAllSeatEntityImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => SeatItemEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$$GetAllSeatEntityImplToJson(
        _$GetAllSeatEntityImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'count': instance.count,
    };
