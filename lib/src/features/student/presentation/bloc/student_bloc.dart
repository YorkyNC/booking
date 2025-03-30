import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:booking/src/features/student/domain/entity/student_entity.dart';
import 'package:booking/src/features/student/presentation/bloc/student_event.dart';
import 'package:booking/src/features/student/presentation/bloc/student_state.dart';

@injectable
class StudentBloc extends Bloc<StudentEvent, StudentState> {
  StudentBloc() : super(StudentState()) {
    _setupHandlers();
    add(StudentsFetched());
  }

  void _setupHandlers() {
    on<StudentsFetched>(_fetchStudents);
  }

  Future<void> _fetchStudents(StudentsFetched event, Emitter<StudentState> emit) async {
    emit(state.copyWith(
      students: null,
    ));
    await Future.delayed(const Duration(seconds: 5));
    final students = [
      StudentEntity(
        firstName: "Emma",
        secondName: "Smith",
        eventCount: 12,
      ),
      StudentEntity(
        firstName: "Noah",
        secondName: "Johnson",
        eventCount: 8,
      ),
      StudentEntity(
        firstName: "Olivia",
        secondName: "Williams",
        eventCount: 15,
      ),
      StudentEntity(
        firstName: "Liam",
        secondName: "Brown",
        eventCount: 6,
      ),
      StudentEntity(
        firstName: "Ava",
        secondName: "Jones",
        eventCount: 19,
      ),
      StudentEntity(
        firstName: "Ethan",
        secondName: "Garcia",
        eventCount: 9,
      ),
      StudentEntity(
        firstName: "Sophia",
        secondName: "Miller",
        eventCount: 14,
      ),
      StudentEntity(
        firstName: "Mason",
        secondName: "Davis",
        eventCount: 7,
      ),
      StudentEntity(
        firstName: "Isabella",
        secondName: "Rodriguez",
        eventCount: 11,
      ),
      StudentEntity(
        firstName: "Lucas",
        secondName: "Martinez",
        eventCount: 5,
      ),
      StudentEntity(
        firstName: "Mia",
        secondName: "Hernandez",
        eventCount: 20,
      ),
      StudentEntity(
        firstName: "Alexander",
        secondName: "Lopez",
        eventCount: 13,
      ),
      StudentEntity(
        firstName: "Charlotte",
        secondName: "Wilson",
        eventCount: 10,
      ),
      StudentEntity(
        firstName: "Benjamin",
        secondName: "Anderson",
        eventCount: 17,
      ),
      StudentEntity(
        firstName: "Amelia",
        secondName: "Thomas",
        eventCount: 4,
      ),
    ];
    emit(state.copyWith(
      students: students,
    ));
  }
}
