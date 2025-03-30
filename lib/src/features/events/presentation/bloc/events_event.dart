import 'package:booking/src/core/components/filter/domain/models/events_filter.dart';
import 'package:booking/src/features/events/domain/models/enums/events_sort.dart';

sealed class EventsEvent {
  const EventsEvent();
}

class EventsFetched extends EventsEvent {}

class EventsPreliminaryCountFetched extends EventsEvent {
  final EventsFilter eventsFilter;

  const EventsPreliminaryCountFetched(this.eventsFilter);
}

class EventsFilterUpdated extends EventsEvent {
  final EventsFilter eventsFilter;

  const EventsFilterUpdated(this.eventsFilter);
}

class EventsSortUpdated extends EventsEvent {
  final EventsSort sort;

  const EventsSortUpdated(this.sort);
}
