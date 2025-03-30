import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:booking/src/core/components/events/domain/models/enums/event_type.dart';
import 'package:booking/src/core/components/filter/domain/models/date_filter.dart';
import 'package:booking/src/features/class/domain/entity/class_entity.dart';
import 'package:booking/src/features/teacher_review/presentation/bloc/teacher_review_event.dart';
import 'package:booking/src/features/teacher_review/presentation/bloc/teacher_review_state.dart';

@injectable
class TeacherReviewBloc extends Bloc<TeacherReviewEvent, TeacherReviewState> {
  TeacherReviewBloc()
      : super(
          TeacherReviewState(
            analyticsDateFilter: DateFilter.day(
              startDate: DateTime.now(),
            ),
          ),
        ) {
    _setupHandlers();
    add(TeacherReviewFetched());
  }
  void _setupHandlers() {
    on<TeacherReviewFetched>(_fetchData);
    on<TeacherReviewFilterChanged>(_analyticsFilterChanged);
  }

  Future<void> _fetchData(TeacherReviewFetched event, Emitter<TeacherReviewState> emit) async {
    emit(state.copyWith(events: null));
    await Future.delayed(const Duration(seconds: 1));
    emit(
      state.copyWith(
        events: [
          const ClassEntity(
            grade: 1,
            className: "Reading",
            eventCounts: {EventType.cheating: 1},
          ),
          const ClassEntity(
            grade: 2,
            className: "Math",
            eventCounts: {EventType.cheating: 43},
          ),
          const ClassEntity(
            grade: 3,
            className: "Science",
            eventCounts: {EventType.cheating: 21},
          ),
          const ClassEntity(
            grade: 4,
            className: "Social Studies",
            eventCounts: {EventType.cheating: 20},
          ),
          const ClassEntity(
            grade: 5,
            className: "Art",
            eventCounts: {EventType.cheating: 8},
          ),
          const ClassEntity(
            grade: 6,
            className: "Geography",
            eventCounts: {EventType.cheating: 4},
          ),
          const ClassEntity(
            grade: 11,
            className: "3eography3",
            eventCounts: {EventType.cheating: 1},
          ),
          const ClassEntity(
            grade: 0,
            className: "2eography2",
            eventCounts: {EventType.cheating: 1},
          ),
          const ClassEntity(
            grade: 7,
            className: "Language Arts",
            eventCounts: {EventType.cheating: 2},
          ),
          const ClassEntity(
            grade: 8,
            className: "Physical Education",
            eventCounts: {EventType.cheating: 1},
          ),
          const ClassEntity(
            grade: 9,
            className: "Biology",
            eventCounts: {EventType.cheating: 2},
          ),
          const ClassEntity(
            grade: 3,
            className: "Music",
            eventCounts: {EventType.cheating: 1},
          ),
        ],
      ),
    );
  }

  Future<void> _analyticsFilterChanged(TeacherReviewFilterChanged event, Emitter<TeacherReviewState> emit) async {
    if (event.dateFilter.runtimeType == state.analyticsDateFilter.runtimeType &&
        event.dateFilter is! DateFilterCustom) {
      return;
    }
    emit(state.copyWith(analyticsDateFilter: event.dateFilter));
    add(TeacherReviewFetched());
  }
}
