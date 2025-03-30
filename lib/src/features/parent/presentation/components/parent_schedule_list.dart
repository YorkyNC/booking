import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/features/schedule/domain/entity/schedule_subject_entity.dart';
import 'package:booking/src/features/schedule/presentation/components/schedule_subject_tile.dart';

class ParentScheduleList extends StatelessWidget {
  final List<ScheduleSubjectEntity>? schedule;

  const ParentScheduleList({
    super.key,
    required this.schedule,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: context.colors.white,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: schedule == null || schedule!.isEmpty
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.event_busy_outlined,
                          size: context.width * 0.12,
                          color: context.colors.gray400,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          context.loc.scheduleEmpty,
                          style: context.typography.textmdMedium.copyWith(
                            color: context.colors.gray600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                )
              : Column(
                  children: List.generate(
                    schedule!.length,
                    (index) {
                      final subject = schedule![index];
                      return ScheduleSubjectTile(
                        subjectName: subject.subjectName,
                        className: subject.classEntity.className,
                        startTime: subject.startTime,
                        endTime: subject.endTime,
                        room: subject.room ?? '',
                        onTap: () {},
                        showCurrentSubject: true,
                      );
                    },
                  ),
                ),
        ),
      ),
    );
  }
}
