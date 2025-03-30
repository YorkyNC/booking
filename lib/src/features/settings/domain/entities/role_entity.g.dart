// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoleEntityImpl _$$RoleEntityImplFromJson(Map<String, dynamic> json) =>
    _$RoleEntityImpl(
      title: json['title'] as String,
      childId: json['childId'] as String?,
      courseId: json['courseId'] as String?,
    );

Map<String, dynamic> _$$RoleEntityImplToJson(_$RoleEntityImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'childId': instance.childId,
      'courseId': instance.courseId,
    };
