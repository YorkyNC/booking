import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:booking/src/features/student/domain/entity/student_entity.dart';

part 'student_state.freezed.dart';

@freezed
class StudentState with _$StudentState {
  factory StudentState({
    List<StudentEntity>? students,
  }) = _StudentState;
}
