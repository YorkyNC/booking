import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:booking/src/core/components/events/domain/models/event_entity.dart';
import 'package:booking/src/core/components/filter/domain/models/date_filter.dart';
import 'package:booking/src/features/review/domain/entities/analytics_entity.dart';

part 'review_state.freezed.dart';

@freezed
class ReviewState with _$ReviewState {
  factory ReviewState({
    List<EventEntity>? conflicts,
    AnalyticsEntity? analytics,
    required DateFilter analyticsDateFilter,
  }) = _ReviewState;
}
