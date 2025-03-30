// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SchoolEntityImpl _$$SchoolEntityImplFromJson(Map<String, dynamic> json) =>
    _$SchoolEntityImpl(
      id: json['id'] as String,
      jobType: json['jobType'] as String?,
      classes: (json['classes'] as List<dynamic>)
          .map((e) => ClassEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      teacherId: json['teacherId'] as String?,
    );

Map<String, dynamic> _$$SchoolEntityImplToJson(_$SchoolEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'jobType': instance.jobType,
      'classes': instance.classes,
      'teacherId': instance.teacherId,
    };
