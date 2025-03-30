import 'package:freezed_annotation/freezed_annotation.dart';

part 'analytics_entity.freezed.dart';

@freezed
class AnalyticsEntity with _$AnalyticsEntity {
  factory AnalyticsEntity({
    required int conflicts,
    required int smoking,
    required int cheating,
    required String hotspot,
    required String troubleClass,
  }) = _AnalyticsEntity;
}