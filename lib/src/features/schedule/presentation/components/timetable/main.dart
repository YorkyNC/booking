import 'package:flutter/material.dart';

import '../../../data/datasource/timetable_local_data_source.dart';
import '../../../data/repository/timetable_repository_impl.dart';
import '../../../domain/usecase/get_timetable_entries.dart';
import '../../bloc/timetable_bloc.dart';
import '../../pages/timetable_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Setup dependencies
    final dataSource = TimetableLocalDataSource();
    final repository = TimetableRepositoryImpl(localDataSource: dataSource);
    final useCase = GetTimetableEntries(repository);
    final bloc = TimetableBloc(getTimetableEntriesUseCase: useCase);

    return MaterialApp(
      title: 'School Timetable',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TimetablePage(timetableBloc: bloc),
    );
  }
}
