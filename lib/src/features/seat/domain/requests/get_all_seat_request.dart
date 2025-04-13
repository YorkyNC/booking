import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_seat_request.freezed.dart';
part 'get_all_seat_request.g.dart';

/// Request model for fetching all seats
/// This is an empty request as the endpoint doesn't require any parameters
@freezed
class GetAllSeatRequest with _$GetAllSeatRequest {
  const factory GetAllSeatRequest({
    required int floor,
  }) = _GetAllSeatRequest;

  factory GetAllSeatRequest.fromJson(Map<String, dynamic> json) => _$GetAllSeatRequestFromJson(json);
}
