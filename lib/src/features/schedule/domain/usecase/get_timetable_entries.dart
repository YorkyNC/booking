import '../entity/timetable_entry.dart';
import '../repository/timetable_repository.dart';

class GetTimetableEntries {
  final TimetableRepository repository;

  GetTimetableEntries(this.repository);

  List<TimetableEntry> execute() {
    return repository.getTimetableEntries();
  }
}
