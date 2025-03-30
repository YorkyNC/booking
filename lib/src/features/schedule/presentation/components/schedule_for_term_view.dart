import 'package:flutter/material.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';

class ScheduleForTermView extends StatelessWidget {
  const ScheduleForTermView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildTimeTable(context);
  }

  Widget _buildTimeTable(BuildContext context) {
    return Table(
      border: TableBorder.all(
        color: Colors.grey.shade300,
        width: 1,
      ),
      columnWidths: const {
        0: FlexColumnWidth(1), // Time column
        1: FlexColumnWidth(2), // Monday column
        2: FlexColumnWidth(2), // Tuesday column
        3: FlexColumnWidth(2), // Wednesday column
      },
      children: [
        // Header row
        TableRow(
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
          ),
          children: [
            _buildTableCell('', context, isHeader: true),
            _buildTableCell('Пн', context, isHeader: true),
            _buildTableCell('Вт', context, isHeader: true),
            _buildTableCell('Ср', context, isHeader: true),
          ],
        ),

        // 14:10 - 14:50 row
        TableRow(
          children: [
            _buildTimeCell('14:10\n14:50'),
            _buildSubjectCell('Математика', '7A', Colors.blue.shade100),
            _buildSubjectCell('Алгебра', '9A', Colors.blue.shade100),
            _buildSubjectCell('Геометрия', '8A', Colors.orange.shade50),
          ],
        ),

        // 14:55 - 15:35 row
        TableRow(
          children: [
            _buildTimeCell('14:55\n15:35'),
            _buildSubjectCell('Математика', '8A', Colors.blue.shade100),
            _buildSubjectCell('Алгебра', '9A', Colors.blue.shade100),
            _buildSubjectCell('Алгебра', '8A', Colors.blue.shade50, hasBlueBorder: true),
          ],
        ),

        // 15:40 - 16:20 row
        TableRow(
          children: [
            _buildTimeCell('15:40\n16:20'),
            _buildEmptyCell(),
            _buildSubjectCell('Математика', '8A', Colors.blue.shade100),
            _buildSubjectCell('Алгебра', '8A', Colors.blue.shade50),
          ],
        ),

        // 16:25 - 17:05 row
        TableRow(
          children: [
            _buildTimeCell('16:25\n17:05'),
            _buildEmptyCell(),
            _buildEmptyCell(),
            _buildSubjectCell('Алгебра', '8A', Colors.blue.shade50),
          ],
        ),

        // 17:10 - 17:50 row
        TableRow(
          children: [
            _buildTimeCell('17:10\n17:50'),
            _buildSubjectCell('Математика', '8A', Colors.blue.shade100),
            _buildSubjectCell('Математика', '8A', Colors.blue.shade100),
            _buildSubjectCell('Математика', '8A', Colors.blue.shade100),
          ],
        ),

        // 17:55 - 18:35 row
        TableRow(
          children: [
            _buildTimeCell('17:55\n18:35'),
            _buildSubjectCell('Математика', '8A', Colors.blue.shade100),
            _buildSubjectCell('Математика', '8A', Colors.blue.shade100),
            _buildSubjectCell('Математика', '8A', Colors.blue.shade100),
          ],
        ),
      ],
    );
  }

  Widget _buildTableCell(String text, BuildContext context, {bool isHeader = false}) {
    return Container(
      color: context.colors.white,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildTimeCell(String time) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Text(
        time,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.black54,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildSubjectCell(String subject, String group, Color bgColor, {bool hasBlueBorder = false}) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: bgColor,
      child: Column(
        children: [
          Text(
            subject,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              border:
                  hasBlueBorder ? Border.all(color: Colors.blue.shade300, width: 1, style: BorderStyle.solid) : null,
            ),
            child: Text(
              group,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyCell() {
    return Container(
      color: Colors.grey.shade50,
    );
  }
}
