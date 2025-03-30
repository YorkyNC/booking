import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:booking/src/core/components/events/domain/models/enums/event_type.dart';
import 'package:booking/src/features/class/domain/entity/class_entity.dart';
import 'package:booking/src/features/class/presentation/bloc/class_event.dart';
import 'package:booking/src/features/class/presentation/bloc/class_state.dart';

@injectable
class ClassBloc extends Bloc<ClassEvent, ClassState> {
  ClassBloc() : super(ClassState()) {
    _setupHandlers();
    add(ClassFetched());
  }

  void _setupHandlers() {
    on<ClassFetched>(_fetchStudents);
  }

  Future<void> _fetchStudents(ClassFetched event, Emitter<ClassState> emit) async {
    emit(state.copyWith(
      classes: null,
    ));
    await Future.delayed(const Duration(seconds: 5));
    final classes = [
      const ClassEntity(
        className: '7A Alpamys',
        studentsCount: 10,
        eventCounts: {
          EventType.conflict: 42,
          EventType.smoking: 4,
          EventType.cheating: 78,
        },
      ),
      const ClassEntity(
        className: '8B Zhibek',
        studentsCount: 21,
        eventCounts: {
          EventType.conflict: 15,
          EventType.smoking: 3,
          EventType.cheating: 20,
        },
      ),
      const ClassEntity(
        className: '9C Timur',
        studentsCount: 18,
        eventCounts: {
          EventType.conflict: 10,
          EventType.smoking: 5,
          EventType.cheating: 30,
        },
      ),
      const ClassEntity(
        className: '7D Aisha',
        studentsCount: 16,
        eventCounts: {
          EventType.conflict: 8,
          EventType.smoking: 2,
          EventType.cheating: 25,
        },
      ),
      const ClassEntity(
        className: '10A Bolat',
        studentsCount: 24,
        eventCounts: {
          EventType.conflict: 12,
          EventType.smoking: 6,
          EventType.cheating: 18,
        },
      ),
    ];
    emit(state.copyWith(
      classes: classes,
    ));
  }
}
