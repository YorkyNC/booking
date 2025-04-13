// section_header.dart

import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/features/booking/presentation/components/seat_opions.dart';
import 'package:flutter/material.dart';

class SeatMap extends StatelessWidget {
  final List<List<int>> seatStatus;
  final Function(int, int) onSeatSelected;

  const SeatMap({
    super.key,
    required this.seatStatus,
    required this.onSeatSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 350,
          decoration: BoxDecoration(
            color: context.colors.gray200,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: context.colors.gray400,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(10, (columnIndex) {
                      if (columnIndex % 2 == 0) {
                        return Container(
                          width: 12,
                          color: context.colors.gray600,
                        );
                      } else {
                        final seatColumn = (columnIndex ~/ 2);
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(6, (rowIndex) {
                            final status = seatStatus[rowIndex][seatColumn];

                            final bool isReserved = status == 1;
                            final bool isSelected = status == 2;

                            return GestureDetector(
                              onTap: () {
                                if (isReserved) return;
                                onSeatSelected(rowIndex, seatColumn);
                              },
                              child: Container(
                                width: 22,
                                height: 22,
                                decoration: BoxDecoration(
                                  color: isReserved
                                      ? Colors.red
                                      : isSelected
                                          ? Colors.blue
                                          : context.colors.white,
                                  border: Border.all(
                                    color: context.colors.gray400,
                                    width: 1,
                                  ),
                                ),
                              ),
                            );
                          }),
                        );
                      }
                    }),
                  ),
                ),
                const SizedBox(height: 12),
                Divider(color: context.colors.gray400, height: 1),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SeatOpions(color: context.colors.white, label: 'Available'),
                    const SizedBox(width: 20),
                    const SeatOpions(color: Colors.red, label: 'Reserved'),
                    const SizedBox(width: 20),
                    const SeatOpions(color: Colors.blue, label: 'Selected'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
