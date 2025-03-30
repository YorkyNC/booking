part of 'action_bloc.dart';

@freezed
class ActionEvent with _$ActionEvent {
  const factory ActionEvent.started() = _Started;
  const factory ActionEvent.refresh() = _Refresh;
}
