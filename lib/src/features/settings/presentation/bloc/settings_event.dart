part of 'settings_bloc.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.retrieve() = _RetrieveSettingsEvent;
  const factory SettingsEvent.update({
    required String languageCode,
  }) = _UpdateSettingsEvent;
}
