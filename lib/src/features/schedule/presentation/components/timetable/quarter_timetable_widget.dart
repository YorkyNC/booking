import 'package:flutter/material.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/features/schedule/domain/entity/timetable_entry.dart';
import 'package:booking/src/features/schedule/presentation/components/timetable/timetable_widget.dart';

class QuarterTimetableWidget extends StatelessWidget {
  final List<TimetableEntry> entries;

  const QuarterTimetableWidget({Key? key, required this.entries}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First Quarter
            _buildQuarterSection(
              context,
              '1 Четверть (1 сентября - 31 октября)',
              _filterEntriesByQuarter(entries, 1),
            ),
            const SizedBox(height: 24),

            // Second Quarter
            _buildQuarterSection(
              context,
              '2 Четверть (1 ноября - 31 декабря)',
              _filterEntriesByQuarter(entries, 2),
            ),
            const SizedBox(height: 24),

            // Third Quarter
            _buildQuarterSection(
              context,
              '3 Четверть (14 января - 20 марта)',
              _filterEntriesByQuarter(entries, 3),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuarterSection(BuildContext context, String title, List<TimetableEntry> quarterEntries) {
    // Get unique time slots to calculate height
    final uniqueTimeSlots =
        quarterEntries.isEmpty ? 0 : quarterEntries.map((e) => '${e.startTime}-${e.endTime}').toSet().length;

    // Calculate days to determine width

    // Base height calculation: header (50) + cell height per time slot (80)
    // Add some padding (20) for good measure
    final calculatedHeight =
        uniqueTimeSlots > 0 ? 50 + (uniqueTimeSlots * 80) + 20 : 150; // Minimum height if no entries

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            title,
            style: context.typography.textsmMedium.copyWith(
              color: context.colors.purple500,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 12),

        // If no entries for this quarter, show empty message
        if (quarterEntries.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Center(
              child: Text(
                'Расписание пусто',
                style: context.typography.textsmRegular.copyWith(
                  color: context.colors.gray500,
                ),
              ),
            ),
          )
        else
          // Use the existing TimetableWidget for this quarter
          SizedBox(
            height: calculatedHeight.toDouble(),
            child: TimetableWidget(entries: quarterEntries),
          ),
      ],
    );
  }

  // Helper method to filter entries by quarter
  List<TimetableEntry> _filterEntriesByQuarter(List<TimetableEntry> allEntries, int quarter) {
    // In a real app, this would filter based on dates
    // For this example, we'll just use the mock data for the first quarter
    // and return empty lists for other quarters
    if (quarter == 1) {
      return allEntries;
    } else {
      return [];
    }
  }
}
