import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/extensions/date_time_extension.dart';
import 'package:booking/src/features/schedule/domain/entity/schedule_day_entity.dart';
import 'package:booking/src/features/schedule/presentation/components/schedule_subject_tile.dart';

class DaySubjectsTile extends StatelessWidget {
  const DaySubjectsTile({
    super.key,
    required this.schedule,
  });

  final List<ScheduleDayEntity>? schedule;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (final day in schedule!)
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                decoration: BoxDecoration(
                  color: context.colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            day.date.formatDateWithWeekday,
                            style: context.typography.textmdSemibold.copyWith(
                              color: context.colors.purple500,
                              //TODO if its today change color to black
                            ),
                          ),
                        ),
                        Icon(
                          context.icons.chevron_right,
                          color: context.colors.gray700,
                          size: 24,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    for (final subject in day.subjects)
                      ScheduleSubjectTile(
                        onTap: () {},
                        subjectName: subject.subjectName,
                        className: subject.classEntity.className,
                        startTime: subject.startTime,
                        endTime: subject.endTime,
                        room: subject.room != null ? '${subject.room}' : '',
                      ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
