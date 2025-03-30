import 'package:freezed_annotation/freezed_annotation.dart';

part 'date_filter.freezed.dart';

@freezed
class DateFilter with _$DateFilter {
  factory DateFilter.day({
    required DateTime startDate,
    DateTime? endDate,
  }) = DateFilterDay;

  factory DateFilter.week({
    required DateTime startDate,
    required DateTime endDate,
  }) = DateFilterWeek;

  factory DateFilter.month({
    required DateTime startDate,
    required DateTime endDate,
  }) = DateFilterMonth;

  factory DateFilter.custom({
    required DateTime startDate,
    required DateTime endDate,
  }) = DateFilterCustom;
}
