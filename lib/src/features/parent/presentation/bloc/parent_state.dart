import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../schedule/domain/entity/schedule_subject_entity.dart';

part 'parent_state.freezed.dart';

@freezed
class ParentState with _$ParentState {
  factory ParentState({
    List<ScheduleSubjectEntity>? schedule,
    @Default(false) bool isLoading,
  }) = _ParentState;
}
