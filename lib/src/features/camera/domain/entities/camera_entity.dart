import 'package:freezed_annotation/freezed_annotation.dart';

part 'camera_entity.freezed.dart';

@freezed
class CameraEntity with _$CameraEntity {
  factory CameraEntity({
    required String id,
    required String name,
    required int cameraEventCount,
  }) = _CameraEntity;
}
