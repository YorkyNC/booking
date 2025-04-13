// section_header.dart

import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class BookingSummary extends StatelessWidget {
  final String? selectedFloor;
  final String? selectedSector;
  final String? selectedRow;
  final String? selectedPlace;
  final String date;
  final String? selectedStartTime;
  final String? selectedEndTime;
  final VoidCallback onDelete;

  const BookingSummary({
    super.key,
    required this.selectedFloor,
    required this.selectedSector,
    required this.selectedRow,
    required this.selectedPlace,
    required this.date,
    required this.selectedStartTime,
    required this.selectedEndTime,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.colors.gray300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'You are booking',
            style: context.typography.textmdSemibold.copyWith(
              color: context.colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Floor: ${selectedFloor ?? "1"}, Sector: ${selectedSector ?? "'A'"}, Row: $selectedRow, Place: $selectedPlace',
                style: context.typography.textsmMedium.copyWith(
                  color: context.colors.blue800,
                ),
              ),
              GestureDetector(
                onTap: onDelete,
                child: const Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'Date: ${date.isNotEmpty ? date : "17.02.2025"}',
            style: context.typography.textsmMedium.copyWith(
              color: context.colors.black,
            ),
          ),
          Text(
            'Time: ${selectedStartTime ?? "12:00"} - ${selectedEndTime ?? "14:00"}',
            style: context.typography.textsmMedium.copyWith(
              color: context.colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
