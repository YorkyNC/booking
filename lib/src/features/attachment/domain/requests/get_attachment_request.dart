import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/base/base_models/base_request.dart';

part 'get_attachment_request.freezed.dart';
part 'get_attachment_request.g.dart';

@freezed
class GetAttachmentRequest extends BaseRequest with _$GetAttachmentRequest {
  const factory GetAttachmentRequest({
    required String attachmentId,
  }) = _GetAttachmentRequest;

  factory GetAttachmentRequest.fromJson(Map<String, dynamic> json) =>
      _$GetAttachmentRequestFromJson(json);
}
