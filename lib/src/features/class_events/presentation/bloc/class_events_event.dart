sealed class ClassEventsEvent {
  const ClassEventsEvent();
}

class ClassFetched extends ClassEventsEvent {}

class ClassFilterChanged extends ClassEventsEvent {
  final String filterCriteria;

  const ClassFilterChanged({required this.filterCriteria});
}

class ClassSearched extends ClassEventsEvent {
  final String query;
  const ClassSearched({required this.query});
}

class ClassSorted extends ClassEventsEvent {
  final int columnIndex;
  final bool ascending;

  const ClassSorted({
    required this.columnIndex,
    required this.ascending,
  });
}
