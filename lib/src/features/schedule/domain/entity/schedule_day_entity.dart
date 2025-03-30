import 'package:booking/src/features/schedule/domain/entity/schedule_subject_entity.dart';

class ScheduleDayEntity {
  final DateTime date;
  final List<ScheduleSubjectEntity> subjects;

  const ScheduleDayEntity({
    required this.date,
    required this.subjects,
  });
}
