import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';

class CustomCalendar extends StatefulWidget {
  final DateTime firstDay;
  final DateTime lastDay;
  final DateTime? initialSelectedDate;
  final List<DateTime>? initialSelectedDates;
  final Function(DateTime)? onDateSelected;
  final Function(List<DateTime>)? onMultiDateSelected;
  final Function(DateTime)? onTapDate;
  final Map<DateTime, bool>? disabledDates;
  final bool selectable;
  final bool multiSelect;

  const CustomCalendar({
    Key? key,
    required this.firstDay,
    required this.lastDay,
    this.initialSelectedDate,
    this.initialSelectedDates,
    this.onDateSelected,
    this.onMultiDateSelected,
    this.onTapDate,
    this.disabledDates,
    this.selectable = false,
    this.multiSelect = false,
  }) : super(key: key);

  @override
  CustomCalendarState createState() => CustomCalendarState();
}

class CustomCalendarState extends State<CustomCalendar> {
  late DateTime? _selectedDate;
  late List<DateTime> _selectedDates;
  late List<DateTime> _visibleMonths;
  late ScrollController _scrollController;
  late DateTime _currentMonth;
  late int _currentMonthIndex;
  late DateTime _today;
  bool _showFloatingButton = true;

  @override
  void initState() {
    super.initState();

    // Initialize today's date
    _today = DateTime.now();

    // Initialize current month to the current date
    _currentMonth = DateTime(_today.year, _today.month);

    // Initialize selected date(s)
    _selectedDate = widget.initialSelectedDate;
    _selectedDates = widget.initialSelectedDates ?? [];

    // If single date is provided and not in multi-selected dates, add it
    if (_selectedDate != null && !_selectedDates.contains(_selectedDate)) {
      _selectedDates.add(_selectedDate!);
    }

    _scrollController = ScrollController();

    _scrollController.addListener(_scrollListener);

    _buildVisibleMonths();

    _currentMonthIndex =
        _visibleMonths.indexWhere((month) => month.year == _currentMonth.year && month.month == _currentMonth.month);
    if (_currentMonthIndex == -1) {
      _currentMonthIndex = 0;
    }

    // Scroll to the current month after layout
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToCurrentMonth();
    });
  }

  void _scrollListener() {
    if (_scrollController.hasClients) {
      final currentPosition = _scrollController.position.pixels;
      final todayMonthIndex =
          _visibleMonths.indexWhere((month) => month.year == _today.year && month.month == _today.month);

      if (todayMonthIndex != -1) {
        final estimatedTodayPosition = todayMonthIndex * 300.0;
        final isNearToday = (currentPosition - estimatedTodayPosition).abs() < 150;

        setState(() {
          _showFloatingButton = !isNearToday;
        });
      } else {
        setState(() {
          _showFloatingButton = true;
        });
      }
    }
  }

  void _buildVisibleMonths() {
    _visibleMonths = [];

    DateTime current = DateTime(widget.firstDay.year, widget.firstDay.month);
    final DateTime end = DateTime(widget.lastDay.year, widget.lastDay.month);

    while (!current.isAfter(end)) {
      _visibleMonths.add(current);
      current = DateTime(current.year, current.month + 1);
    }
  }

  void _scrollToCurrentMonth() {
    if (_currentMonthIndex != -1 && _scrollController.hasClients) {
      // Estimate the position based on month index and average height
      // 300.0 is an estimate of each month's height including padding
      final estimatedPosition = _currentMonthIndex * 300.0;

      _scrollController.jumpTo(estimatedPosition < _scrollController.position.maxScrollExtent ? estimatedPosition : 0);
    }
  }

  void _scrollToToday() {
    final todayMonthIndex =
        _visibleMonths.indexWhere((month) => month.year == _today.year && month.month == _today.month);

    if (todayMonthIndex != -1 && _scrollController.hasClients) {
      final estimatedPosition = todayMonthIndex * 300.0;
      _scrollController.animateTo(
        estimatedPosition < _scrollController.position.maxScrollExtent ? estimatedPosition : 0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void _handleDateTap(DateTime date) {
    if (widget.onTapDate != null) {
      widget.onTapDate!(date);
    }

    if (!widget.selectable) return;

    setState(() {
      if (widget.multiSelect) {
        if (_selectedDates.contains(date)) {
          _selectedDates.remove(date);
        } else {
          _selectedDates.add(date);
        }

        if (widget.onMultiDateSelected != null) {
          widget.onMultiDateSelected!(_selectedDates);
        }
      } else {
        _selectedDate = date;
        _selectedDates = [date];

        if (widget.onDateSelected != null) {
          widget.onDateSelected!(date);
        }
      }
    });
  }

  bool _isDateSelected(DateTime date) {
    return _selectedDates.any((selectedDate) =>
        selectedDate.year == date.year && selectedDate.month == date.month && selectedDate.day == date.day);
  }

  bool _isDateDisabled(DateTime date) {
    if (widget.disabledDates == null) return false;

    final dateKey = DateTime(date.year, date.month, date.day);
    return widget.disabledDates!.containsKey(dateKey) && widget.disabledDates![dateKey] == true;
  }

  bool _isToday(DateTime date) {
    return date.year == _today.year && date.month == _today.month && date.day == _today.day;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colors.white,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color: context.colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildDayNamesRow(),
                Flexible(
                  child: ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    controller: _scrollController,
                    shrinkWrap: true,
                    itemCount: _visibleMonths.length,
                    itemBuilder: (context, index) {
                      return _buildMonthSection(_visibleMonths[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
          if (_showFloatingButton)
            Positioned(
              bottom: 16,
              right: 0,
              left: 0,
              child: Center(
                child: ElevatedButton(
                  onPressed: _scrollToToday,
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
                    context.loc.today,
                    style: context.typography.textsmSemibold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDayNamesRow() {
    final List<String> dayNames = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: dayNames
            .map((day) => Expanded(
                  child: Text(day,
                      textAlign: TextAlign.center,
                      style: context.typography.textxsRegular.copyWith(
                        color: context.colors.gray500,
                      )),
                ))
            .toList(),
      ),
    );
  }

  Widget _buildMonthSection(DateTime month) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildMonthLabel(month),
        _buildCalendarGrid(month),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildMonthLabel(DateTime month) {
    final monthName = DateFormat("MMMM y").format(month);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        monthName.capitalize(),
        style: context.typography.textmdMedium.copyWith(
          color: context.colors.gray500,
        ),
      ),
    );
  }

  Widget _buildCalendarGrid(DateTime month) {
    return Column(
      children: _buildCalendarRows(month),
    );
  }

  List<Widget> _buildCalendarRows(DateTime month) {
    List<Widget> rows = [];

    final firstDayOfMonth = DateTime(month.year, month.month, 1);
    final lastDayOfMonth = DateTime(month.year, month.month + 1, 0);

    int firstWeekdayOfMonth = firstDayOfMonth.weekday;

    int daysInMonth = lastDayOfMonth.day;

    int day = 1;

    int rowCount = ((daysInMonth + firstWeekdayOfMonth - 1) / 7).ceil();

    for (int i = 0; i < rowCount; i++) {
      List<Widget> rowChildren = [];

      for (int j = 0; j < 7; j++) {
        if ((i == 0 && j < firstWeekdayOfMonth - 1) || (day > daysInMonth)) {
          // Empty cell
          rowChildren.add(Expanded(child: Container()));
        } else {
          final currentDate = DateTime(month.year, month.month, day);
          bool isWeekend = (j >= 5);
          bool isSelected = _isDateSelected(currentDate);
          bool isToday = _isToday(currentDate);
          bool isDisabled = _isDateDisabled(currentDate);

          rowChildren.add(Expanded(
            child: GestureDetector(
              onTap: isDisabled ? null : () => _handleDateTap(currentDate),
              child: _buildDayCell(day, isWeekend, isSelected, isDisabled, isToday),
            ),
          ));
          day++;
        }
      }

      rows.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: rowChildren,
        ),
      ));
    }

    return rows;
  }

  Widget _buildDayCell(int day, bool isWeekend, bool isSelected, bool isDisabled, bool isToday) {
    return Container(
      height: 36,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: (isSelected || isToday)
            ? Border(
                bottom: BorderSide(
                color: context.colors.purple500,
                width: 3,
              ))
            : null,
      ),
      child: Text(
        '$day',
        style: (isSelected || isToday)
            ? context.typography.textxlSemibold.copyWith(
                color: widget.selectable
                    ? context.colors.purple500
                    : (isToday ? context.colors.purple500 : context.colors.black),
              )
            : context.typography.textxlRegular.copyWith(
                color: isDisabled
                    ? Colors.grey.shade300
                    : isWeekend
                        ? context.colors.gray500
                        : context.colors.black,
              ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
