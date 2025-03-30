import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:booking/src/core/components/events/domain/models/enums/event_type.dart';
import 'package:booking/src/core/components/events/domain/models/suspect_entity.dart';
import 'package:booking/src/core/components/users/domain/models/user_entity.dart';

part 'event_entity.freezed.dart';

part 'event_entity.g.dart';

@freezed
class EventEntity with _$EventEntity {
  factory EventEntity({
    required String id,
    required DateTime createdAt,
    required DateTime expiresAt,
    required String location,
    required EventType eventType,
    required String videoUrl,
    DateTime? completedAt,
    UserEntity? assignedTo,
    @Default([]) List<SuspectEntity> involvedPeople,
    String? description,
  }) = _EventEntity;

  factory EventEntity.fromJson(Map<String, dynamic> json) => _$EventEntityFromJson(json);
}
