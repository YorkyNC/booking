// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClassEntityImpl _$$ClassEntityImplFromJson(Map<String, dynamic> json) =>
    _$ClassEntityImpl(
      className: json['className'] as String,
      grade: (json['grade'] as num?)?.toInt(),
      studentsCount: (json['studentsCount'] as num?)?.toInt(),
      eventCounts: (json['eventCounts'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
                $enumDecode(_$EventTypeEnumMap, k), (e as num).toInt()),
          ) ??
          const {},
      notificationCount: (json['notificationCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ClassEntityImplToJson(_$ClassEntityImpl instance) =>
    <String, dynamic>{
      'className': instance.className,
      'grade': instance.grade,
      'studentsCount': instance.studentsCount,
      'eventCounts': instance.eventCounts
          .map((k, e) => MapEntry(_$EventTypeEnumMap[k]!, e)),
      'notificationCount': instance.notificationCount,
    };

const _$EventTypeEnumMap = {
  EventType.conflict: 'conflict',
  EventType.smoking: 'smoking',
  EventType.cheating: 'cheating',
};
