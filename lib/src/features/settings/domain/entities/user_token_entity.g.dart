// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_token_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserTokenEntityImpl _$$UserTokenEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$UserTokenEntityImpl(
      sub: json['sub'] as String,
      permissions: PermissionEntity.fromJson(
          json['permissions'] as Map<String, dynamic>),
      exp: (json['exp'] as num).toInt(),
    );

Map<String, dynamic> _$$UserTokenEntityImplToJson(
        _$UserTokenEntityImpl instance) =>
    <String, dynamic>{
      'sub': instance.sub,
      'permissions': instance.permissions,
      'exp': instance.exp,
    };
