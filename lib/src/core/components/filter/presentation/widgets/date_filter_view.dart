import 'package:flutter/material.dart';
import 'package:booking/src/core/components/filter/domain/models/date_filter.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/extensions/date_time_extension.dart';
import 'package:booking/src/core/components/filter/presentation/widgets/floating_label_radio_list_tile.dart';

class DateFilterView extends StatelessWidget {
  const DateFilterView({
    super.key,
    required this.dateFilter,
    required this.onSelected,
  });

  final DateFilter dateFilter;
  final void Function(DateFilter) onSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingLabelRadioListTile(
          onTap: () => onSelected(
            DateFilter.day(
              startDate: DateTime.now(),
              endDate: DateTime.now(),
            ),
          ),
          label: context.loc.forDay,
          text: dateFilter is DateFilterDay
              ? DateTimeExtension.formatDatePeriod(
                  dateFilter.startDate,
                  dateFilter.endDate,
                )
              : null,
        ),
        const Divider(height: 8),
        FloatingLabelRadioListTile(
          onTap: () => onSelected(
            DateFilter.week(
              startDate: DateTime.now().subtract(const Duration(days: 7)),
              endDate: DateTime.now(),
            ),
          ),
          label: context.loc.forWeek,
          text: dateFilter is DateFilterWeek
              ? DateTimeExtension.formatDatePeriod(
                  dateFilter.startDate,
                  dateFilter.endDate,
                )
              : null,
        ),
        const Divider(height: 8),
        FloatingLabelRadioListTile(
          onTap: () => onSelected(
            DateFilter.month(
              startDate: DateTime.now().subtract(const Duration(days: 30)),
              endDate: DateTime.now(),
            ),
          ),
          label: context.loc.forMonth,
          text: dateFilter is DateFilterMonth
              ? DateTimeExtension.formatDatePeriod(
                  dateFilter.startDate,
                  dateFilter.endDate,
                )
              : null,
        ),
        const Divider(height: 8),
        FloatingLabelRadioListTile(
          onTap: () => onSelected(
            DateFilter.custom(
              startDate: DateTime.now().subtract(const Duration(days: 20)),
              endDate: DateTime.now(),
            ),
          ),
          label: context.loc.selectPeriod,
          text: dateFilter is DateFilterCustom
              ? DateTimeExtension.formatDatePeriod(
                  dateFilter.startDate,
                  dateFilter.endDate,
                )
              : null,
        ),
      ],
    );
  }
}
