class TimetableEntry {
  final String subject;
  final String startTime;
  final String endTime;
  final String classroom;
  final String day;
  final int colorIndex;

  TimetableEntry({
    required this.subject,
    required this.startTime,
    required this.endTime,
    required this.classroom,
    required this.day,
    required this.colorIndex,
  });
}
