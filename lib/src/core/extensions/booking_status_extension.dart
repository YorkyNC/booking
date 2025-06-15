import 'package:booking/src/features/history/domain/enum/booking_status.dart';
import 'package:flutter/material.dart';

extension BookingStatusExtension on BookingStatus {
  String get label {
    switch (this) {
      case BookingStatus.active:
      case BookingStatus.ongoing:
        return 'Active';
      case BookingStatus.reserved:
      case BookingStatus.upcoming:
        return 'Booked';
      case BookingStatus.expired:
        return 'Expired';
      case BookingStatus.cancelled:
        return 'Cancelled';
    }
  }

  Color get color {
    switch (this) {
      case BookingStatus.active:
      case BookingStatus.ongoing:
        return const Color(0xFF4CAF50); // Green
      case BookingStatus.reserved:
      case BookingStatus.upcoming:
        return const Color(0xFF4CAF50); // Green
      case BookingStatus.expired:
        return const Color(0xFF9E9E9E); // Gray
      case BookingStatus.cancelled:
        return const Color(0xFFF44336); // Red
    }
  }

  Color get backgroundColor {
    switch (this) {
      case BookingStatus.active:
      case BookingStatus.ongoing:
        return const Color(0xFFE8F5E9); // Light Green
      case BookingStatus.reserved:
      case BookingStatus.upcoming:
        return const Color(0xFFE8F5E9); // Light Green
      case BookingStatus.expired:
        return const Color(0xFFF5F5F5); // Light Gray
      case BookingStatus.cancelled:
        return const Color(0xFFFFEBEE); // Light Red
    }
  }

  Color get borderColor {
    switch (this) {
      case BookingStatus.active:
      case BookingStatus.ongoing:
        return const Color(0xFF4CAF50); // Green
      case BookingStatus.reserved:
      case BookingStatus.upcoming:
        return const Color(0xFF4CAF50); // Green
      case BookingStatus.expired:
        return const Color(0xFF9E9E9E); // Gray
      case BookingStatus.cancelled:
        return const Color(0xFFF44336); // Red
    }
  }

  IconData get icon {
    switch (this) {
      case BookingStatus.active:
      case BookingStatus.ongoing:
        return Icons.check_circle;
      case BookingStatus.reserved:
      case BookingStatus.upcoming:
        return Icons.calendar_today;
      case BookingStatus.expired:
        return Icons.history;
      case BookingStatus.cancelled:
        return Icons.cancel_outlined;
    }
  }

  String get headerText {
    switch (this) {
      case BookingStatus.active:
      case BookingStatus.ongoing:
        return 'Active';
      case BookingStatus.reserved:
      case BookingStatus.upcoming:
        return 'Booked';
      case BookingStatus.expired:
        return 'Not Active';
      case BookingStatus.cancelled:
        return 'Cancelled';
    }
  }
}

class BookingStatusColors {
  final Color primary;
  final Color background;
  final Color border;

  const BookingStatusColors({
    required this.primary,
    required this.background,
    required this.border,
  });

  factory BookingStatusColors.fromStatus(BookingStatus status) {
    switch (status) {
      case BookingStatus.active:
      case BookingStatus.upcoming:
        return const BookingStatusColors(
          primary: Color(0xFF4CAF50),
          background: Color(0xFFE8F5E9),
          border: Color(0xFF4CAF50),
        );
      case BookingStatus.ongoing:
        return const BookingStatusColors(
          primary: Color(0xFF2196F3),
          background: Color(0xFFE3F2FD),
          border: Color(0xFF2196F3),
        );
      case BookingStatus.expired:
        return const BookingStatusColors(
          primary: Color(0xFF9E9E9E),
          background: Color(0xFFF5F5F5),
          border: Color(0xFF9E9E9E),
        );
      case BookingStatus.cancelled:
        return const BookingStatusColors(
          primary: Color(0xFFF44336),
          background: Color(0xFFFFEBEE),
          border: Color(0xFFF44336),
        );
      case BookingStatus.reserved:
        return const BookingStatusColors(
          primary: Color(0xFFFF9800),
          background: Color(0xFFFFF3E0),
          border: Color(0xFFFF9800),
        );
    }
  }
}
