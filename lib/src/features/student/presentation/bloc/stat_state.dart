part of 'stat_bloc.dart';

@freezed
class StatState with _$StatState {
  const factory StatState.loading() = _Loading;
  const factory StatState.loaded({
    required StatViewModel viewModel,
  }) = _Loaded;
  const factory StatState.error(String error) = _Error;
}

@freezed
class StatViewModel with _$StatViewModel {
  const factory StatViewModel({
    GetStatEntity? stat,
  }) = _StatViewModel;
}
