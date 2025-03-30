// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventEntityImpl _$$EventEntityImplFromJson(Map<String, dynamic> json) =>
    _$EventEntityImpl(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      expiresAt: DateTime.parse(json['expiresAt'] as String),
      location: json['location'] as String,
      eventType: $enumDecode(_$EventTypeEnumMap, json['eventType']),
      videoUrl: json['videoUrl'] as String,
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      assignedTo: json['assignedTo'] == null
          ? null
          : UserEntity.fromJson(json['assignedTo'] as Map<String, dynamic>),
      involvedPeople: (json['involvedPeople'] as List<dynamic>?)
              ?.map((e) => SuspectEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$EventEntityImplToJson(_$EventEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'expiresAt': instance.expiresAt.toIso8601String(),
      'location': instance.location,
      'eventType': _$EventTypeEnumMap[instance.eventType]!,
      'videoUrl': instance.videoUrl,
      'completedAt': instance.completedAt?.toIso8601String(),
      'assignedTo': instance.assignedTo,
      'involvedPeople': instance.involvedPeople,
      'description': instance.description,
    };

const _$EventTypeEnumMap = {
  EventType.conflict: 'conflict',
  EventType.smoking: 'smoking',
  EventType.cheating: 'cheating',
};
