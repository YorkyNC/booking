import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:booking/src/features/detection/domain/entity/detection_entity.dart';

part 'detection_date_entity.freezed.dart';
part 'detection_date_entity.g.dart';

@freezed
class DetectionDateEntity with _$DetectionDateEntity {
  factory DetectionDateEntity({
    required DateTime date,
    required List<DetectionEntity> detections,
  }) = _DetectionDateEntity;
  factory DetectionDateEntity.fromJson(Map<String, dynamic> json) => _$DetectionDateEntityFromJson(json);
}
