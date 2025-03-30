import '../../domain/entity/timetable_entry.dart';
import '../../domain/repository/timetable_repository.dart';
import '../datasource/timetable_local_data_source.dart';

class TimetableRepositoryImpl implements TimetableRepository {
  final TimetableLocalDataSource localDataSource;

  TimetableRepositoryImpl({required this.localDataSource});

  @override
  List<TimetableEntry> getTimetableEntries() {
    return localDataSource.getTimetableEntries();
  }
}
