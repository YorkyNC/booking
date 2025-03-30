part of 'settings_bloc.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.empty() = _EmptySettingsState;
  const factory SettingsState.inProgress() = _InProgressSettingsState;
  const factory SettingsState.done(SettingsViewModel viewModel) =
      _DoneSettingsState;
  const factory SettingsState.error({
    required String errorMessage,
  }) = _ErrorSettingsState;
}

@freezed
class SettingsViewModel with _$SettingsViewModel {
  const factory SettingsViewModel(
    String languageCode,
  ) = _SettingsViewModel;
}
