import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:booking/src/core/components/filter/domain/models/camera_filter.dart';
import 'package:booking/src/features/camera/domain/entities/camera_section_entity.dart';
import 'package:booking/src/features/camera/domain/entities/enums/sorting_options.dart';

part 'camera_state.freezed.dart';

@freezed
class CameraState with _$CameraState {
  factory CameraState({
    List<CameraSectionEntity>? cameraSections,
    List<CameraSectionEntity>? filteredCameraSections,
    int? count,
    required CameraFilter filter,
    @Default(CameraSorting.moreEvents) CameraSorting sort,
    @Default({'all': true}) Map<String, bool> selectedFilters,
    @Default('') String searchQuery,
    @Default(false) bool isSearching,
  }) = _CameraState;
}
