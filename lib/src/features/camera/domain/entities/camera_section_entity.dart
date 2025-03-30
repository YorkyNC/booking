import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:booking/src/features/camera/domain/entities/camera_entity.dart';

part 'camera_section_entity.freezed.dart';

@freezed
class CameraSectionEntity with _$CameraSectionEntity {
  const factory CameraSectionEntity({
    required String id,
    required String location,
    required int floor,
    required int cameraCount,
    required int eventCount,
    required List<CameraEntity> cameras,
  }) = _CameraSectionEntity;
}
