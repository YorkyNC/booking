// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserEntityImpl _$$UserEntityImplFromJson(Map<String, dynamic> json) =>
    _$UserEntityImpl(
      id: (json['id'] as num?)?.toInt(),
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      role: $enumDecodeNullable(_$RoleEnumMap, json['role']),
      deleted: json['deleted'] as bool?,
    );

Map<String, dynamic> _$$UserEntityImplToJson(_$UserEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'role': _$RoleEnumMap[instance.role],
      'deleted': instance.deleted,
    };

const _$RoleEnumMap = {
  Role.student: 'STUDENT',
  Role.librarian: 'LIBRARIAN',
  Role.admin: 'ADMIN',
};
