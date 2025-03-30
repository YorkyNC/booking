import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:booking/src/core/components/filter/domain/models/date_filter.dart';
import 'package:booking/src/core/components/filter/presentation/widgets/date_filter_view.dart';
import 'package:booking/src/core/widgets/popups/sheet_popup.dart';

Future<void> showDateFilterPopup(
  BuildContext context, {
  required DateFilter dateFilter,
  required String title,
  void Function(DateFilter)? onSelected,
}) {
  return showSheetPopup(
    context,
    title: Text(title),
    builder: (context) => DateFilterView(
      dateFilter: dateFilter,
      onSelected: (dateFilter) {
        onSelected?.call(dateFilter);
        context.pop();
      },
    ),
  );
}
