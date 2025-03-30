import 'package:fluent_ui/fluent_ui.dart';
import 'package:intl/intl.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';

extension DateTimeExtension on DateTime {
  String get formatTime => DateFormat("HH:mm").format(this);
  String get formatDateTime => DateFormat('dd.MM.yyyy HH:mm').format(this);
  String get formatDate => DateFormat('dd.MM.yyyy').format(this);
  String get formatDateShortly => DateFormat('dd.MM').format(this);
  String get formatDateFull => DateFormat("dd MMMM, y").format(this);
  String get formatDateWithMonth => DateFormat("d MMMM").format(this);
  String get formatWeekday => DateFormat("EEEE").format(this);
  String get formatWeekdayShort => DateFormat("EE").format(this);
  String get formatDateWithWeekday =>
      "${DateFormat('dd.MM').format(this)} ${DateFormat("EEEE").format(this).uppercaseFirst()}";
  String get formatDateTimeFull => DateFormat('dd MMMM HH:mm').format(this);

  String getRemainingTimeText(BuildContext context) {
    final now = DateTime.now();
    final difference = this.difference(now);

    if (difference.isNegative) {
      return context.loc.timeIsOver;
    }

    final minutes = difference.inMinutes;
    if (minutes < 60) {
      return '${context.loc.left} $minutes ${context.loc.min}';
    } else {
      final hours = difference.inHours;
      final remainingMinutes = minutes - (hours * 60);
      return '${context.loc.left} $hours ч $remainingMinutes ${context.loc.min}';
    }
  }

  String get formatDateWithMonthYearAndWeekday =>
      "${DateFormat("d MMMM yyyy").format(this)}, ${DateFormat("EEEE").format(this)}";

  bool get isToday {
    final now = DateTime.now();
    return now.year == year && now.month == month && now.day == day;
  }

  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return yesterday.year == year && yesterday.month == month && yesterday.day == day;
  }

  static String formatDatePeriod(DateTime startDate, DateTime? endDate) {
    if (endDate != null) {
      return "${startDate.formatDate}-${endDate.formatDate}";
    }
    return startDate.formatDate;
  }

  static String formatDatePeriodFull(DateTime startDate, DateTime? endDate) {
    if (endDate != null) {
      return "${startDate.formatDateFull} - ${endDate.formatDateFull}";
    }
    return startDate.formatDateFull;
  }

  static String formatDatePeriodWithWeekday(DateTime startDate, DateTime? endDate) {
    if (endDate != null) {
      return "${startDate.formatWeekday}, ${startDate.formatDate} - ${endDate.formatWeekday}, ${endDate.formatDate}";
    }
    return "${startDate.formatWeekday}, ${startDate.formatDate}";
  }
}
