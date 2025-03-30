import 'package:booking/src/core/components/events/domain/models/enums/event_type.dart';
import 'package:booking/src/features/class/domain/entity/class_entity.dart';
import 'package:booking/src/features/schedule/domain/entity/schedule_day_entity.dart';
import 'package:booking/src/features/schedule/domain/entity/schedule_subject_entity.dart';
import 'package:booking/src/features/schedule/presentation/bloc/schedule_event.dart';
import 'package:booking/src/features/schedule/presentation/bloc/schedule_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  List<ScheduleDayEntity>? _originalSchedule;

  ScheduleBloc() : super(ScheduleState()) {
    _setupHandlers();
    add(const ScheduleEventFetch());
  }

  void _setupHandlers() {
    on<ScheduleEventFetch>(_fetchData);
    on<ScheduleEventDeleteSubject>(_deleteSubject);
    on<ScheduleEventCancelAllClasses>(_cancelAllClasses);
    on<ScheduleEventResetChanges>(_resetChanges);
    on<ScheduleEventSwitchView>(_switchView);
  }

  Future<void> _fetchData(ScheduleEventFetch event, Emitter<ScheduleState> emit) async {
    emit(state.copyWith(schedules: null, hasChanges: false, deletedSubjects: []));

    await Future.delayed(const Duration(seconds: 1));

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    const class1 = ClassEntity(
      className: "Class 1A",
      grade: 1,
      studentsCount: 25,
      eventCounts: {EventType.cheating: 2, EventType.conflict: 3, EventType.smoking: 1},
      notificationCount: 5,
    );

    const class2 = ClassEntity(
      className: "Class 2B",
      grade: 2,
      studentsCount: 28,
      eventCounts: {EventType.cheating: 1, EventType.conflict: 2, EventType.smoking: 0},
      notificationCount: 3,
    );

    const class3 = ClassEntity(
      className: "Class 3C",
      grade: 3,
      studentsCount: 22,
      eventCounts: {EventType.cheating: 4, EventType.conflict: 1, EventType.smoking: 2},
      notificationCount: 4,
    );

    final List<ScheduleDayEntity> mockSchedules = [];

    mockSchedules.add(
      ScheduleDayEntity(
        date: today,
        subjects: [
          ScheduleSubjectEntity(
            id: "1",
            subjectName: "Mathematics",
            classEntity: class1,
            startTime: DateTime(today.year, today.month, today.day, 8, 0),
            endTime: DateTime(today.year, today.month, today.day, 9, 30),
            room: "Room 101",
            purpose: "Regular class",
          ),
          ScheduleSubjectEntity(
            id: "2",
            subjectName: "Physics",
            classEntity: class2,
            startTime: DateTime(today.year, today.month, today.day, 10, 0),
            endTime: DateTime(today.year, today.month, today.day, 11, 30),
            room: "Science Lab",
            purpose: "Lab session",
          ),
          ScheduleSubjectEntity(
            id: "3",
            subjectName: "English",
            classEntity: class3,
            startTime: DateTime(today.year, today.month, today.day, 13, 0),
            endTime: DateTime(today.year, today.month, today.day, 14, 30),
            room: "Room 205",
            purpose: "Literature review",
          ),
        ],
      ),
    );

    final tomorrow = today.add(const Duration(days: 1));
    mockSchedules.add(
      ScheduleDayEntity(
        date: tomorrow,
        subjects: [
          ScheduleSubjectEntity(
            id: "4",
            subjectName: "History",
            classEntity: class3,
            startTime: DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 9, 0),
            endTime: DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 10, 30),
            room: "Room 302",
            purpose: "Group project",
          ),
          ScheduleSubjectEntity(
            id: "5",
            subjectName: "Chemistry",
            classEntity: class2,
            startTime: DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 11, 0),
            endTime: DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 12, 30),
            room: "Chemistry Lab",
            purpose: "Experiment",
          ),
          ScheduleSubjectEntity(
            id: "6",
            subjectName: "Computer Science",
            classEntity: class1,
            startTime: DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 14, 0),
            endTime: DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 15, 30),
            room: "Computer Lab",
            purpose: "Coding practice",
          ),
        ],
      ),
    );

    final dayAfterTomorrow = today.add(const Duration(days: 2));
    mockSchedules.add(
      ScheduleDayEntity(
        date: dayAfterTomorrow,
        subjects: [
          ScheduleSubjectEntity(
            id: "7",
            subjectName: "Art",
            classEntity: class1,
            startTime: DateTime(dayAfterTomorrow.year, dayAfterTomorrow.month, dayAfterTomorrow.day, 8, 30),
            endTime: DateTime(dayAfterTomorrow.year, dayAfterTomorrow.month, dayAfterTomorrow.day, 10, 0),
            room: "Art Studio",
            purpose: "Creative workshop",
          ),
          ScheduleSubjectEntity(
            id: "8",
            subjectName: "Physical Education",
            classEntity: class2,
            startTime: DateTime(dayAfterTomorrow.year, dayAfterTomorrow.month, dayAfterTomorrow.day, 10, 30),
            endTime: DateTime(dayAfterTomorrow.year, dayAfterTomorrow.month, dayAfterTomorrow.day, 12, 0),
            room: "Gymnasium",
            purpose: "Team sports",
          ),
          ScheduleSubjectEntity(
            id: "9",
            subjectName: "Biology",
            classEntity: class3,
            startTime: DateTime(dayAfterTomorrow.year, dayAfterTomorrow.month, dayAfterTomorrow.day, 13, 30),
            endTime: DateTime(dayAfterTomorrow.year, dayAfterTomorrow.month, dayAfterTomorrow.day, 15, 0),
            room: "Biology Lab",
            purpose: "Microscope work",
          ),
        ],
      ),
    );

    _originalSchedule = List.from(mockSchedules);

    emit(state.copyWith(schedules: mockSchedules));
  }

  void _deleteSubject(ScheduleEventDeleteSubject event, Emitter<ScheduleState> emit) {
    if (state.schedules == null) return;

    // Find the subject to be deleted
    ScheduleSubjectEntity? deletedSubject;
    for (final day in state.schedules!) {
      for (final subject in day.subjects) {
        if (subject.id == event.subjectId) {
          deletedSubject = subject;
          break;
        }
      }
      if (deletedSubject != null) break;
    }

    if (deletedSubject == null) return;

    final updatedDeletedSubjects = List<ScheduleSubjectEntity>.from(state.deletedSubjects)..add(deletedSubject);

    final updatedSchedules = state.schedules!.map((day) {
      final updatedSubjects = day.subjects
          .where(
            (subject) => subject.id != event.subjectId,
          )
          .toList();

      return ScheduleDayEntity(
        date: day.date,
        subjects: updatedSubjects,
      );
    }).toList();

    final nonEmptyDays = updatedSchedules
        .where(
          (day) => day.subjects.isNotEmpty,
        )
        .toList();

    emit(state.copyWith(schedules: nonEmptyDays, deletedSubjects: updatedDeletedSubjects, hasChanges: true));
  }

  void _cancelAllClasses(ScheduleEventCancelAllClasses event, Emitter<ScheduleState> emit) {
    if (state.schedules == null) return;

    final allSubjects = <ScheduleSubjectEntity>[];
    for (final day in state.schedules!) {
      allSubjects.addAll(day.subjects);
    }

    final updatedDeletedSubjects = List<ScheduleSubjectEntity>.from(state.deletedSubjects)..addAll(allSubjects);

    emit(state.copyWith(schedules: [], deletedSubjects: updatedDeletedSubjects, hasChanges: true));
  }

  void _resetChanges(ScheduleEventResetChanges event, Emitter<ScheduleState> emit) {
    if (_originalSchedule != null) {
      emit(state.copyWith(
        schedules: List.from(_originalSchedule!),
        deletedSubjects: [],
        hasChanges: false,
      ));
    }
  }

  void _switchView(ScheduleEventSwitchView event, Emitter<ScheduleState> emit) {
    emit(state.copyWith(viewType: event.viewType));
  }
}
