import 'package:booking/src/features/schedule/presentation/bloc/schedule_state.dart';
import 'package:equatable/equatable.dart';
import 'package:booking/src/features/schedule/presentation/bloc/schedule_state.dart';

abstract class ScheduleEvent extends Equatable {
  const ScheduleEvent();

  @override
  List<Object?> get props => [];
}

class ScheduleEventFetch extends ScheduleEvent {
  const ScheduleEventFetch();
}

class ScheduleEventDeleteSubject extends ScheduleEvent {
  final String subjectId;

  const ScheduleEventDeleteSubject(this.subjectId);

  @override
  List<Object?> get props => [subjectId];
}

class ScheduleEventCancelAllClasses extends ScheduleEvent {
  const ScheduleEventCancelAllClasses();
}

class ScheduleEventResetChanges extends ScheduleEvent {
  const ScheduleEventResetChanges();
}

class ScheduleEventSwitchView extends ScheduleEvent {
  final ScheduleViewType viewType;

  const ScheduleEventSwitchView(this.viewType);

  @override
  List<Object?> get props => [viewType];
}
