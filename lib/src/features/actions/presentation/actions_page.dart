import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/extensions/date_time_extension.dart';
import 'package:booking/src/core/services/injectable/injectable_service.dart';
import 'package:booking/src/core/widgets/shimmer/shimmer_container.dart';
import 'package:booking/src/core/widgets/slivers/divided_sliver_child_builder_delegate.dart';

import '../../../core/components/events/presentation/widgets/event_shimmer_tile.dart';
import 'bloc/bloc/action_bloc.dart';
import 'components/action_tile.dart';
import 'components/actions_app_bar.dart';

class ActionsPage extends StatefulWidget {
  const ActionsPage({
    super.key,
  });

  @override
  State<ActionsPage> createState() => _ActionsPageState();
}

class _ActionsPageState extends State<ActionsPage> {
  final Map<String, bool> _expandedGroups = {};
  final ScrollController _scrollController = ScrollController();
  final Map<String, GlobalKey> _groupKeys = {};
  DateTime? _selectedDate;
  String? _highlightedGroupKey;
  Timer? _highlightTimer;

  @override
  void dispose() {
    _scrollController.dispose();
    _highlightTimer?.cancel();
    super.dispose();
  }

  void _toggleGroup(String groupKey) {
    setState(() {
      _expandedGroups[groupKey] = !(_expandedGroups[groupKey] ?? true);
    });
  }

  bool _isGroupExpanded(String groupKey) {
    return _expandedGroups[groupKey] ?? true; // Default to expanded
  }

  // Get a global key for a group
  GlobalKey _getKeyForGroup(String groupKey) {
    if (!_groupKeys.containsKey(groupKey)) {
      _groupKeys[groupKey] = GlobalKey();
    }
    return _groupKeys[groupKey]!;
  }

