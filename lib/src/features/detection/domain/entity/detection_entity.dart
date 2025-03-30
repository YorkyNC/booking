import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:booking/src/features/class/domain/entity/class_entity.dart';

part 'detection_entity.freezed.dart';
part 'detection_entity.g.dart';

@freezed
class DetectionEntity with _$DetectionEntity {
  factory DetectionEntity({
    required String id,
    required String subjectName,
    required ClassEntity classEntity,
    required DateTime startTime,
    required DateTime endTime,
    int? processingCount,
    int? porcessedCount,
    String? room,
    String? purpose,
    String? status,
  }) = _DetectionEntity;
  factory DetectionEntity.fromJson(Map<String, dynamic> json) => _$DetectionEntityFromJson(json);
}
