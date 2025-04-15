import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_reservation_request.freezed.dart';
part 'create_reservation_request.g.dart';

@freezed
class CreateReservationRequest with _$CreateReservationRequest {
  const factory CreateReservationRequest({
    required int seatId,
    required String startTime,
    required String endTime,
    required String date,
  }) = _CreateReservationRequest;

  factory CreateReservationRequest.fromJson(Map<String, dynamic> json) => _$CreateReservationRequestFromJson(json);
}
