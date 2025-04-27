// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_history_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetHistoryRequestImpl _$$GetHistoryRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$GetHistoryRequestImpl(
      userId: (json['userId'] as num).toInt(),
      seatId: (json['seatId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$GetHistoryRequestImplToJson(
        _$GetHistoryRequestImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'seatId': instance.seatId,
    };
