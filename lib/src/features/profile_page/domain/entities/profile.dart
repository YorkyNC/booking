class Profile {
  final String name;
  final String email;
  final String? avatarUrl;
  final List<Child> children;
  final List<ClassInfo> classes;
  final NotificationSettings notificationSettings;
  final List<Role> roles;
  final Role currentRole;

  const Profile({
    required this.name,
    required this.email,
    this.avatarUrl,
    required this.children,
    required this.classes,
    required this.notificationSettings,
    required this.roles,
    required this.currentRole,
  });
}

class Child {
  final String name;
  final String email;
  final String? avatarUrl;

  const Child({
    required this.name,
    required this.email,
    this.avatarUrl,
  });
}

class ClassInfo {
  final String name;
  final String role;

  const ClassInfo({
    required this.name,
    required this.role,
  });
}

class NotificationSettings {
  final bool notifications;
  final bool attendanceNotifications;
  final bool eventsNotifications;

  const NotificationSettings({
    required this.notifications,
    required this.attendanceNotifications,
    required this.eventsNotifications,
  });
}

class Role {
  final String name;
  final String description;

  const Role({
    required this.name,
    required this.description,
  });

  bool get isParent => name == 'Родитель';
  bool get isTeacher => name == 'Учитель';
  bool get isPsychologist => name == 'Психолог';
}
