import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:booking/src/core/components/events/domain/models/enums/event_type.dart';

part 'class_entity.freezed.dart';
part 'class_entity.g.dart';

@freezed
class ClassEntity with _$ClassEntity {
  const factory ClassEntity({
    required String className,
    int? grade,
    int? studentsCount,
    @Default({}) Map<EventType, int> eventCounts,
    @Default(0) int notificationCount,
  }) = _ClassEntity;

  factory ClassEntity.fromJson(Map<String, dynamic> json) => _$ClassEntityFromJson(json);
}
