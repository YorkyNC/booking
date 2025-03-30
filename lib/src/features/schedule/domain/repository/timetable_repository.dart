import '../entity/timetable_entry.dart';

abstract class TimetableRepository {
  List<TimetableEntry> getTimetableEntries();
}
