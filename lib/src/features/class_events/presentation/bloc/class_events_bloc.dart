import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:booking/src/core/components/events/domain/models/enums/event_type.dart';
import 'package:booking/src/features/class/domain/entity/class_entity.dart';
import 'package:booking/src/features/class_events/presentation/bloc/class_events_event.dart';
import 'package:booking/src/features/class_events/presentation/bloc/class_events_state.dart';

@injectable
class ClassEventsBloc extends Bloc<ClassEventsEvent, ClassEventsState> {
  ClassEventsBloc() : super(ClassEventsState()) {
    _setupHandlers();
    add(ClassFetched());
  }

  void _setupHandlers() {
    on<ClassFetched>(_fetchData);
    on<ClassSorted>(_sortData);
    on<ClassSearched>(_searchData); // Add the search handler
  }

  Future<void> _fetchData(ClassFetched event, Emitter<ClassEventsState> emit) async {
    emit(state.copyWith(
      classes: null,
      filteredClasses: null,
      isSearching: false,
    ));

    await Future.delayed(const Duration(seconds: 1));

    final classes = [
      const ClassEntity(
        className: '7A Alpamys',
        studentsCount: 10,
        eventCounts: {
          EventType.conflict: 42,
          EventType.smoking: 4,
          EventType.cheating: 78,
        },
      ),
      const ClassEntity(
        className: '8B Zhibek',
        studentsCount: 21,
        eventCounts: {
          EventType.conflict: 15,
          EventType.smoking: 3,
          EventType.cheating: 20,
        },
      ),
      const ClassEntity(
        className: '9C Timur',
        studentsCount: 18,
        eventCounts: {
          EventType.conflict: 10,
          EventType.smoking: 5,
          EventType.cheating: 30,
        },
      ),
      const ClassEntity(
        className: '7D Aisha',
        studentsCount: 16,
        eventCounts: {
          EventType.conflict: 8,
          EventType.smoking: 2,
          EventType.cheating: 25,
        },
      ),
      const ClassEntity(
        className: '10A Bolat',
        studentsCount: 24,
        eventCounts: {
          EventType.conflict: 12,
          EventType.smoking: 6,
          EventType.cheating: 18,
        },
      ),
    ];

    if (state.sortColumnIndex >= 0) {
      _applySorting(classes, state.sortColumnIndex, state.sortAscending);
    }

    emit(state.copyWith(
      classes: classes,
      filteredClasses: state.searchQuery.isNotEmpty ? _filterClasses(classes, state.searchQuery) : classes,
    ));
  }

  void _sortData(ClassSorted event, Emitter<ClassEventsState> emit) {
    if (state.classes == null) return;
    if (state.sortColumnIndex == event.columnIndex && state.sortAscending == event.ascending) return;

    final classes = List<ClassEntity>.from(state.classes!);
    _applySorting(classes, event.columnIndex, event.ascending);

    final filteredClasses = state.isSearching ? _filterClasses(classes, state.searchQuery) : classes;

    emit(state.copyWith(
      classes: classes,
      filteredClasses: filteredClasses,
      sortColumnIndex: event.columnIndex,
      sortAscending: event.ascending,
    ));
  }

  void _searchData(ClassSearched event, Emitter<ClassEventsState> emit) {
    final query = event.query.trim();

    if (state.classes == null) {
      emit(state.copyWith(
        searchQuery: query,
        isSearching: query.isNotEmpty,
      ));
      return;
    }

    final filteredClasses = query.isEmpty ? state.classes : _filterClasses(state.classes!, query);

    emit(state.copyWith(
      filteredClasses: filteredClasses,
      searchQuery: query,
      isSearching: query.isNotEmpty,
    ));
  }

  List<ClassEntity> _filterClasses(List<ClassEntity> classes, String query) {
    query = query.toLowerCase();
    return classes.where((classEntity) {
      final classNameMatch = classEntity.className.toLowerCase().contains(query);
      final studentsCountMatch = classEntity.studentsCount.toString().toLowerCase().contains(query);

      final metricsMatch = classEntity.eventCounts.entries.any((entry) =>
          entry.value.toString().toLowerCase().contains(query) || entry.key.name.toLowerCase().contains(query));

      return classNameMatch || studentsCountMatch || metricsMatch;
    }).toList();
  }

  void _applySorting(List<ClassEntity> classes, int columnIndex, bool ascending) {
    classes.sort((a, b) {
      int result;
      switch (columnIndex) {
        case 0: // Class Name column
          result = a.className.compareTo(b.className);
          break;
        case 1: // Conflicts column
          result = _compareMetrics(a.eventCounts[EventType.conflict] ?? 0, b.eventCounts[EventType.conflict] ?? 0);
          break;
        case 2: // Smoking column
          result = _compareMetrics(a.eventCounts[EventType.smoking] ?? 0, b.eventCounts[EventType.smoking] ?? 0);
          break;
        case 3: // Cheating column
          result = _compareMetrics(a.eventCounts[EventType.cheating] ?? 0, b.eventCounts[EventType.cheating] ?? 0);
          break;
        default:
          return 0;
      }
      return ascending ? result : -result;
    });
  }

  // Helper method to compare numeric values
  int _compareMetrics(int valueA, int valueB) {
    return valueA.compareTo(valueB);
  }
}
