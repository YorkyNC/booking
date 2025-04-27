import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_history_request.freezed.dart';
part 'get_history_request.g.dart';

/// Request model for fetching all seats
/// This is an empty request as the endpoint doesn't require any parameters
@freezed
class GetHistoryRequest with _$GetHistoryRequest {
  const factory GetHistoryRequest({
    required int userId,
    int? seatId,
  }) = _GetHistoryRequest;

  factory GetHistoryRequest.fromJson(Map<String, dynamic> json) => _$GetHistoryRequestFromJson(json);
}
