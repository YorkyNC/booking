part of 'history_bloc.dart';

@freezed
class HistoryState with _$HistoryState {
  const factory HistoryState.loading() = _Loading;
  const factory HistoryState.loaded({
    required HistoryViewModel viewModel,
  }) = _Loaded;
  const factory HistoryState.error(String error) = _Error;
}

@freezed
class HistoryViewModel with _$HistoryViewModel {
  const factory HistoryViewModel({
    List<GetHistoryEntity>? history,
  }) = _HistoryViewModel;
}
