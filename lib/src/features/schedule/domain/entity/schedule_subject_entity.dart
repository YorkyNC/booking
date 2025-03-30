import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:booking/src/features/class/domain/entity/class_entity.dart';

part 'schedule_subject_entity.freezed.dart';

@freezed
class ScheduleSubjectEntity with _$ScheduleSubjectEntity {
  const factory ScheduleSubjectEntity({
    required String id,
    required String subjectName,
    required ClassEntity classEntity,
    required DateTime startTime,
    required DateTime endTime,
    String? room,
    String? purpose,
    String? status,
  }) = _ScheduleSubjectEntity;
}
