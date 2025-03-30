import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/features/class_events/presentation/bloc/class_events_state.dart';

/// Creates the icon column for the table
DataColumn _buildIconColumn({
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

void Function(BuildContext context, int columnIndex, bool ascending) onSort = (_, __, ___) {};
void initOnSort(void Function(BuildContext, int, bool) sortFunction) {
  onSort = sortFunction;
}

List<DataColumn> buildColumns(BuildContext context, ClassEventsState state) {
  return [
    DataColumn(
      onSort: (columnIndex, ascending) {
        onSort(context, columnIndex, ascending);
      },
      label: Expanded(
        child: Text(
          context.loc.classNumber,
          style: context.typography.textxsRegular.copyWith(color: context.colors.gray500),
        ),
      ),
    ),
    _buildIconColumn(
      context: context,
      icon: context.assetImages.conflictsFilled,
      columnIndex: 1,
      isSorted: state.sortColumnIndex == 1,
      isAscending: state.sortAscending,
    ),
    _buildIconColumn(
      context: context,
      icon: context.assetImages.smokingFilled,
      columnIndex: 2,
      isSorted: state.sortColumnIndex == 2,
      isAscending: state.sortAscending,
    ),
    _buildIconColumn(
      context: context,
      icon: context.assetImages.cheatingFilled,
      columnIndex: 3,
      isSorted: state.sortColumnIndex == 3,
      isAscending: state.sortAscending,
    ),
  ];
}
