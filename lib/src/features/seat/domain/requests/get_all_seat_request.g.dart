// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_seat_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetAllSeatRequestImpl _$$GetAllSeatRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$GetAllSeatRequestImpl(
      floor: (json['floor'] as num).toInt(),
      date: json['date'] as String,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
    );

Map<String, dynamic> _$$GetAllSeatRequestImplToJson(
        _$GetAllSeatRequestImpl instance) =>
    <String, dynamic>{
      'floor': instance.floor,
      'date': instance.date,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
    };
