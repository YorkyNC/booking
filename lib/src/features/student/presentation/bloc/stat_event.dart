part of 'stat_bloc.dart';

@freezed
class StatEvent with _$StatEvent {
  const factory StatEvent.started() = _Started;

  const factory StatEvent.getStat(GetStatRequest request) = _GetStat;
}
