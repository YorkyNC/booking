// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttachmentEntityImpl _$$AttachmentEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$AttachmentEntityImpl(
      id: json['id'] as String?,
      attachmentId: json['attachmentId'] as String?,
      postId: json['postId'] as String?,
      type: json['type'] as String?,
      url: json['url'] as String?,
      fileName: json['fileName'] as String?,
      fileSizeInBytes: (json['fileSizeInBytes'] as num?)?.toInt(),
      contentType: json['contentType'] as String?,
    );

Map<String, dynamic> _$$AttachmentEntityImplToJson(
        _$AttachmentEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attachmentId': instance.attachmentId,
      'postId': instance.postId,
      'type': instance.type,
      'url': instance.url,
      'fileName': instance.fileName,
      'fileSizeInBytes': instance.fileSizeInBytes,
      'contentType': instance.contentType,
    };
