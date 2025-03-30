import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:booking/src/core/components/events/domain/models/event_entity.dart';
import 'package:booking/src/core/components/filter/domain/models/events_filter.dart';
import 'package:booking/src/features/events/domain/models/enums/events_sort.dart';

part 'events_state.freezed.dart';

@freezed
class EventsState with _$EventsState {
  factory EventsState({
    required EventsFilter filter,
    @Default(EventsSort.urgent) EventsSort sort,
    List<EventEntity>? events,
    int? count,
  }) = _EventsState;
}
