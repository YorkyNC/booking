// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PermissionEntityImpl _$$PermissionEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$PermissionEntityImpl(
      schools: (json['schools'] as List<dynamic>)
          .map((e) => SchoolEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PermissionEntityImplToJson(
        _$PermissionEntityImpl instance) =>
    <String, dynamic>{
      'schools': instance.schools,
    };
