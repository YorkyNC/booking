import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/components/filter/domain/models/date_filter.dart';
import 'package:booking/src/core/components/filter/presentation/popups/date_filter_popup.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/extensions/date_time_extension.dart';
import 'package:booking/src/core/router/router.dart';
import 'package:booking/src/features/schedule/presentation/bloc/schedule_bloc.dart';
import 'package:booking/src/features/schedule/presentation/bloc/schedule_state.dart';
import 'package:booking/src/features/schedule/presentation/components/day_subjects_tile.dart';
import 'package:booking/src/features/schedule/presentation/components/shimmers/schedule_tile_shimmer.dart';

import 'bloc/teacher_review_bloc.dart';
import 'bloc/teacher_review_event.dart';
import 'bloc/teacher_review_state.dart';
import 'components/cheating_analytics_section.dart';
import 'components/teacher_app_bar.dart';
import 'components/teacher_main_indicators.dart';

class TeacherReviewPage extends StatefulWidget {
  const TeacherReviewPage({super.key});

  @override
  State<TeacherReviewPage> createState() => _TeacherReviewPageState();
}

class _TeacherReviewPageState extends State<TeacherReviewPage> {
  String _getAnalyticsFilterText(BuildContext context, DateFilter dateFilter) {
    return dateFilter.map(
      day: (_) => context.loc.forDay,
      week: (_) => context.loc.forWeek,
      month: (_) => context.loc.forMonth,
      custom: (_) => context.loc.forPeriod,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TeacherReviewBloc(),
        ),
        BlocProvider(
          create: (context) => ScheduleBloc(),
        ),
      ],
      child: Scaffold(
        backgroundColor: context.colors.gray100,
        appBar: const TeacherAppBar(),
        body: BlocBuilder<TeacherReviewBloc, TeacherReviewState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TeacherMainIndicators(
                            assetPath: context.assetImages.cheatingBlue,
                            title: context.loc.detection,
                            onTap: () {
                              context.push(RoutePaths.cheatingDetection);
                            },
                          ),
                          const SizedBox(width: 8),
                          TeacherMainIndicators(
                            assetPath: context.assetImages.studentsGroup,
                            title: context.loc.students,
                            onTap: () {
                              context.push(
                                RoutePaths.classesList,
                              );
                            },
                          ),
                          const SizedBox(width: 8),
                          TeacherMainIndicators(
                            assetPath: context.assetImages.calendar,
                            title: context.loc.schedule,
                            onTap: () {
                              context.push(RoutePaths.teacherSchedule);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverAppBar(
                  surfaceTintColor: Colors.transparent,
                  expandedHeight: 57,
                  pinned: true,
                  backgroundColor: context.colors.gray100,
                  centerTitle: false,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      decoration: BoxDecoration(
                        color: context.colors.white,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  titleTextStyle: context.typography.textmdSemibold.copyWith(
                    color: context.colors.black,
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.loc.cheatingAnalytics,
                      ),
                      Text(
                        DateTimeExtension.formatDatePeriodFull(
                          state.analyticsDateFilter.startDate,
                          state.analyticsDateFilter.endDate,
                        ),
                        style: context.typography.textsmRegular.copyWith(
                          color: context.colors.gray600,
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    OutlinedButton.icon(
                      iconAlignment: IconAlignment.end,
                      icon: Icon(context.icons.chevron_down),
                      label: Text(
                        _getAnalyticsFilterText(
                          context,
                          state.analyticsDateFilter,
                        ),
                      ),
                      onPressed: () {
                        showDateFilterPopup(
                          context,
                          title: context.loc.analytics,
                          dateFilter: state.analyticsDateFilter,
                          onSelected: (dateFilter) => context.read<TeacherReviewBloc>().add(
                                TeacherReviewFilterChanged(
                                  dateFilter,
                                ),
                              ),
                        );
                      },
                    ),
                    const SizedBox(width: 12),
                  ],
                ),
                const SliverToBoxAdapter(
                  child: CheatingAnalyticsSection(),
                ),
                BlocBuilder<ScheduleBloc, ScheduleState>(
                  builder: (context, state) {
                    final schedule = state.schedules;
                    if (schedule == null) {
                      return const SliverToBoxAdapter(
                        child: ScheduleTileShimmer(),
                      );
                    }
                    if (schedule.isEmpty) {
                      return SliverToBoxAdapter(
                        child: Center(
                          child: Text(
                            'No schedule available',
                            style: context.typography.textmdSemibold.copyWith(
                              color: context.colors.gray700,
                            ),
                          ),
                        ),
                      );
                    }

                    return SliverToBoxAdapter(
                      child: DaySubjectsTile(schedule: schedule),
                    );
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
