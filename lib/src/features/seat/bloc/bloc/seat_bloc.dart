import 'dart:async';

import 'package:booking/src/features/history/domain/enum/entities/get_history_entity.dart';
import 'package:booking/src/features/history/domain/enum/requests/get_history_request.dart';
import 'package:booking/src/features/history/domain/use_case/get_history_use_case.dart';
import 'package:booking/src/features/seat/domain/entities/create_reservation_entity.dart';
import 'package:booking/src/features/seat/domain/entities/get_all_seat_entity.dart';
import 'package:booking/src/features/seat/domain/entities/seat_item_entity.dart';
import 'package:booking/src/features/seat/domain/requests/cancel_reservation_request.dart';
import 'package:booking/src/features/seat/domain/requests/create_reservation_request.dart';
import 'package:booking/src/features/seat/domain/requests/get_all_seat_request.dart';
import 'package:booking/src/features/seat/domain/requests/get_seat_request.dart';
import 'package:booking/src/features/seat/domain/requests/repeat_last_request.dart';
import 'package:booking/src/features/seat/domain/usecases/cancel_reservation_use_case.dart';
import 'package:booking/src/features/seat/domain/usecases/create_reservation_use_case.dart';
import 'package:booking/src/features/seat/domain/usecases/get_all_seat_use_case.dart';
import 'package:booking/src/features/seat/domain/usecases/get_seat_use_case.dart';
import 'package:booking/src/features/seat/domain/usecases/repeat_last_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/base/base_bloc/bloc/base_bloc.dart';
import '../../../../core/base/base_usecase/result.dart';
import '../../../../core/exceptions/domain_exception.dart';

part 'seat_bloc.freezed.dart';
part 'seat_event.dart';
part 'seat_state.dart';

class SeatBloc extends BaseBloc<SeatEvent, SeatState> {
  SeatBloc(
    this.getAllSeatUseCase,
    this.getSeatUseCase,
    this.createReservationUseCase,
    this.getHistoryUseCase,
    this.repeatLastUseCase,
    this.cancelReservationUseCase,
  ) : super(const SeatState.loading());

  final GetAllSeatUseCase getAllSeatUseCase;
  final GetSeatUseCase getSeatUseCase;
  final CreateReservationUseCase createReservationUseCase;
  final GetHistoryUseCase getHistoryUseCase;
  final RepeatLastUseCase repeatLastUseCase;
  final CancelReservationUseCase cancelReservationUseCase;
  SeatViewModel _viewModel = const SeatViewModel();

  @override
  Future<void> onEventHandler(SeatEvent event, Emitter emit) async {
    await event.when(
      started: () => _started(event as _Started),
      getAll: (request) => _getAllSeat(
        event as _GetAllSeat,
        emit as Emitter<SeatState>,
      ),
      getSeat: (request) => _getSeat(
        event as _GetSeat,
        emit as Emitter<SeatState>,
      ),
      createReservation: (request) => _createReservation(
        event as _CreateReservation,
        emit as Emitter<SeatState>,
      ),
      getHistory: (request) => _getHistory(
        event as _GetHistory,
        emit as Emitter<SeatState>,
      ),
      repeatLast: (request) => _repeatLast(
        event as _RepeatLast,
        emit as Emitter<SeatState>,
      ),
      cancelReservation: (request) => _cancelReservation(
        event as _CancelReservation,
        emit as Emitter<SeatState>,
      ),
    );
  }

  Future<void> _started(_Started event) async {}

  Future<void> _getAllSeat(_GetAllSeat event, Emitter emit) async {
    emit(const SeatState.loading());
    final Result<GetAllSeatEntity, DomainException> result = await getAllSeatUseCase.call(event.request);

    if (result.isSuccessful && result.data != null) {
      _viewModel = _viewModel.copyWith(
        allSeat: result.data,
      );
      return emit(
        SeatState.loaded(
          viewModel: _viewModel.copyWith(
            allSeat: result.data,
          ),
        ),
      );
    }

    return emit(SeatState.error(result.failure?.message ?? 'Failed to get all seats'));
  }

  Future<void> _getSeat(_GetSeat event, Emitter emit) async {
    emit(const SeatState.loading());
    final Result<SeatItemEntity, DomainException> result = await getSeatUseCase.call(event.request);

    if (result.isSuccessful && result.data != null) {
      _viewModel = _viewModel.copyWith(
        seat: result.data,
      );
      return emit(
        SeatState.loaded(
          viewModel: _viewModel.copyWith(
            seat: result.data,
          ),
        ),
      );
    }

    return emit(SeatState.error(result.failure?.message ?? 'Failed to get seat'));
  }

  Future<void> _createReservation(_CreateReservation event, Emitter emit) async {
    emit(const SeatState.loading());
    final Result<CreateReservationEntity, DomainException> result = await createReservationUseCase.call(event.request);

    if (result.isSuccessful && result.data != null) {
      _viewModel = _viewModel.copyWith(
        reservation: result.data,
      );
      return emit(
        SeatState.loaded(
          viewModel: _viewModel.copyWith(
            reservation: result.data,
          ),
        ),
      );
    }

    return emit(SeatState.error(result.failure?.message ?? 'Failed to create reservation'));
  }

  Future<void> _getHistory(_GetHistory event, Emitter emit) async {
    emit(const SeatState.loading());
    final Result<GetHistoryList, DomainException> result = await getHistoryUseCase.call(event.request);

    if (result.isSuccessful && result.data != null) {
      _viewModel = _viewModel.copyWith(
        history: result.data,
      );
      return emit(
        SeatState.loaded(
          viewModel: _viewModel.copyWith(
            history: result.data,
          ),
        ),
      );
    }

    return emit(SeatState.error(result.failure?.message ?? 'Failed to get history'));
  }

  Future<void> _repeatLast(_RepeatLast event, Emitter emit) async {
    emit(const SeatState.loading());
    final Result<GetHistoryEntity, DomainException> result = await repeatLastUseCase.call(event.request);

    if (result.isSuccessful && result.data != null) {
      _viewModel = _viewModel.copyWith(
        history: GetHistoryList(bookings: [result.data!]),
      );
      return emit(
        SeatState.loaded(
          viewModel: _viewModel.copyWith(
            history: GetHistoryList(bookings: [result.data!]),
          ),
        ),
      );
    }

    return emit(SeatState.error(result.failure?.message ?? 'Failed to repeat last reservation'));
  }

  Future<void> _cancelReservation(_CancelReservation event, Emitter emit) async {
    emit(const SeatState.loading());
    final Result<GetHistoryEntity, DomainException> result = await cancelReservationUseCase.call(event.request);

    if (result.isSuccessful && result.data != null) {
      _viewModel = _viewModel.copyWith(
        history: GetHistoryList(bookings: [result.data!]),
      );
      return emit(
        SeatState.loaded(
          viewModel: _viewModel.copyWith(
            history: GetHistoryList(bookings: [result.data!]),
          ),
        ),
      );
    }

    return emit(SeatState.error(result.failure?.message ?? 'Failed to cancel reservation'));
  }
}
