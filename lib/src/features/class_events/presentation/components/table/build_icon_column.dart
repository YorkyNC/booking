import 'package:flutter_svg/svg.dart';
import 'package:booking/src/app/imports.dart';
import 'package:booking/src/features/class_events/presentation/components/table/on_sort.dart';

DataColumn buildIconColumn({
  required BuildContext context,
  required String icon,
  required int columnIndex,
  required bool isSorted,
  required bool isAscending,
}) {
  return DataColumn(
    headingRowAlignment: MainAxisAlignment.center,
    onSort: (columnIndex, ascending) {
      onSort(context, columnIndex, ascending);
    },
    label: SvgPicture.asset(icon),
  );
}
