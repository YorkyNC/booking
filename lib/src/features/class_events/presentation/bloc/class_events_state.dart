import 'package:booking/src/features/class/domain/entity/class_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'class_events_state.freezed.dart';

@freezed
class ClassEventsState with _$ClassEventsState {
  factory ClassEventsState({
    List<ClassEntity>? classes,
    List<ClassEntity>? filteredClasses,
    @Default(false) bool isSearching,
    @Default('') String searchQuery,
    @Default(-1) int sortColumnIndex,
    @Default(true) bool sortAscending,
  }) = _ClassEventsState;
}
