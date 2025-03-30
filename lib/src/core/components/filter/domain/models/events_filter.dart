import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:booking/src/core/components/events/domain/models/enums/event_type.dart';
import 'package:booking/src/core/components/filter/domain/models/date_filter.dart';

part 'events_filter.freezed.dart';

@freezed
class EventsFilter with _$EventsFilter {
  factory EventsFilter({
    required DateFilter date,
    @Default({}) Set<EventType> eventTypes,
  }) = _EventsFilter;
}