  void _onDateSelected(DateTime date) {
    setState(() {
      _selectedDate = date;
    });

    // Find the group key for the selected date
    String groupKey;
    if (date.isToday) {
      groupKey = context.loc.today;
    } else if (date.isYesterday) {
      groupKey = context.loc.yesterday;
    } else {
      groupKey = date.formatDateWithMonthYearAndWeekday;
    }

    // Ensure the group is expanded
    setState(() {
      _expandedGroups[groupKey] = true;
      _highlightedGroupKey = groupKey;
    });

    // Set a timer to clear the highlight after 2 seconds
    _highlightTimer?.cancel();
    _highlightTimer = Timer(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _highlightedGroupKey = null;
        });
      }
    });

    // Schedule a scroll to the group after the build is complete
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToGroup(groupKey);
    });
  }

  void _scrollToGroup(String groupKey) {
    // Try to find the group key in our map
    final key = _groupKeys[groupKey];
    if (key?.currentContext != null) {
      // If we have a valid context, use Scrollable to scroll to it
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        alignment: 0.0, // Align to the top
      );
      return;
    }

    // Fallback to the approximate calculation if the key isn't available
    final state = context.read<ActionBloc>().state;
    final actions = state.actions;
    if (actions == null) return;

    // Group actions by date
    final Map<String, List<int>> groupedActionIndices = {};

    for (int i = 0; i < actions.length; i++) {
      final action = actions[i];
      final date = action.createdAt;

      String key;
      if (date.isToday) {
        key = context.loc.today;
      } else if (date.isYesterday) {
        key = context.loc.yesterday;
      } else {
        key = date.formatDateWithMonthYearAndWeekday;
      }

      groupedActionIndices.putIfAbsent(key, () => []);
      groupedActionIndices[key]!.add(i);
    }

    // Sort the keys
    final sortedKeys = groupedActionIndices.keys.toList()
      ..sort((a, b) {
        if (a == context.loc.today) return -1;
        if (b == context.loc.today) return 1;
        if (a == context.loc.yesterday) return -1;
        if (b == context.loc.yesterday) return 1;
        return b.compareTo(a); // Descending order for dates
      });

    final groupIndex = sortedKeys.indexOf(groupKey);
    if (groupIndex == -1) return;

    // Calculate approximate position to scroll to
    double position = 0;

    // Add height for the header container
    position += 50; // Approximate height of the header container

    // Add height for each group header before the target
    for (int i = 0; i < groupIndex; i++) {
      position += 50; // Approximate height of a group header

      // If the group is expanded, add height for its items
      if (_isGroupExpanded(sortedKeys[i])) {
        final itemCount = groupedActionIndices[sortedKeys[i]]!.length;
        position += itemCount * 70; // Approximate height of each item
      }
    }

    // Scroll to the calculated position
    _scrollController.animateTo(
      position,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ActionBloc>(),
      child: Scaffold(
        appBar: ActionsAppBar(
          onDateSelected: _onDateSelected,
        ),
        backgroundColor: context.colors.gray100,
        body: BlocBuilder<ActionBloc, ActionState>(
          builder: (context, state) {
            final actions = state.actions;
            if (actions == null) {
              return Container(
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  color: context.colors.white,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(12, 12, 12, 8),
                      child: ShimmerContainer(width: 95, height: 24),
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemCount: 10,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return const ReviewEventShimmerTile();
                        },
                        separatorBuilder: (context, _) {
                          return const Divider(
                            height: 0,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }

            // Group actions by date
            final Map<String, List<int>> groupedActionIndices = {};

            for (int i = 0; i < actions.length; i++) {
              final action = actions[i];
              final date = action.createdAt;

              String groupKey;
              if (date.isToday) {
                groupKey = context.loc.today;
              } else if (date.isYesterday) {
                groupKey = context.loc.yesterday;
              } else {
                groupKey = date.formatDateWithMonthYearAndWeekday;
              }

              groupedActionIndices.putIfAbsent(groupKey, () => []);
              groupedActionIndices[groupKey]!.add(i);
            }

            // Sort the keys to ensure Today, Yesterday, and then dates in descending order
            final sortedKeys = groupedActionIndices.keys.toList()
              ..sort((a, b) {
                if (a == context.loc.today) return -1;
                if (b == context.loc.today) return 1;
                if (a == context.loc.yesterday) return -1;
                if (b == context.loc.yesterday) return 1;
                return b.compareTo(a); // Descending order for dates
              });

            return CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.only(top: 8),
                    padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
                    decoration: BoxDecoration(
                      color: context.colors.white,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                    ),
                    child: Text(
                      context.loc.total(actions.length),
                      style: context.typography.typography2Regular.copyWith(
                        color: context.colors.gray500,
                      ),
                    ),
                  ),
                ),
                ...sortedKeys.expand((dateKey) {
                  final indices = groupedActionIndices[dateKey]!;
                  final isExpanded = _isGroupExpanded(dateKey);
                  final isHighlighted = _highlightedGroupKey == dateKey;
                  final groupKey = _getKeyForGroup(dateKey);

                  return [
                    // Date header with collapsible button
                    SliverToBoxAdapter(
                      key: groupKey,
                      child: Material(
                        color: isHighlighted ? context.colors.blueGray50 : context.colors.white,
                        child: InkWell(
                          onTap: () => _toggleGroup(dateKey),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                            child: Row(
                              children: [
                                Text(
                                  dateKey,
                                  style: context.typography.typography2SemiBold.copyWith(
                                    color: context.colors.gray700,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '(${indices.length})',
                                  style: context.typography.typography2Regular.copyWith(
                                    color: context.colors.gray500,
                                  ),
                                ),
                                const Spacer(),
                                Icon(
                                  isExpanded ? context.icons.chevron_up : context.icons.chevron_down,
                                  color: context.colors.gray500,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Actions for this date (only shown if expanded)
                    if (isExpanded)
                      SliverList(
                        delegate: DividedSliverChildBuilderDelegate(
                          builder: (context, index) {
                            final actionIndex = indices[index];
                            final isLastInGroup = index == indices.length - 1;
                            final isLastGroup = dateKey == sortedKeys.last;
                            final action = actions[actionIndex];

                            // Check if this action's date matches the selected date
                            final isSelectedDate = _selectedDate != null && isSameDay(action.createdAt, _selectedDate!);

                            return Material(
                              color: isSelectedDate && isHighlighted ? context.colors.blueGray50 : context.colors.white,
                              borderRadius: isLastInGroup && isLastGroup
                                  ? const BorderRadius.vertical(
                                      bottom: Radius.circular(12),
                                    )
                                  : null,
                              child: ActionTile(
                                onTap: () {},
                                action: action,
                              ),
                            );
                          },
                          childCount: indices.length,
                        ),
                      ),
                    // Add spacing between date groups if not the last group
                    if (dateKey != sortedKeys.last) const SliverToBoxAdapter(child: Divider(height: 1)),
                  ];
                }).toList(),
              ],
            );
          },
        ),
      ),
    );
  }

  // Helper method to check if two dates are the same day
  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
  }
}
