part of 'seat_bloc.dart';

@freezed
class SeatState with _$SeatState {
  const factory SeatState.loading() = _Loading;
  const factory SeatState.loaded({
    required SeatViewModel viewModel,
  }) = _Loaded;
  const factory SeatState.error(String error) = _Error;
}

@freezed
class SeatViewModel with _$SeatViewModel {
  const factory SeatViewModel({
    GetAllSeatEntity? allSeat,
    SeatItemEntity? seat,
    CreateReservationEntity? reservation,
  }) = _SeatViewModel;
}
