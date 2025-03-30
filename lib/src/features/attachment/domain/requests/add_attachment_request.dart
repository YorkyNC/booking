import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/base/base_models/base_request.dart';

part 'add_attachment_request.freezed.dart';
//part 'add_attachment_request.g.dart';

@freezed
class AddAttachmentRequest extends BaseRequest with _$AddAttachmentRequest {
  const factory AddAttachmentRequest({
    required XFile attachment,
  }) = _AddAttachmentRequest;

  //factory AddAttachmentRequest.fromJson(Map<String, dynamic> json) =>
  //  _$AddAttachmentRequestFromJson(json);
}
