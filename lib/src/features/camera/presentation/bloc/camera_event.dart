import 'package:booking/src/core/components/filter/domain/models/camera_filter.dart';
import 'package:booking/src/features/camera/domain/entities/enums/sorting_options.dart';

sealed class CameraEvent {
  const CameraEvent();
}

class CameraFetched extends CameraEvent {}

class CameraSectionsFetched extends CameraEvent {}

class CameraPreliminaryCountFetched extends CameraEvent {}

class CameraFilterUpdated extends CameraEvent {
  final CameraFilter cameraFilter;
  const CameraFilterUpdated(this.cameraFilter);
}

class CameraFilterToggled extends CameraEvent {
  final String filterId;

  const CameraFilterToggled(this.filterId);
}

class CameraSearchChanged extends CameraEvent {
  final String query;

  const CameraSearchChanged(this.query);
}

class CameraSortUpdated extends CameraEvent {
  final CameraSorting cameraSorting;
  const CameraSortUpdated(this.cameraSorting);
}
