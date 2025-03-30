import '../../domain/entity/timetable_entry.dart';
import '../../domain/usecase/get_timetable_entries.dart';

class TimetableBloc {
  final GetTimetableEntries getTimetableEntriesUseCase;

  TimetableBloc({required this.getTimetableEntriesUseCase});

  List<TimetableEntry> getTimetableEntries() {
    return getTimetableEntriesUseCase.execute();
  }
}
