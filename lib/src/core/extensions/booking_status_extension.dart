import 'package:booking/src/features/history/domain/enum/booking_status.dart';
import 'package:flutter/material.dart';

extension BookingStatusExtension on BookingStatus {
  String get label {
    switch (this) {
      case BookingStatus.ongoing:
        return 'On-going';
      case BookingStatus.upcoming:
        return 'Booked';
      case BookingStatus.ended:
        return 'Ended';
      case BookingStatus.cancelled:
        return 'Cancelled';
    }
  }

  Color get color {
    switch (this) {
      case BookingStatus.ongoing:
        return const Color(0xff519237);
      case BookingStatus.upcoming:
        return const Color(0xFF7B61FF); // Purple
      case BookingStatus.ended:
        return Colors.black54;
      case BookingStatus.cancelled:
        return const Color(0xFFE57373); // Light red
    }
  }

  Color get backgroundColor {
    switch (this) {
      case BookingStatus.ongoing:
        return const Color(0xFFE8F5E9); // Light green
      case BookingStatus.upcoming:
        return const Color(0xFFEDE7FF); // Light purple
      case BookingStatus.ended:
        return const Color(0xFFEEEEEE); // Light gray
      case BookingStatus.cancelled:
        return const Color(0xFFFFEBEE); // Light red
    }
  }

  Color get borderColor {
    switch (this) {
      case BookingStatus.ongoing:
        return const Color(0xff519237);
      case BookingStatus.upcoming:
        return const Color(0xFF7B61FF);
      case BookingStatus.ended:
        return Colors.black12;
      case BookingStatus.cancelled:
        return const Color(0xFFE57373);
    }
  }

  IconData get icon {
    switch (this) {
      case BookingStatus.ongoing:
        return Icons.shuffle_rounded;
      case BookingStatus.upcoming:
        return Icons.calendar_today;
      case BookingStatus.ended:
        return Icons.history;
      case BookingStatus.cancelled:
        return Icons.cancel_outlined;
    }
  }

  String get headerText {
    switch (this) {
      case BookingStatus.ongoing:
        return 'Current on-going';
      case BookingStatus.upcoming:
        return 'Upcoming';
      case BookingStatus.ended:
        return 'Not Active';
      case BookingStatus.cancelled:
        return 'Cancelled';
    }
  }
}
