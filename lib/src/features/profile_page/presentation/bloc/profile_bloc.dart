import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/profile.dart';
import '../../domain/usecases/get_profile.dart';
import '../../domain/usecases/update_current_role.dart' as role_usecase;
import '../../domain/usecases/update_notification_settings.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfile getProfile;
  final UpdateNotificationSettings updateNotificationSettings;
  final role_usecase.UpdateCurrentRole updateCurrentRole;

  ProfileBloc({
    required this.getProfile,
    required this.updateNotificationSettings,
    required this.updateCurrentRole,
  }) : super(ProfileInitial()) {
    on<LoadProfile>(_onLoadProfile);
    on<UpdateNotifications>(_onUpdateNotifications);
    on<UpdateAttendanceNotifications>(_onUpdateAttendanceNotifications);
    on<UpdateEventsNotifications>(_onUpdateEventsNotifications);
    on<UpdateCurrentRole>(_onUpdateCurrentRole);
  }

  Future<void> _onLoadProfile(
    LoadProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    final result = await getProfile();
    result.fold(
      (failure) => emit(const ProfileError('Failed to load profile')),
      (profile) => emit(ProfileLoaded(profile)),
    );
  }

  Future<void> _onUpdateNotifications(
    UpdateNotifications event,
    Emitter<ProfileState> emit,
  ) async {
    if (state is ProfileLoaded) {
      final currentState = state as ProfileLoaded;
      final currentSettings = currentState.profile.notificationSettings;

      final newSettings = NotificationSettings(
        notifications: event.value,
        attendanceNotifications: currentSettings.attendanceNotifications,
        eventsNotifications: currentSettings.eventsNotifications,
      );

      final result = await updateNotificationSettings(newSettings);

      result.fold(
        (failure) => emit(const ProfileError('Failed to update notifications')),
        (_) {
          final updatedProfile = Profile(
            name: currentState.profile.name,
            email: currentState.profile.email,
            avatarUrl: currentState.profile.avatarUrl,
            children: currentState.profile.children,
            classes: currentState.profile.classes,
            notificationSettings: newSettings,
            roles: currentState.profile.roles,
            currentRole: currentState.profile.currentRole,
          );
          emit(ProfileLoaded(updatedProfile));
        },
      );
    }
  }

  Future<void> _onUpdateAttendanceNotifications(
    UpdateAttendanceNotifications event,
    Emitter<ProfileState> emit,
  ) async {
    if (state is ProfileLoaded) {
      final currentState = state as ProfileLoaded;
      final currentSettings = currentState.profile.notificationSettings;

      final newSettings = NotificationSettings(
        notifications: currentSettings.notifications,
        attendanceNotifications: event.value,
        eventsNotifications: currentSettings.eventsNotifications,
      );

      final result = await updateNotificationSettings(newSettings);

      result.fold(
        (failure) => emit(
            const ProfileError('Failed to update attendance notifications')),
        (_) {
          final updatedProfile = Profile(
            name: currentState.profile.name,
            email: currentState.profile.email,
            avatarUrl: currentState.profile.avatarUrl,
            children: currentState.profile.children,
            classes: currentState.profile.classes,
            notificationSettings: newSettings,
            roles: currentState.profile.roles,
            currentRole: currentState.profile.currentRole,
          );
          emit(ProfileLoaded(updatedProfile));
        },
      );
    }
  }

  Future<void> _onUpdateEventsNotifications(
    UpdateEventsNotifications event,
    Emitter<ProfileState> emit,
  ) async {
    if (state is ProfileLoaded) {
      final currentState = state as ProfileLoaded;
      final currentSettings = currentState.profile.notificationSettings;

      final newSettings = NotificationSettings(
        notifications: currentSettings.notifications,
        attendanceNotifications: currentSettings.attendanceNotifications,
        eventsNotifications: event.value,
      );

      final result = await updateNotificationSettings(newSettings);

      result.fold(
        (failure) =>
            emit(const ProfileError('Failed to update events notifications')),
        (_) {
          final updatedProfile = Profile(
            name: currentState.profile.name,
            email: currentState.profile.email,
            avatarUrl: currentState.profile.avatarUrl,
            children: currentState.profile.children,
            classes: currentState.profile.classes,
            notificationSettings: newSettings,
            roles: currentState.profile.roles,
            currentRole: currentState.profile.currentRole,
          );
          emit(ProfileLoaded(updatedProfile));
        },
      );
    }
  }

  Future<void> _onUpdateCurrentRole(
    UpdateCurrentRole event,
    Emitter<ProfileState> emit,
  ) async {
    if (state is ProfileLoaded) {
      final currentState = state as ProfileLoaded;

      final result = await updateCurrentRole(event.role);

      result.fold(
        (failure) => emit(const ProfileError('Failed to update role')),
        (_) {
          final updatedProfile = Profile(
            name: currentState.profile.name,
            email: currentState.profile.email,
            avatarUrl: currentState.profile.avatarUrl,
            children: currentState.profile.children,
            classes: currentState.profile.classes,
            notificationSettings: currentState.profile.notificationSettings,
            roles: currentState.profile.roles,
            currentRole: event.role,
          );
          emit(ProfileLoaded(updatedProfile));
        },
      );
    }
  }
}
