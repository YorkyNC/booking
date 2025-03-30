import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/extensions/date_time_extension.dart';
import 'package:booking/src/features/schedule/presentation/bloc/schedule_bloc.dart';
import 'package:booking/src/features/schedule/presentation/bloc/schedule_event.dart';
import 'package:booking/src/features/schedule/presentation/bloc/schedule_state.dart';
import 'package:booking/src/features/schedule/presentation/components/schedule_deleted_subject_tile.dart';
import 'package:booking/src/features/schedule/presentation/components/schedule_editing_app_bar.dart';
import 'package:booking/src/features/schedule/presentation/components/schedule_editing_tile.dart';
import 'package:booking/src/features/schedule/presentation/components/shimmers/schedule_editing_tile_shimmer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScheduleEditingView extends StatelessWidget {
  const ScheduleEditingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScheduleBloc(),
      child: Scaffold(
        backgroundColor: context.colors.gray100,
        appBar: const ScheduleEditingAppBar(),
        body: BlocBuilder<ScheduleBloc, ScheduleState>(
          builder: (context, state) {
            final schedule = state.schedules;
            final hasChanges = state.hasChanges;
            final deletedSubjects = state.deletedSubjects;

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      style: ButtonStyle(
                        side: WidgetStateProperty.all(
                          BorderSide(
                            color: context.colors.buttonColor,
                            width: 1.5,
                          ),
                        ),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (schedule != null && schedule.isNotEmpty) {
                          context.read<ScheduleBloc>().add(
                                const ScheduleEventCancelAllClasses(),
                              );
                        }
                      },
                      child: Text(
                        context.loc.cancelAllClasses,
                        style: context.typography.textsmSemibold.copyWith(
                          color: context.colors.buttonColor,
                        ),
                      ),
                    ),
                  ),
                ),
                if (schedule == null) ...[
                  Container(
                    decoration: BoxDecoration(
                      color: context.colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        5,
                        (index) => const Padding(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          child: ScheduleEditingTileShimmer(),
                        ),
                      ),
                    ),
                  ),
                ] else ...[
                  Expanded(
                    child: Stack(
                      children: [
                        ListView(
                          physics: const ClampingScrollPhysics(),
                          padding: EdgeInsets.only(bottom: hasChanges ? 60 : 0),
                          children: [
                            if (schedule.isNotEmpty) ...[
                              Container(
                                decoration: BoxDecoration(
                                  color: context.colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                margin: const EdgeInsets.only(bottom: 16),
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    for (final day in schedule)
                                      for (final subject in day.subjects)
                                        ScheduleEditingTile(
                                          subjectName: subject.subjectName,
                                          className: subject.classEntity.className,
                                          startTime: subject.startTime.formatTime,
                                          endTime: subject.endTime.formatTime,
                                          room: subject.room ?? '',
                                          subjectId: subject.id,
                                        ),
                                  ],
                                ),
                              ),
                            ] else if (deletedSubjects.isNotEmpty) ...[
                              Container(
                                decoration: BoxDecoration(
                                  color: context.colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                margin: const EdgeInsets.only(bottom: 16),
                                padding: const EdgeInsets.all(16),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.calendar_today_outlined,
                                        size: 48,
                                        color: context.colors.gray400,
                                      ),
                                      const SizedBox(height: 16),
                                      Text(
                                        context.loc.noActiveActivities,
                                        style: context.typography.textmdMedium.copyWith(
                                          color: context.colors.gray700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                            if (deletedSubjects.isNotEmpty) ...[
                              Container(
                                decoration: BoxDecoration(
                                  color: context.colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                margin: const EdgeInsets.only(bottom: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            '${context.loc.cancelledClasses} (${deletedSubjects.length})',
                                            style: context.typography.textmdMedium.copyWith(
                                              color: context.colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    for (final subject in deletedSubjects)
                                      ScheduleDeletedSubjectTile(
                                        subjectName: subject.subjectName,
                                        className: subject.classEntity.className,
                                        startTime: subject.startTime.formatTime,
                                        endTime: subject.endTime.formatTime,
                                        room: subject.room ?? '',
                                        subjectId: subject.id,
                                      ),
                                    const SizedBox(height: 8),
                                  ],
                                ),
                              ),
                            ],
                            if (schedule.isEmpty && deletedSubjects.isEmpty) ...[
                              Container(
                                decoration: BoxDecoration(
                                  color: context.colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.all(16),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.calendar_today_outlined,
                                        size: 48,
                                        color: context.colors.gray400,
                                      ),
                                      const SizedBox(height: 16),
                                      Text(
                                        context.loc.thereAreNoScheduledClasses,
                                        style: context.typography.textmdMedium.copyWith(
                                          color: context.colors.gray700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                        if (hasChanges)
                          Positioned(
                            bottom: 16,
                            right: 0,
                            left: 0,
                            child: Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  context.read<ScheduleBloc>().add(
                                        const ScheduleEventResetChanges(),
                                      );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: context.colors.white,
                                  foregroundColor: context.colors.gray700,
                                  elevation: 2,
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: BorderSide(color: context.colors.gray300),
                                  ),
                                ),
                                child: Text(
                                  context.loc.resetAllChanges,
                                  style: context.typography.textsmSemibold,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}
