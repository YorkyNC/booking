import 'package:booking/src/core/components/filter/domain/models/date_filter.dart';

sealed class ReviewEvent {
  const ReviewEvent();
}

class ReviewFetched extends ReviewEvent {}

class ReviewAnalyticsFilterChanged extends ReviewEvent {
  final DateFilter dateFilter;

  const ReviewAnalyticsFilterChanged(this.dateFilter);
}
