import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/base/base_models/base_entity.dart';

part 'attachment_entity.freezed.dart';
part 'attachment_entity.g.dart';

@freezed
class AttachmentEntity extends BaseEntity with _$AttachmentEntity {
  const factory AttachmentEntity({
    String? id,
    String? attachmentId,
    String? postId,
    String? type,
    String? url,
    String? fileName,
    int? fileSizeInBytes,
    String? contentType,
  }) = _AttachmentEntity;

  factory AttachmentEntity.fromJson(Map<String, dynamic> json) => _$AttachmentEntityFromJson(json);
}
