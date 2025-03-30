import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/components/filter/domain/models/date_filter.dart';
import 'package:booking/src/core/components/filter/presentation/popups/date_filter_popup.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/extensions/date_time_extension.dart';
import 'package:booking/src/core/router/router.dart';
import 'package:booking/src/core/services/injectable/injectable_service.dart';
import 'package:booking/src/core/widgets/slivers/divided_sliver_child_builder_delegate.dart';
import 'package:booking/src/features/review/presentation/bloc/review_bloc.dart';
import 'package:booking/src/features/review/presentation/bloc/review_event.dart';
import 'package:booking/src/features/review/presentation/bloc/review_state.dart';
import 'package:booking/src/features/review/presentation/widgets/psychologist_app_bar.dart';
import 'package:booking/src/features/review/presentation/widgets/review_analytics_category_tile.dart';
import 'package:booking/src/features/review/presentation/widgets/review_analytics_indicator_view.dart';
import 'package:booking/src/core/components/events/presentation/widgets/event_shimmer_tile.dart';
import 'package:booking/src/core/components/events/presentation/widgets/event_tile.dart';

class PsychologistReviewPage extends StatelessWidget {
  const PsychologistReviewPage({
    super.key,
  });

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
    return BlocProvider(
      create: (_) => getIt<ReviewBloc>(),
      child: Scaffold(
        appBar: const PsychologistAppBar(),
        backgroundColor: context.colors.gray100,
        body: BlocBuilder<ReviewBloc, ReviewState>(
          builder: (context, state) {
            final conflicts = state.conflicts;
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Material(
                    color: context.colors.white,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        context.loc.analytics,
                                        style: context.typography.typography2Medium.copyWith(
                                          color: context.colors.black,
                                        ),
                                      ),
                                      Text(
                                        DateTimeExtension.formatDatePeriodFull(
                                          state.analyticsDateFilter.startDate,
                                          state.analyticsDateFilter.endDate,
                                        ),
                                        style: context.typography.typography1Regular.copyWith(
                                          color: context.colors.gray600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                OutlinedButton.icon(
                                  iconAlignment: IconAlignment.end,
                                  icon: Icon(context.icons.chevron_down),
                                  label: Text(
                                    _getAnalyticsFilterText(
                                      context,
                                      state.analyticsDateFilter,
                                    ),
                                  ),
                                  onPressed: () => showDateFilterPopup(
                                    context,
                                    title: context.loc.analytics,
                                    dateFilter: state.analyticsDateFilter,
                                    onSelected: (dateFilter) => context.read<ReviewBloc>().add(
                                          ReviewAnalyticsFilterChanged(
                                            dateFilter,
                                          ),
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 14),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              children: [
                                Expanded(
                                  child: ReviewAnalyticsIndicatorView(
                                    color: const Color(0xFFD92D20),
                                    assetPath: context.assetImages.conflict,
                                    title: context.loc.conflicts,
                                    value: state.analytics?.conflicts,
                                  ),
                                ),
                                Expanded(
                                  child: ReviewAnalyticsIndicatorView(
                                    color: const Color(0xFF53B1FD),
                                    assetPath: context.assetImages.smoking,
                                    title: context.loc.smoking,
                                    value: state.analytics?.smoking,
                                  ),
                                ),
                                Expanded(
                                  child: ReviewAnalyticsIndicatorView(
                                    color: const Color(0xFF37BE88),
                                    assetPath: context.assetImages.cheating,
                                    title: context.loc.cheating,
                                    value: state.analytics?.cheating,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          ReviewAnalyticsCategoryTile(
                            onTap: () => context.push(RoutePaths.cameraPage),
                            buttonText: context.loc.cameras,
                            title: context.loc.hotspots,
                            assetPath: context.assetImages.hotspot,
                            text: state.analytics?.hotspot,
                          ),
                          Divider(
                            height: 0,
                            color: context.colors.gray100,
                          ),
                          ReviewAnalyticsCategoryTile(
                            onTap: () {
                              context.push(RoutePaths.classEvents);
                            },
                            buttonText: context.loc.classes,
                            title: context.loc.troubleClass,
                            text: state.analytics?.troubleClass,
                            assetPath: context.assetImages.classroom,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SliverPadding(
                  padding: EdgeInsets.symmetric(
                    vertical: 6,
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
                  title: Text(
                    context.loc.forChecking,
                    style: context.typography.typography2Medium.copyWith(
                      color: context.colors.black,
                    ),
                  ),
                  actions: [
                    OutlinedButton.icon(
                      iconAlignment: IconAlignment.end,
                      icon: Icon(context.icons.chevron_right),
                      label: Text(
                        context.loc.allEvents,
                      ),
                      onPressed: () => context.push(RoutePaths.events),
                    ),
                    const SizedBox(width: 12),
                  ],
                ),
                if (conflicts == null)
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Material(
                          color: context.colors.white,
                          child: const ReviewEventShimmerTile(),
                        ),
                        Divider(
                          height: 0,
                          color: context.colors.gray100,
                        ),
                        Material(
                          color: context.colors.white,
                          borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(12),
                          ),
                          child: const ReviewEventShimmerTile(),
                        ),
                      ],
                    ),
                  )
                //else if (conflicts.length == 0) TODO
                else
                  SliverList(
                    delegate: DividedSliverChildBuilderDelegate(
                      childCount: conflicts.length,
                      builder: (_, index) {
                        return Material(
                          color: context.colors.white,
                          borderRadius: index == conflicts.length - 1
                              ? const BorderRadius.vertical(
                                  bottom: Radius.circular(12),
                                )
                              : null,
                          child: EventTile(
                            event: conflicts[index],
                          ),
                        );
                      },
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
