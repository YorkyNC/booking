// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detection_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetectionEntityImpl _$$DetectionEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$DetectionEntityImpl(
      id: json['id'] as String,
      subjectName: json['subjectName'] as String,
      classEntity:
          ClassEntity.fromJson(json['classEntity'] as Map<String, dynamic>),
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      processingCount: (json['processingCount'] as num?)?.toInt(),
      porcessedCount: (json['porcessedCount'] as num?)?.toInt(),
      room: json['room'] as String?,
      purpose: json['purpose'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$DetectionEntityImplToJson(
        _$DetectionEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subjectName': instance.subjectName,
      'classEntity': instance.classEntity,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'processingCount': instance.processingCount,
      'porcessedCount': instance.porcessedCount,
      'room': instance.room,
      'purpose': instance.purpose,
      'status': instance.status,
    };
