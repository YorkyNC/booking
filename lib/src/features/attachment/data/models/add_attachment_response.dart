import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/base/base_models/base_entity.dart';

part 'add_attachment_response.freezed.dart';
part 'add_attachment_response.g.dart';

@freezed
class AddAttachmentResponse extends BaseEntity with _$AddAttachmentResponse {
  const factory AddAttachmentResponse({
    required String id,
  }) = _AddAttachmentResponse;

  factory AddAttachmentResponse.fromJson(Map<String, dynamic> json) =>
      _$AddAttachmentResponseFromJson(json);
}
