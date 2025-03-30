import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:booking/src/core/components/filter/domain/models/date_filter.dart';
import 'package:booking/src/core/components/filter/domain/models/events_filter.dart';
import 'package:booking/src/features/events/domain/requests/get_all_events_request.dart';
import 'package:booking/src/features/events/domain/requests/get_events_count_request.dart';
import 'package:booking/src/features/events/domain/use_cases/get_all_events_use_case.dart';
import 'package:booking/src/features/events/domain/use_cases/get_events_count_use_case.dart';
import 'package:booking/src/features/events/presentation/bloc/events_event.dart';
import 'package:booking/src/features/events/presentation/bloc/events_state.dart';

@injectable
class EventsBloc extends Bloc<EventsEvent, EventsState> {
  EventsBloc(
    this._getAllEventsUseCase,
    this._getEventsCountUseCase,
  ) : super(
          EventsState(
            filter: EventsFilter(
              date: DateFilter.day(
                startDate: DateTime.now(),
              ),
            ),
          ),
        ) {
    _setupHandlers();
    add(EventsFetched());
  }

  final GetAllEventsUseCase _getAllEventsUseCase;
  final GetEventsCountUseCase _getEventsCountUseCase;

  void _setupHandlers() {
    on<EventsFetched>(_fetchData);
    on<EventsPreliminaryCountFetched>(_fetchCount);
    on<EventsFilterUpdated>(_filterUpdated);
    on<EventsSortUpdated>(_sortUpdated);
  }

  Future<void> _fetchData(
    EventsFetched event,
    Emitter<EventsState> emit,
  ) async {
    emit(
      state.copyWith(
        events: null,
      ),
    );
    final result = await _getAllEventsUseCase(const GetAllEventsRequest());
    result.fold(
      (_) {}, //TODO: no error handling in design
      (events) {
        emit(
          state.copyWith(
            events: events,
            count: events.length,
          ),
        );
      },
    );
  }

  Future<void> _fetchCount(
    EventsPreliminaryCountFetched event,
    Emitter<EventsState> emit,
  ) async {
    emit(
      state.copyWith(
        count: null,
      ),
    );
    final result = await _getEventsCountUseCase(const GetEventsCountRequest());
    result.fold(
      (_) {}, //TODO: no error handling in design
      (count) {
        emit(
          state.copyWith(
            count: count,
          ),
        );
      },
    );
  }

  Future<void> _filterUpdated(
    EventsFilterUpdated event,
    Emitter<EventsState> emit,
  ) async {
    emit(state.copyWith(filter: event.eventsFilter));
    add(EventsFetched());
  }

  Future<void> _sortUpdated(
    EventsSortUpdated event,
    Emitter<EventsState> emit,
  ) async {
    emit(state.copyWith(sort: event.sort));
    add(EventsFetched());
  }
}
