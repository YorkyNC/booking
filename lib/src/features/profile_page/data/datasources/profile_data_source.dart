import '../../domain/entities/profile.dart';
import '../models/profile_model.dart';

abstract class ProfileDataSource {
  Future<ProfileModel> getProfile();
  Future<void> updateNotificationSettings(NotificationSettings settings);
  Future<void> updateCurrentRole(Role role);
}

class ProfileDataSourceImpl implements ProfileDataSource {
  @override
  Future<ProfileModel> getProfile() async {
    // In a real app, this would fetch data from an API or local storage
    // For now, we'll return mock data
    return const ProfileModel(
      name: 'Сауле Саматова',
      email: 'saule.samatova@gmail.com',
      children: [
        ChildModel(
          name: 'Кадырбек С.',
          email: 'kadyrbek.samatov@gmail.com',
          avatarUrl: null,
        ),
      ],
      classes: [
        ClassInfoModel(
          name: '9 "А" класс',
          role: 'Классный руководитель',
        ),
        ClassInfoModel(
          name: '8 "Б" класс',
          role: 'Учитель математики',
        ),
        ClassInfoModel(
          name: '7 "В" класс',
          role: 'Учитель математики',
        ),
        ClassInfoModel(
          name: '8 "В" класс',
          role: 'Учитель математики',
        ),
        ClassInfoModel(
          name: '7 "A" класс',
          role: 'Учитель математики',
        ),
      ],
      notificationSettings: NotificationSettingsModel(
        notifications: true,
        attendanceNotifications: true,
        eventsNotifications: false,
      ),
      roles: [
        RoleModel(
          name: 'Родитель',
          description: '1 ребенок',
        ),
        RoleModel(
          name: 'Учитель',
          description: 'Классный руководитель и предметник',
        ),
        RoleModel(
          name: 'Психолог',
          description: '',
        ),
      ],
      currentRole: RoleModel(
        name: 'Родитель',
        description: '1 ребенок',
      ),
    );
  }

  @override
  Future<void> updateNotificationSettings(NotificationSettings settings) async {
    // In a real app, this would update settings via an API or local storage
    // For now, we'll just simulate a successful update
    await Future.delayed(const Duration(milliseconds: 300));
    return;
  }

  @override
  Future<void> updateCurrentRole(Role role) async {
    // In a real app, this would update the current role via an API or local storage
    // For now, we'll just simulate a successful update
    await Future.delayed(const Duration(milliseconds: 300));
    return;
  }
}
