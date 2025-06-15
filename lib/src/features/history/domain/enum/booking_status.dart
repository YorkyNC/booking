import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

enum BookingStatus {
  @JsonValue('ACTIVE')
  active, // Represents both ACTIVE and ONGOING
  @JsonValue('CANCELLED')
  cancelled,
  @JsonValue('EXPIRED')
  expired,
  @JsonValue('RESERVED')
  reserved, // Represents both RESERVED and UPCOMING
  @JsonValue('ONGOING')
  ongoing, // Will be mapped to ACTIVE
  @JsonValue('UPCOMING')
  upcoming; // Will be mapped to RESERVED

  String get value {
    switch (this) {
      case BookingStatus.active:
      case BookingStatus.ongoing:
        return 'ACTIVE';
      case BookingStatus.cancelled:
        return 'CANCELLED';
      case BookingStatus.expired:
        return 'EXPIRED';
      case BookingStatus.reserved:
      case BookingStatus.upcoming:
        return 'RESERVED';
    }
  }

  static BookingStatus fromString(String status) {
    try {
      final upperStatus = status.toUpperCase();
      switch (upperStatus) {
        case 'ONGOING':
          return BookingStatus.active;
        case 'UPCOMING':
          return BookingStatus.reserved;
        default:
          return BookingStatus.values.firstWhere(
            (element) => element.value == upperStatus,
          );
      }
    } catch (e) {
      // Log the unknown status for debugging
      debugPrint('⚠️ Unknown booking status: $status, defaulting to reserved');
      return BookingStatus.reserved;
    }
  }

  // Check if booking can be cancelled
  bool get canBeCancelled => this == BookingStatus.active || this == BookingStatus.reserved;

  // Check if booking is active/current
  bool get isActive => this == BookingStatus.active;

  // Check if booking is completed
  bool get isCompleted => this == BookingStatus.expired || this == BookingStatus.cancelled;
}
