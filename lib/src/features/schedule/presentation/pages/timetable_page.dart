import 'package:flutter/material.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';

import '../bloc/timetable_bloc.dart';
import '../components/timetable/timetable_widget.dart';

class TimetablePage extends StatelessWidget {
  final TimetableBloc timetableBloc;

  const TimetablePage({Key? key, required this.timetableBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final entries = timetableBloc.getTimetableEntries();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Школьное расписание'),
      ),
      backgroundColor: context.colors.white,
      body: SizedBox(
        width: context.width,
        height: context.height * 0.5,
        child: TimetableWidget(entries: entries),
      ),
    );
  }
}
