import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:booking/src/core/components/events/domain/models/enums/event_type.dart';
import 'package:booking/src/features/class/domain/entity/class_entity.dart';
import 'package:booking/src/features/detection/domain/entity/detection_date_entity.dart';
import 'package:booking/src/features/detection/domain/entity/detection_entity.dart';
import 'package:booking/src/features/detection/presentation/bloc/detection_event.dart';
import 'package:booking/src/features/detection/presentation/bloc/detection_state.dart';

@injectable
class DetectionBloc extends Bloc<DetectionEvent, DetectionState> {
  DetectionBloc() : super(DetectionState()) {
    _setupHandlers();
    add(DetectionFetched());
  }
  void _setupHandlers() {
    on<DetectionFetched>(_fetchData);
  }

  Future<void> _fetchData(DetectionFetched event, Emitter<DetectionState> emit) async {
    emit(
      state.copyWith(
        detection: null,
      ),
    );

    await Future.delayed(const Duration(seconds: 1));

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

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

    final List<DetectionDateEntity> mockSchedules = [];

    mockSchedules.add(
      DetectionDateEntity(
        date: yesterday,
        detections: [
          DetectionEntity(
            id: "10",
            subjectName: "Literature",
            classEntity: class3,
            startTime: DateTime(yesterday.year, yesterday.month, yesterday.day, 8, 30),
            endTime: DateTime(yesterday.year, yesterday.month, yesterday.day, 10, 0),
            room: "Room 201",
            purpose: "Poetry analysis",
            status: 'in process',
            processingCount: 10,
            porcessedCount: 12,
          ),
          DetectionEntity(
              id: "11",
              subjectName: "Algebra",
              classEntity: class1,
              startTime: DateTime(yesterday.year, yesterday.month, yesterday.day, 10, 30),
              endTime: DateTime(yesterday.year, yesterday.month, yesterday.day, 12, 0),
              room: "Room 103",
              purpose: "Equation solving",
              status: 'done',
              processingCount: 12,
              porcessedCount: 5),
          DetectionEntity(
              id: "12",
              subjectName: "Geography",
              classEntity: class2,
              startTime: DateTime(yesterday.year, yesterday.month, yesterday.day, 13, 30),
              endTime: DateTime(yesterday.year, yesterday.month, yesterday.day, 15, 0),
              room: "Room 105",
              purpose: "Map study",
              status: 'done',
              processingCount: 14,
              porcessedCount: 2),
        ],
      ),
    );

    mockSchedules.add(
      DetectionDateEntity(
        date: today,
        detections: [
          DetectionEntity(
            id: "1",
            subjectName: "Mathematics",
            classEntity: class1,
            startTime: DateTime(today.year, today.month, today.day, 8, 0),
            endTime: DateTime(today.year, today.month, today.day, 9, 30),
            room: "Room 101",
            purpose: "Regular class",
          ),
          DetectionEntity(
            id: "2",
            subjectName: "Physics",
            classEntity: class2,
            startTime: DateTime(today.year, today.month, today.day, 10, 0),
            endTime: DateTime(today.year, today.month, today.day, 11, 30),
            room: "Science Lab",
            purpose: "Lab session",
          ),
          DetectionEntity(
            id: "3",
            subjectName: "English",
            classEntity: class3,
            startTime: DateTime(today.year, today.month, today.day, 13, 0),
            endTime: DateTime(today.year, today.month, today.day, 23, 30),
            room: "Room 205",
            purpose: "Literature review",
          ),
        ],
      ),
    );

    final tomorrow = today.add(const Duration(days: 1));
    mockSchedules.add(
      DetectionDateEntity(
        date: tomorrow,
        detections: [
          DetectionEntity(
            id: "4",
            subjectName: "History",
            classEntity: class3,
            startTime: DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 9, 0),
            endTime: DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 10, 30),
            room: "Room 302",
            purpose: "Group project",
          ),
          DetectionEntity(
            id: "5",
            subjectName: "Chemistry",
            classEntity: class2,
            startTime: DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 11, 0),
            endTime: DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 12, 30),
            room: "Chemistry Lab",
            purpose: "Experiment",
          ),
          DetectionEntity(
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
      DetectionDateEntity(
        date: dayAfterTomorrow,
        detections: [
          DetectionEntity(
            id: "7",
            subjectName: "Art",
            classEntity: class1,
            startTime: DateTime(dayAfterTomorrow.year, dayAfterTomorrow.month, dayAfterTomorrow.day, 8, 30),
            endTime: DateTime(dayAfterTomorrow.year, dayAfterTomorrow.month, dayAfterTomorrow.day, 10, 0),
            room: "Art Studio",
            purpose: "Creative workshop",
          ),
          DetectionEntity(
            id: "8",
            subjectName: "Physical Education",
            classEntity: class2,
            startTime: DateTime(dayAfterTomorrow.year, dayAfterTomorrow.month, dayAfterTomorrow.day, 10, 30),
            endTime: DateTime(dayAfterTomorrow.year, dayAfterTomorrow.month, dayAfterTomorrow.day, 12, 0),
            room: "Gymnasium",
            purpose: "Team sports",
          ),
          DetectionEntity(
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

    emit(state.copyWith(detection: mockSchedules));
  }
}
