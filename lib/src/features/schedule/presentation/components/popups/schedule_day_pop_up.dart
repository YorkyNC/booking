import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/router/router.dart';
import 'package:booking/src/features/schedule/presentation/bloc/schedule_bloc.dart';
import 'package:booking/src/features/schedule/presentation/bloc/schedule_state.dart';
import 'package:booking/src/features/schedule/presentation/components/schedule_subject_tile.dart';
import 'package:booking/src/features/schedule/presentation/components/shimmers/schedule_tile_shimmer.dart';

class ScheduleDayPopUp extends StatelessWidget {
  const ScheduleDayPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScheduleBloc(),
      child: BlocBuilder<ScheduleBloc, ScheduleState>(
        builder: (context, state) {
          final schedule = state.schedules;
          if (schedule == null) {
            return const ScheduleTileShimmer(
              isSecondVariant: true,
            );
          }
          if (schedule.isEmpty) {
            return Center(
              child: Text(
                'No schedule available',
                style: context.typography.textmdSemibold.copyWith(
                  color: context.colors.gray700,
                ),
              ),
            );
          }
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '6 уроков',
                          style: context.typography.textsmMedium.copyWith(
                            color: context.colors.black,
                          ),
                        ),
                      ),
                      Text(
                        '14:10-19:40',
                        style: context.typography.textsmMedium.copyWith(
                          color: context.colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: context.colors.brand400,
                      ),
                      onPressed: () {
                        context.pop();
                        context.push(RoutePaths.scheduleEdit);
                      },
                      child: Text(
                        'Редактировать',
                        style: context.typography.textsmSemibold.copyWith(
                          color: context.colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  for (final day in schedule)
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
          );
        },
      ),
    );
  }
}
