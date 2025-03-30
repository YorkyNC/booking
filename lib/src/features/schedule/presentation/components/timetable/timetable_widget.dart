import 'package:flutter/material.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';

import '../../../domain/entity/timetable_entry.dart';
import 'timetable_cell.dart';

// Custom LinkedScrollControllerGroup to synchronize multiple ScrollControllers
class LinkedScrollControllerGroup {
  LinkedScrollControllerGroup() {
    _offsetNotifier = ValueNotifier<double>(0.0);
  }

  late final ValueNotifier<double> _offsetNotifier;
  final List<_LinkedScrollController> _controllers = [];

  ScrollController createScrollController() {
    final controller = _LinkedScrollController(this);
    _controllers.add(controller);
    return controller;
  }

  void dispose() {
    _offsetNotifier.dispose();
    for (final controller in _controllers) {
      controller.dispose();
    }
  }

  double get offset => _offsetNotifier.value;
  set offset(double value) {
    _offsetNotifier.value = value;
    for (final controller in _controllers) {
      controller._jumpTo(value);
    }
  }
}

class _LinkedScrollController extends ScrollController {
  final LinkedScrollControllerGroup _group;
  bool _isDisposed = false;
  bool _isAttached = false;

  _LinkedScrollController(this._group);

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  @override
  void attach(ScrollPosition position) {
    super.attach(position);
    _isAttached = true;
    position.addListener(_onPositionChanged);
  }

  @override
  void detach(ScrollPosition position) {
    position.removeListener(_onPositionChanged);
    _isAttached = false;
    super.detach(position);
  }

  void _onPositionChanged() {
    if (offset != _group.offset) {
      _group.offset = offset;
    }
  }

  // Jump without creating a feedback loop
  void _jumpTo(double value) {
    if (_isAttached && value != offset && !_isDisposed) {
      jumpTo(value);
    }
  }
}

class TimetableWidget extends StatefulWidget {
  final List<TimetableEntry> entries;

  const TimetableWidget({Key? key, required this.entries}) : super(key: key);

  @override
  TimetableWidgetState createState() => TimetableWidgetState();
}

class TimetableWidgetState extends State<TimetableWidget> {
  final ScrollController _verticalScrollController = ScrollController();
  late final LinkedScrollControllerGroup _horizontalScrollControllerGroup;
  late final ScrollController _headerScrollController;
  late final ScrollController _bodyScrollController;

  @override
  void initState() {
    super.initState();
    _horizontalScrollControllerGroup = LinkedScrollControllerGroup();
    _headerScrollController = _horizontalScrollControllerGroup.createScrollController();
    _bodyScrollController = _horizontalScrollControllerGroup.createScrollController();
  }

  @override
  void dispose() {
    _verticalScrollController.dispose();
    _horizontalScrollControllerGroup.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get unique days
    final days = widget.entries.map((e) => e.day).toSet().toList();

    // Custom sort for days of the week (Пн, Вт, Ср, Чт, Пт, Сб, Вс)
    final dayOrder = {
      'Пн': 0, // Monday
      'Вт': 1, // Tuesday
      'Ср': 2, // Wednesday
      'Чт': 3, // Thursday
      'Пт': 4, // Friday
      'Сб': 5, // Saturday
      'Вс': 6, // Sunday
    };

    days.sort((a, b) => (dayOrder[a] ?? 99).compareTo(dayOrder[b] ?? 99));

    // Filter time slots to only include those that have entries
    final timeSlotMap = <String, Map<String, String>>{};

    for (final entry in widget.entries) {
      final key = '${entry.startTime}-${entry.endTime}';
      timeSlotMap[key] = {
        'startTime': entry.startTime,
        'endTime': entry.endTime,
      };
    }

    final usedTimeSlots = timeSlotMap.values.toList();

    // Sort time slots by start time
    usedTimeSlots.sort((a, b) => a['startTime']!.compareTo(b['startTime']!));

    // Calculate the number of lessons per day to determine height
    final lessonsPerDay = <String, int>{};
    for (final day in days) {
      lessonsPerDay[day] = widget.entries.where((e) => e.day == day).length;
    }

    // Calculate cell height (default is 80)
    const cellHeight = 80.0;

    // If no entries or days, show empty state
    if (days.isEmpty || usedTimeSlots.isEmpty) {
      return const Center(
        child: Text('Нет данных для отображения'),
      );
    }

    // Create a row of day headers
    final dayHeadersRow = Row(
      children: days
          .map((day) => Container(
                width: 120,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: context.colors.gray100,
                      width: 1,
                    ),
                  ),
                  color: Colors.transparent,
                ),
                child: Text(
                  day,
                  style: context.typography.textxsRegular.copyWith(
                    color: context.colors.gray500,
                  ),
                ),
              ))
          .toList(),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Fixed header row
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Empty corner cell
            Container(
              width: 80,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: context.colors.gray100,
                    width: 1,
                  ),
                ),
              ),
            ),
            // Day headers
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: _headerScrollController,
                physics: const ClampingScrollPhysics(),
                child: dayHeadersRow,
              ),
            ),
          ],
        ),
        // Scrollable content
        Expanded(
          child: SingleChildScrollView(
            controller: _verticalScrollController,
            physics: const ClampingScrollPhysics(),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Time column
                SizedBox(
                  width: 80,
                  child: Column(
                    children: usedTimeSlots
                        .map((timeSlot) => Container(
                              width: 80,
                              height: cellHeight,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                    color: context.colors.gray100,
                                    width: 1,
                                  ),
                                ),
                                color: Colors.transparent,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        timeSlot['startTime']!,
                                        style: context.typography.textsmMedium.copyWith(
                                          color: context.colors.black,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        timeSlot['endTime']!,
                                        style: context.typography.textsmRegular.copyWith(
                                          color: context.colors.gray500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 8),
                                  VerticalDivider(
                                    color: context.colors.gray500,
                                    width: 1,
                                  ),
                                ],
                              ),
                            ))
                        .toList(),
                  ),
                ),
                // Scrollable subject columns
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    controller: _bodyScrollController,
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: usedTimeSlots
                          .map((timeSlot) => Row(
                                children: days.map((day) {
                                  final entry = widget.entries.firstWhere(
                                    (e) => e.day == day && e.startTime == timeSlot['startTime'],
                                    orElse: () => TimetableEntry(
                                      subject: '',
                                      startTime: timeSlot['startTime']!,
                                      endTime: timeSlot['endTime']!,
                                      classroom: '',
                                      day: day,
                                      colorIndex: -1,
                                    ),
                                  );

                                  return TimetableCell(
                                    entry: entry,
                                    cellHeight: cellHeight,
                                  );
                                }).toList(),
                              ))
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
