part of 'seat_bloc.dart';

@freezed
class SeatEvent with _$SeatEvent {
  const factory SeatEvent.started() = _Started;

  const factory SeatEvent.getAll(GetAllSeatRequest request) = _GetAllSeat;

  const factory SeatEvent.getSeat(GetSeatRequest request) = _GetSeat;

  const factory SeatEvent.createReservation(CreateReservationRequest request) = _CreateReservation;

  const factory SeatEvent.getHistory(GetHistoryRequest request) = _GetHistory;
}
