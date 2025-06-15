import 'dart:async';

import 'package:booking/src/features/history/domain/enum/entities/get_history_entity.dart';
import 'package:booking/src/features/history/domain/enum/requests/get_history_request.dart';
import 'package:booking/src/features/history/domain/use_case/get_history_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/base/base_bloc/bloc/base_bloc.dart';
import '../../../../core/base/base_usecase/result.dart';
import '../../../../core/exceptions/domain_exception.dart';

part 'history_bloc.freezed.dart';
part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends BaseBloc<HistoryEvent, HistoryState> {
  HistoryBloc(
    this.getHistoryUseCase,
  ) : super(const HistoryState.loading());

  final GetHistoryUseCase getHistoryUseCase;
  HistoryViewModel _viewModel = const HistoryViewModel();

  @override
  Future<void> onEventHandler(HistoryEvent event, Emitter emit) async {
    await event.when(
      started: () => _started(event as _Started),
      getHistory: (request) => _getHistory(
        event as _GetHistory,
        emit as Emitter<HistoryState>,
      ),
    );
  }

  Future<void> _started(_Started event) async {}

  Future<void> _getHistory(_GetHistory event, Emitter emit) async {
    emit(const HistoryState.loading());
    final Result<GetHistoryList, DomainException> result = await getHistoryUseCase.call(event.request);

    if (result.isSuccessful && result.data != null) {
      _viewModel = _viewModel.copyWith(
        history: result.data!.bookings,
      );
      return emit(
        HistoryState.loaded(
          viewModel: _viewModel.copyWith(
            history: result.data!.bookings,
          ),
        ),
      );
    }

    return emit(HistoryState.error(result.failure?.message ?? 'Failed to get history'));
  }
}
