import 'package:flutter/material.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';

import '../../../domain/entity/timetable_entry.dart';

class TimetableCell extends StatelessWidget {
  final TimetableEntry entry;
  final double cellHeight;

  const TimetableCell({
    Key? key,
    required this.entry,
    this.cellHeight = 80.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Empty cell if no subject
    if (entry.subject.isEmpty) {
      return Container(
        width: 120,
        height: cellHeight,
        decoration: BoxDecoration(
          border: Border.symmetric(
            vertical: BorderSide(
              color: context.colors.gray50,
              width: 4,
            ),
          ),
        ),
      );
    }

    // Colors for different subjects
    final colors = [
      context.colors.purple100,
      context.colors.success100, // Algebra - light purple
      context.colors.warning100, // Geometry - light yellow
    ];

    return Container(
      width: 120,
      height: cellHeight,
      decoration: BoxDecoration(
        border: Border.all(
          color: context.colors.gray50,
          width: 4,
        ),
        color: colors[entry.colorIndex % colors.length],
      ),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            entry.subject,
            style: context.typography.textxsMedium.copyWith(
              color: context.colors.black,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            entry.classroom,
            style: context.typography.textxsRegular.copyWith(
              color: context.colors.gray500,
            ),
          ),
        ],
      ),
    );
  }
}
