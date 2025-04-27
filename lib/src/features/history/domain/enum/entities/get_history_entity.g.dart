// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_history_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetHistoryEntityImpl _$$GetHistoryEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$GetHistoryEntityImpl(
      id: (json['id'] as num).toInt(),
      user: UserEntity.fromJson(json['user'] as Map<String, dynamic>),
      seat: SeatItemEntity.fromJson(json['seat'] as Map<String, dynamic>),
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      status: json['status'] as String,
      floor: (json['floor'] as num).toInt(),
      date: json['date'] as String,
    );

Map<String, dynamic> _$$GetHistoryEntityImplToJson(
        _$GetHistoryEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'seat': instance.seat,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'status': instance.status,
      'floor': instance.floor,
      'date': instance.date,
    };

_$GetHistoryListImpl _$$GetHistoryListImplFromJson(Map<String, dynamic> json) =>
    _$GetHistoryListImpl(
      bookings: (json['bookings'] as List<dynamic>)
          .map((e) => GetHistoryEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetHistoryListImplToJson(
        _$GetHistoryListImpl instance) =>
    <String, dynamic>{
      'bookings': instance.bookings,
    };
