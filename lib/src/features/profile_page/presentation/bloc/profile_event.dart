part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class LoadProfile extends ProfileEvent {
  const LoadProfile();
}

class UpdateNotifications extends ProfileEvent {
  final bool value;

  const UpdateNotifications(this.value);

  @override
  List<Object?> get props => [value];
}

class UpdateAttendanceNotifications extends ProfileEvent {
  final bool value;

  const UpdateAttendanceNotifications(this.value);

  @override
  List<Object?> get props => [value];
}

class UpdateEventsNotifications extends ProfileEvent {
  final bool value;

  const UpdateEventsNotifications(this.value);

  @override
  List<Object?> get props => [value];
}

class UpdateCurrentRole extends ProfileEvent {
  final Role role;

  const UpdateCurrentRole(this.role);

  @override
  List<Object?> get props => [role];
}
