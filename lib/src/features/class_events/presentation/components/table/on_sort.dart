import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking/src/features/class_events/presentation/bloc/class_events_bloc.dart';
import 'package:booking/src/features/class_events/presentation/bloc/class_events_event.dart';

void onSort(BuildContext context, int columnIndex, bool ascending) {
  context.read<ClassEventsBloc>().add(
        ClassSorted(
          columnIndex: columnIndex,
          ascending: ascending,
        ),
      );
}
