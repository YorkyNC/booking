import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_events_count_request.freezed.dart';

@freezed
class GetEventsCountRequest with _$GetEventsCountRequest {
  const factory GetEventsCountRequest() = _GetEventsCountRequest;
}
