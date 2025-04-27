import 'package:booking/src/core/extensions/booking_status_extension.dart';
import 'package:booking/src/features/history/domain/enum/booking_status.dart';
import 'package:flutter/material.dart';

class BookingCard extends StatelessWidget {
  final DateTime startTime;
  final DateTime endTime;
  final String floor;
  final String sector;
  final String row;
  final String place;
  final BookingStatus status;
  final VoidCallback? onDelete;
  final bool showHeader;

  const BookingCard({
    Key? key,
    required this.startTime,
    required this.endTime,
    required this.floor,
    required this.sector,
    required this.row,
    required this.place,
    required this.status,
    this.onDelete,
    this.showHeader = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculate duration
    final Duration duration = endTime.difference(startTime);
    final int hours = duration.inHours;
    final int minutes = duration.inMinutes % 60;

    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showHeader)
            Padding(
              padding: const EdgeInsets.only(left: 4.0, bottom: 10.0),
              child: Text(
                status.headerText,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
            ),
          Container(
            // margin: const EdgeInsets.only(top: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(
                color: status.borderColor,
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        status.icon,
                        color: status.color,
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: status.backgroundColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          status.label,
                          style: TextStyle(
                            color: status.color,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _timeColumn(
                        '${startTime.hour.toString().padLeft(2, '0')}:00',
                        'Jan ${startTime.day}',
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            const SizedBox(height: 8),
                            Container(
                              height: 1.5,
                              color: Colors.grey.shade300,
                              margin: const EdgeInsets.symmetric(horizontal: 16),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${hours}h. $minutes min',
                              style: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      _timeColumn(
                        '${endTime.hour.toString().padLeft(2, '0')}:00',
                        'Jan ${endTime.day}',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(
                color: status.borderColor,
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Floor: $floor, Sector: \'$sector\', Row: $row, Place: $place',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  if (onDelete != null &&
                      (status == BookingStatus.ongoing ||
                          status == BookingStatus.upcoming ||
                          status == BookingStatus.cancelled))
                    GestureDetector(
                      onTap: onDelete,
                      child: Icon(
                        Icons.delete_outline,
                        color: Colors.red.shade300,
                        size: 20,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _timeColumn(String time, String date) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          time,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          date,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade500,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
