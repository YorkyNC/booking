part of 'attachment_bloc.dart';

@freezed
class AttachmentEvent with _$AttachmentEvent {
  const factory AttachmentEvent.started() = _Started;

  const factory AttachmentEvent.addAttachment(AddAttachmentRequest request) =
      _AddAttachment;

  const factory AttachmentEvent.getAttachment(GetAttachmentRequest request) =
      _GetAttachment;
}
