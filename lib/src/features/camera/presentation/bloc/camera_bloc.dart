import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:booking/src/core/components/filter/domain/models/camera_filter.dart';
import 'package:booking/src/core/components/filter/domain/models/date_filter.dart';
import 'package:booking/src/features/camera/domain/entities/camera_entity.dart';
import 'package:booking/src/features/camera/domain/entities/camera_section_entity.dart';
import 'package:booking/src/features/camera/presentation/bloc/camera_event.dart';
import 'package:booking/src/features/camera/presentation/bloc/camera_state.dart';

@injectable
class CameraBloc extends Bloc<CameraEvent, CameraState> {
  CameraBloc()
      : super(
          CameraState(
            filter: CameraFilter(
              date: DateFilter.day(
                startDate: DateTime.now(),
              ),
            ),
          ),
        ) {
    _setupHandlers();
    add(CameraFetched());
  }

  void _setupHandlers() {
    on<CameraFetched>(_fetchData);
    on<CameraPreliminaryCountFetched>(_fetchCount);
    on<CameraFilterUpdated>(_filterUpdated);
    on<CameraSortUpdated>(_sortUpdated);
    on<CameraFilterToggled>(_toggleFilter);
    on<CameraSearchChanged>(_updateSearch);
  }

  Future<void> _fetchData(CameraFetched event, Emitter<CameraState> emit) async {
    emit(state.copyWith(cameraSections: null));
    await Future.delayed(const Duration(seconds: 2));

    // Create camera entities
    final yardCameras = [
      CameraEntity(id: 'yard1', name: 'Камера 1', cameraEventCount: 5),
      CameraEntity(id: 'yard2', name: 'Камера 2', cameraEventCount: 52),
      CameraEntity(id: 'yard3', name: 'Камера 3', cameraEventCount: 1),
      CameraEntity(id: 'yard4', name: 'Камера 4', cameraEventCount: 2),
    ];

    final cafeteriaCameras = [
      CameraEntity(id: 'cafeteria1', name: 'Камера 1', cameraEventCount: 0),
      CameraEntity(id: 'cafeteria2', name: 'Камера 2', cameraEventCount: 0),
    ];

    final corridorCameras = [
      CameraEntity(id: 'corridor1', name: 'Камера 1', cameraEventCount: 0),
      CameraEntity(id: 'corridor2', name: 'Камера 2', cameraEventCount: 0),
      CameraEntity(id: 'corridor3', name: 'Камера 3', cameraEventCount: 0),
      CameraEntity(id: 'corridor4', name: 'Камера 4', cameraEventCount: 0),
    ];

    // Create section entities
    final sections = [
      CameraSectionEntity(
        id: 'yard',
        location: 'Двор',
        floor: 1,
        cameraCount: yardCameras.length,
        eventCount: 0,
        cameras: yardCameras,
      ),
      CameraSectionEntity(
        id: 'cafeteria',
        location: 'Столовая',
        floor: 1,
        cameraCount: cafeteriaCameras.length,
        eventCount: 0,
        cameras: cafeteriaCameras,
      ),
      CameraSectionEntity(
        id: 'corridor',
        location: 'Коридор',
        floor: 2,
        cameraCount: corridorCameras.length,
        eventCount: 0,
        cameras: corridorCameras,
      ),
    ];

    final filteredSections = state.searchQuery.isEmpty ? sections : _filterCameraSections(sections, state.searchQuery);

    emit(
      state.copyWith(
        cameraSections: sections,
        filteredCameraSections: filteredSections,
      ),
    );
  }

  Future<void> _fetchCount(
    CameraPreliminaryCountFetched event,
    Emitter<CameraState> emit,
  ) async {
    emit(
      state.copyWith(count: null),
    );
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(count: 50));
  }

  Future<void> _filterUpdated(
    CameraFilterUpdated event,
    Emitter<CameraState> emit,
  ) async {
    emit(state.copyWith(filter: event.cameraFilter));
    add(CameraFetched());
  }

  Future<void> _sortUpdated(
    CameraSortUpdated event,
    Emitter<CameraState> emit,
  ) async {
    emit(state.copyWith(sort: event.cameraSorting));
    add(CameraFetched());
  }

  Future<void> _toggleFilter(CameraFilterToggled event, Emitter<CameraState> emit) async {
    final id = event.filterId;
    final updatedFilters = Map<String, bool>.from(state.selectedFilters);
    if (id == 'all') {
      updatedFilters.clear();
      updatedFilters['all'] = true;
    } else {
      updatedFilters.remove('all');
      if (updatedFilters.containsKey(id)) {
        updatedFilters.remove(id);
      } else {
        updatedFilters[id] = true;
      }
      if (updatedFilters.isEmpty) {
        updatedFilters['all'] = true;
      }
    }

    emit(state.copyWith(selectedFilters: updatedFilters));
  }

  Future<void> _updateSearch(CameraSearchChanged event, Emitter<CameraState> emit) async {
    final query = event.query;

    if (state.cameraSections == null) {
      emit(state.copyWith(
        searchQuery: query,
        isSearching: query.isNotEmpty,
      ));
      return;
    }

    final filteredSections = query.isEmpty ? state.cameraSections : _filterCameraSections(state.cameraSections!, query);

    emit(state.copyWith(
      filteredCameraSections: filteredSections,
      searchQuery: query,
      isSearching: query.isNotEmpty,
    ));
  }

  List<CameraSectionEntity> _filterCameraSections(List<CameraSectionEntity> sections, String query) {
    query = query.toLowerCase();

    return sections.where((section) {
      // Check if section location matches
      if (section.location.toLowerCase().contains(query)) {
        return true;
      }

      // Check if any camera in this section matches
      final matchingCameras = section.cameras.where((camera) {
        return camera.name.toLowerCase().contains(query);
      }).toList();

      return matchingCameras.isNotEmpty;
    }).toList();
  }
}
