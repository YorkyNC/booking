part of 'attachment_bloc.dart';

@freezed
class AttachmentState with _$AttachmentState {
  const factory AttachmentState.loading() = _Loading;
  const factory AttachmentState.loaded({
    required AttachmentViewModel viewModel,
  }) = _Loaded;
  const factory AttachmentState.error(String error) = _Error;
}

@freezed
class AttachmentViewModel with _$AttachmentViewModel {
  const factory AttachmentViewModel({
    AttachmentEntity? attachment,
  }) = _AttachmentViewModel;
}
