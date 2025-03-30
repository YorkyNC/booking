import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:booking/src/features/schedule/domain/entity/schedule_day_entity.dart';
import 'package:booking/src/features/schedule/domain/entity/schedule_subject_entity.dart';

part 'schedule_state.freezed.dart';

enum ScheduleViewType {
  calendar,
  timetable,
}

@freezed
class ScheduleState with _$ScheduleState {
  factory ScheduleState({
    List<ScheduleDayEntity>? schedules,
    @Default(false) bool hasChanges,
    @Default([]) List<ScheduleSubjectEntity> deletedSubjects,
    @Default(ScheduleViewType.calendar) ScheduleViewType viewType,
  }) = _ScheduleState;
}
