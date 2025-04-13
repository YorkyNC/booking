import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/base/base_models/base_entity.dart';

part 'get_attachment_response.freezed.dart';
part 'get_attachment_response.g.dart';

@freezed
class GetAttachmentResponse extends BaseEntity with _$GetAttachmentResponse {
  const factory GetAttachmentResponse({
    required String url,
  }) = _GetAttachmentResponse;

  factory GetAttachmentResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAttachmentResponseFromJson(json);
}
