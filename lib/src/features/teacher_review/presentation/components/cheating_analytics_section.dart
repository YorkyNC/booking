import 'dart:math' as math;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/components/events/domain/models/enums/event_type.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/features/teacher_review/presentation/bloc/teacher_review_bloc.dart';
import 'package:booking/src/features/teacher_review/presentation/bloc/teacher_review_state.dart';
import 'package:booking/src/features/teacher_review/presentation/components/cheating_analytics_section_shimmer.dart';

class CheatingAnalyticsSection extends StatefulWidget {
  const CheatingAnalyticsSection({Key? key}) : super(key: key);

  @override
  State<CheatingAnalyticsSection> createState() => _CheatingAnalyticsSectionState();
}

class _CheatingAnalyticsSectionState extends State<CheatingAnalyticsSection> with TickerProviderStateMixin {
  final Map<int, AnimationController> _controllers = {};
  static const _maxValue = 45;
  static const _initialVisibleCount = 5;
  int _visibleCount = _initialVisibleCount;

  @override
  void dispose() {
    for (final controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  AnimationController _getController(int index) {
    if (!_controllers.containsKey(index)) {
      _controllers[index] = AnimationController(vsync: this);
    }
    return _controllers[index]!;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeacherReviewBloc, TeacherReviewState>(
      builder: (context, state) {
        final events = state.events;

        if (events == null || events.isEmpty) {
          return Column(
            children: List.generate(
              _initialVisibleCount,
              (_) => const CheatingAnalyticsSectionShimmer(),
            ),
          );
        }

        final sortedByCheating = List.from(events)
          ..sort((a, b) {
            final int countA = a.eventCounts[EventType.cheating] ?? 0;
            final int countB = b.eventCounts[EventType.cheating] ?? 0;
            return countB.compareTo(countA);
          });
        final visibleEvents = sortedByCheating.take(_visibleCount).toList();
        final hasMoreItems = events.length > _initialVisibleCount;
        final isExpanded = _visibleCount > _initialVisibleCount;

        return Container(
          decoration: BoxDecoration(
            color: context.colors.white,
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(12),
            ),
          ),
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              ...List.generate(
                visibleEvents.length,
                (index) {
                  final event = visibleEvents[index];
                  final eventCount = event.eventCounts[EventType.cheating] ?? 0;
                  final controller = _getController(index);

                  if (!controller.isAnimating) {
                    controller.animateTo(
                      math.min(eventCount / _maxValue, 1.0),
                      duration: const Duration(seconds: 1),
                    );
                  }
                  return Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            '${event.grade ?? ""}${event.className.isNotEmpty ? event.className[0] : ""}',
                            style: context.typography.textmdRegular.copyWith(
                              color: context.colors.gray600,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '$eventCount',
                            style: context.typography.textxlBold.copyWith(
                              color: context.colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      AnimatedBuilder(
                        animation: controller,
                        builder: (context, child) {
                          return LinearProgressIndicator(
                            color: context.colors.warning500,
                            value: controller.value,
                            backgroundColor: context.colors.gray100,
                            minHeight: 6,
                            borderRadius: BorderRadius.circular(12),
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                    ],
                  );
                },
              ),
              if (hasMoreItems)
                OutlinedButton.icon(
                  label: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        isExpanded
                            ? '${context.loc.hide} ${_visibleCount - _initialVisibleCount}'
                            : '${context.loc.showMore} ${events.length - _initialVisibleCount}',
                        style: context.typography.textsmSemibold.copyWith(
                          color: context.colors.gray700,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        isExpanded ? context.icons.chevron_up : context.icons.chevron_down,
                        color: context.colors.black,
                        size: 24,
                      )
                    ],
                  ),
                  onPressed: () {
                    setState(
                      () {
                        if (isExpanded) {
                          _visibleCount = _initialVisibleCount;
                        } else {
                          _visibleCount = events.length;
                        }
                      },
                    );
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}
