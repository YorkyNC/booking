import 'package:freezed_annotation/freezed_annotation.dart';

part 'cancel_reservation_request.freezed.dart';
part 'cancel_reservation_request.g.dart';

@freezed
class CancelReservationRequest with _$CancelReservationRequest {
  const factory CancelReservationRequest({
    required int id,
  }) = _CancelReservationRequest;

  factory CancelReservationRequest.fromJson(Map<String, dynamic> json) => _$CancelReservationRequestFromJson(json);
}
