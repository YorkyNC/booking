// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suspect_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SuspectEntityImpl _$$SuspectEntityImplFromJson(Map<String, dynamic> json) =>
    _$SuspectEntityImpl(
      id: json['id'] as String,
      user: json['user'] == null
          ? null
          : UserEntity.fromJson(json['user'] as Map<String, dynamic>),
      imageUrl: json['imageUrl'] as String,
      description: json['description'] as String?,
      highlights: (json['highlights'] as List<dynamic>?)
              ?.map((e) =>
                  SummaryHighlightEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$SuspectEntityImplToJson(_$SuspectEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'imageUrl': instance.imageUrl,
      'description': instance.description,
      'highlights': instance.highlights,
    };
