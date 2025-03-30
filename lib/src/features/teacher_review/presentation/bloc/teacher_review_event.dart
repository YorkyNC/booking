import 'package:booking/src/core/components/filter/domain/models/date_filter.dart';

sealed class TeacherReviewEvent {
  const TeacherReviewEvent();
}

class TeacherReviewFetched extends TeacherReviewEvent {}

class TeacherReviewFilterChanged extends TeacherReviewEvent {
  final DateFilter dateFilter;

  const TeacherReviewFilterChanged(this.dateFilter);
}
