import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:booking/src/features/class/domain/entity/class_entity.dart';
import 'package:booking/src/features/parent/presentation/bloc/parent_event.dart';
import 'package:booking/src/features/parent/presentation/bloc/parent_state.dart';

import '../../../schedule/domain/entity/schedule_subject_entity.dart';

@injectable
class ParentBloc extends Bloc<ParentEvent, ParentState> {
  ParentBloc() : super(ParentState(schedule: [])) {
    _setupHandlers();
    add(const ParentEventFetched());
  }

  void _setupHandlers() {
    on<ParentEventFetched>(_fetchData);
  }

  Future<void> _fetchData(ParentEventFetched event, Emitter<ParentState> emit) async {
    emit(state.copyWith(isLoading: true, schedule: []));
    await Future.delayed(const Duration(seconds: 2));
    emit(
      state.copyWith(
        isLoading: false,
        schedule: [
          ScheduleSubjectEntity(
            id: '1',
            subjectName: 'Math',
            classEntity: const ClassEntity(
              className: '1A',
            ),
            startTime: DateTime(2025, 3, 14, 10, 0, 0),
            endTime: DateTime(2025, 3, 14, 11, 0, 0),
            room: '101',
            purpose: 'Math',
            status: 'active',
          ),
          ScheduleSubjectEntity(
            id: '2',
            subjectName: 'English',
            classEntity: const ClassEntity(
              className: '1A',
            ),
            startTime: DateTime(2025, 3, 14, 11, 0, 0),
            endTime: DateTime(2025, 3, 14, 12, 0, 0),
            room: '102',
            purpose: 'English',
            status: 'active',
          ),
          ScheduleSubjectEntity(
            id: '3',
            subjectName: 'Science',
            classEntity: const ClassEntity(
              className: '1A',
            ),
            startTime: DateTime(2025, 3, 14, 12, 0, 0),
            endTime: DateTime(2025, 3, 14, 13, 0, 0),
            room: '103',
            purpose: 'Science',
            status: 'active',
          ),
          ScheduleSubjectEntity(
            id: '4',
            subjectName: 'History',
            classEntity: const ClassEntity(
              className: '1A',
            ),
            startTime: DateTime(2025, 3, 14, 13, 0, 0),
            endTime: DateTime(2025, 3, 14, 14, 0, 0),
            room: '104',
            purpose: 'History',
            status: 'active',
          ),
          ScheduleSubjectEntity(
            id: '5',
            subjectName: 'Art',
            classEntity: const ClassEntity(
              className: '1A',
            ),
            startTime: DateTime(2025, 3, 14, 14, 0, 0),
            endTime: DateTime(2025, 3, 14, 15, 0, 0),
            room: '105',
            purpose: 'Art',
            status: 'active',
          ),
          ScheduleSubjectEntity(
            id: '6',
            subjectName: 'Music',
            classEntity: const ClassEntity(
              className: '1A',
            ),
            startTime: DateTime(2025, 3, 14, 15, 0, 0),
            endTime: DateTime(2025, 3, 14, 16, 0, 0),
            room: '106',
            purpose: 'Music',
            status: 'active',
          ),
        ],
      ),
    );
  }
}
