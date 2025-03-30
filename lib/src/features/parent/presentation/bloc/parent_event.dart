import 'package:equatable/equatable.dart';

abstract class ParentEvent extends Equatable {
  const ParentEvent();

  @override
  List<Object?> get props => [];
}

class ParentEventFetched extends ParentEvent {
  const ParentEventFetched();
}
