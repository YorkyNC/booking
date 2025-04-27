import 'dart:async';
import 'dart:developer' as developer;

import 'package:booking/src/features/student/domain/entities/get_stat_entity.dart';
import 'package:booking/src/features/student/domain/requests/get_stat_request.dart';
import 'package:booking/src/features/student/domain/usecases/get_stat_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/base/base_bloc/bloc/base_bloc.dart';
import '../../../../core/base/base_usecase/result.dart';
import '../../../../core/exceptions/domain_exception.dart';

part 'stat_bloc.freezed.dart';
part 'stat_event.dart';
part 'stat_state.dart';

class StatBloc extends BaseBloc<StatEvent, StatState> {
  StatBloc(
    this.getStatUseCase,
  ) : super(const StatState.loading());

  final GetStatUseCase getStatUseCase;

  final StatViewModel _viewModel = const StatViewModel();

  @override
  Future<void> onEventHandler(StatEvent event, Emitter emit) async {
    await event.when(
      started: () => _started(event as _Started),
      getStat: (request) => _getStat(
        event as _GetStat,
        emit as Emitter<StatState>,
      ),
    );
  }

  Future<void> _started(_Started event) async {
    developer.log('StatBloc started', name: 'StatBloc');
  }

  Future<void> _getStat(_GetStat event, Emitter emit) async {
    developer.log('Getting statistics for request: ${event.request}', name: 'StatBloc');
    emit(const StatState.loading());

    try {
      final Result<GetStatEntity, DomainException> result = await getStatUseCase.call(event.request);

      if (result.isSuccessful) {
        developer.log('Successfully got statistics: ${result.data}', name: 'StatBloc');
        emit(
          _Loaded(
            viewModel: _viewModel.copyWith(
              stat: result.data,
            ),
          ),
        );
      } else {
        final errorMessage = result.failure?.message ?? 'Unknown error occurred';
        developer.log('Error getting statistics: $errorMessage', name: 'StatBloc', error: result.failure);
        emit(StatState.error(errorMessage));
      }
    } catch (e) {
      developer.log('Unexpected error in StatBloc: $e', name: 'StatBloc', error: e);
      emit(StatState.error('Unexpected error: $e'));
    }
  }
}
