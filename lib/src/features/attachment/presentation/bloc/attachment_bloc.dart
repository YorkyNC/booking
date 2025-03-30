import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:booking/src/features/attachment/data/models/add_attachment_response.dart';

import '../../../../core/base/base_bloc/bloc/base_bloc.dart';
import '../../../../core/base/base_usecase/result.dart';
import '../../../../core/exceptions/domain_exception.dart';
import '../../domain/entities/attachment_entity.dart';
import '../../domain/requests/add_attachment_request.dart';
import '../../domain/requests/get_attachment_request.dart';
import '../../domain/usecases/add_attachment_use_case.dart';
import '../../domain/usecases/get_attachment_use_case.dart';

part 'attachment_bloc.freezed.dart';
part 'attachment_event.dart';
part 'attachment_state.dart';

class AttachmentBloc extends BaseBloc<AttachmentEvent, AttachmentState> {
  AttachmentBloc(
    this.addAttachmentUseCase,
    this.getAttachmentUseCase,
  ) : super(const AttachmentState.loading());

  final AddAttachmentUseCase addAttachmentUseCase;

  final GetAttachmentUseCase getAttachmentUseCase;

  AttachmentViewModel _viewModel = const AttachmentViewModel();

  @override
  Future<void> onEventHandler(AttachmentEvent event, Emitter emit) async {
    await event.when(
      started: () => _started(event as _Started),
      addAttachment: (attachment) => _addAttachment(
        event as _AddAttachment,
        emit as Emitter<AttachmentState>,
      ),
      getAttachment: (request) => _getAttachment(
        event as _GetAttachment,
        emit as Emitter<AttachmentState>,
      ),
    );
  }

  Future<void> _started(_Started event) async {}

  Future<void> _addAttachment(_AddAttachment event, Emitter emit) async {
    final Result<AddAttachmentResponse, DomainException> result = await addAttachmentUseCase.call(event.request);

    emit(const AttachmentState.loading());

    if (result.isSuccessful) {
      _viewModel = _viewModel.copyWith(
        attachment: AttachmentEntity(
          id: result.data!.id,
        ),
      );
    }

    return emit(AttachmentState.loaded(viewModel: _viewModel));
  }

  Future<void> _getAttachment(_GetAttachment event, Emitter emit) async {
    emit(const _Loading());
    final Result<AttachmentEntity, DomainException> result = await getAttachmentUseCase.call(event.request);

    final data = result.data;

    if (data != null) {
      _viewModel = _viewModel.copyWith(attachment: data);
      return emit(
        _Loaded(
          viewModel: _viewModel.copyWith(
            attachment: data,
          ),
        ),
      );
    }

    return emit(_Error(result.failure!.message));
  }
}
