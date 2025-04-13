// section_header.dart

/// Utility class containing form validation functions
class Validators {
  /// Validates that a field is not empty
  static String? Function(String?) requiredFieldValidator(String fieldName) {
    return (value) {
      if (value == null || value.isEmpty) {
        return 'Please select a $fieldName.';
      }
      return null;
    };
  }

  /// Validates that a text field contains a valid date format
  static String? dateValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a date';
    }

    // Check for DD-MM-YYYY pattern
    final RegExp datePattern = RegExp(r'^\d{2}-\d{2}-\d{4}$');
    if (!datePattern.hasMatch(value)) {
      return 'Date must be in DD-MM-YYYY format';
    }

    // Could add more validation here to check day/month range

    return null;
  }

  /// Validates that start time comes before end time
  static String? timeRangeValidator(String? startTime, String? endTime) {
    if (startTime == null || startTime.isEmpty || endTime == null || endTime.isEmpty) {
      return 'Both start and end time must be selected';
    }

    // Simple string comparison works for 24-hour time format
    if (startTime.compareTo(endTime) >= 0) {
      return 'End time must be after start time';
    }

    return null;
  }
}
