import 'package:booking/src/features/student/domain/entity/guardian_entity.dart';
import 'package:booking/src/features/student/domain/entity/teacher_enitity.dart';

class StudentEntity {
  final String firstName;
  final String secondName;
  final int eventCount;

  final String? photoUrl;
  final String? className;
  final List<GuardianEntity>? guardians;
  final TeacherEntity? classTeacher;

  StudentEntity({
    required this.firstName,
    required this.secondName,
    required this.eventCount,
    this.photoUrl,
    this.className,
    this.guardians,
    this.classTeacher,
  });

  StudentEntity copyWith({
    String? firstName,
    String? secondName,
    int? eventCount,
    String? photoUrl,
    String? classGroup,
    List<GuardianEntity>? guardians,
    TeacherEntity? classTeacher,
  }) {
    return StudentEntity(
      firstName: firstName ?? this.firstName,
      secondName: secondName ?? this.secondName,
      eventCount: eventCount ?? this.eventCount,
      photoUrl: photoUrl ?? this.photoUrl,
      className: classGroup ?? className,
      guardians: guardians ?? this.guardians,
      classTeacher: classTeacher ?? this.classTeacher,
    );
  }
}
