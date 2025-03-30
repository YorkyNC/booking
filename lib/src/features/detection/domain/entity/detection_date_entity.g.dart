// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detection_date_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetectionDateEntityImpl _$$DetectionDateEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$DetectionDateEntityImpl(
      date: DateTime.parse(json['date'] as String),
      detections: (json['detections'] as List<dynamic>)
          .map((e) => DetectionEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DetectionDateEntityImplToJson(
        _$DetectionDateEntityImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'detections': instance.detections,
    };
