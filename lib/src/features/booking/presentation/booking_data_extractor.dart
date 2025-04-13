import 'package:flutter/material.dart';

/// A utility class for extracting and managing booking data
class BookingDataExtractor {
  /// Extracts floor data to be used in the dropdown
  static List<Map<String, dynamic>> getFloorData() {
    return [
      {'id': '1', 'name': '1', 'available': 54},
      {'id': '2', 'name': '2', 'available': 8},
      {'id': '3', 'name': '3', 'available': 21},
    ];
  }

  /// Extracts sector data to be used in the dropdown
  static List<Map<String, dynamic>> getSectorData() {
    return [
      {'id': 'A', 'name': 'Sector A', 'available': 54},
      {'id': 'B', 'name': 'Sector B', 'available': 8},
      {'id': 'C', 'name': 'Sector C', 'available': 21},
    ];
  }

  /// Extracts available start times for the booking
  static List<String> getStartTimes() {
    return ['08:00', '09:00', '10:00', '11:00', '12:00', '13:00', '14:00', '15:00', '16:00'];
  }

  /// Extracts available end times for the booking
  static List<String> getEndTimes() {
    return ['09:00', '10:00', '11:00', '12:00', '13:00', '14:00', '15:00', '16:00', '17:00'];
  }

  /// Initializes the seat map data with default values and reserved seats
  static List<List<int>> initializeSeatMap() {
    // Create a 6x5 grid of seats, all initially available (0)
    final seatStatus = List.generate(
      6,
      (_) => List.generate(
        5,
        (_) => 0,
      ),
    );

    // Mark reserved seats (1)
    final List<List<int>> reservedSeats = [
      [0, 0],
      [0, 3],
      [1, 1],
      [1, 4],
      [2, 0],
      [2, 2],
      [3, 3],
      [3, 4],
      [4, 1],
      [4, 3],
      [5, 0],
      [5, 2]
    ];

    for (var seat in reservedSeats) {
      if (seat[0] < seatStatus.length && seat[1] < seatStatus[0].length) {
        seatStatus[seat[0]][seat[1]] = 1;
      }
    }

    debugPrint('Initialized seat map with ${reservedSeats.length} reserved seats');
    return seatStatus;
  }

  /// Gets valid filtered end times based on selected start time
  static List<String> getFilteredEndTimes(
      String? selectedStartTime, List<String> allEndTimes, List<String> allStartTimes) {
    if (selectedStartTime == null) return allEndTimes;

    final startIndex = allStartTimes.indexOf(selectedStartTime);
    return allEndTimes.where((time) {
      final endIndex = allEndTimes.indexOf(time);
      return endIndex > startIndex;
    }).toList();
  }

  /// Utility function to format booking details for submission or display
  static String formatBookingDetails({
    required String? floor,
    required String? sector,
    required String date,
    required String? startTime,
    required String? endTime,
    String? row,
    String? place,
  }) {
    return 'Floor: ${floor ?? "1"}, Sector: ${sector ?? "A"}, '
        'Date: ${date.isNotEmpty ? date : "Not selected"}, '
        'Time: ${startTime ?? "Not selected"} - ${endTime ?? "Not selected"}'
        '${row != null && place != null ? ', Row: $row, Place: $place' : ''}';
  }

  /// Clears selected seat on seat status map
  static void clearSelectedSeat(List<List<int>> seatStatus) {
    for (int r = 0; r < seatStatus.length; r++) {
      for (int c = 0; c < seatStatus[r].length; c++) {
        if (seatStatus[r][c] == 2) {
          seatStatus[r][c] = 0;
        }
      }
    }
  }

  /// Check if any seat is currently selected
  static bool isAnySeatSelected(List<List<int>> seatStatus) {
    for (var row in seatStatus) {
      if (row.contains(2)) {
        return true;
      }
    }
    return false;
  }

  /// Get coordinates of selected seat, returns null if no seat is selected
  static List<int>? getSelectedSeatCoordinates(List<List<int>> seatStatus) {
    for (int r = 0; r < seatStatus.length; r++) {
      for (int c = 0; c < seatStatus[r].length; c++) {
        if (seatStatus[r][c] == 2) {
          return [r, c];
        }
      }
    }
    return null;
  }
}
