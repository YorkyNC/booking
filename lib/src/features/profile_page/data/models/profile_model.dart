import '../../domain/entities/profile.dart';

class ProfileModel extends Profile {
  const ProfileModel({
    required String name,
    required String email,
    String? avatarUrl,
    required List<ChildModel> children,
    required List<ClassInfoModel> classes,
    required NotificationSettingsModel notificationSettings,
    required List<RoleModel> roles,
    required RoleModel currentRole,
  }) : super(
          name: name,
          email: email,
          avatarUrl: avatarUrl,
          children: children,
          classes: classes,
          notificationSettings: notificationSettings,
          roles: roles,
          currentRole: currentRole,
        );

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name'],
      email: json['email'],
      avatarUrl: json['avatarUrl'],
      children: (json['children'] as List)
          .map((child) => ChildModel.fromJson(child))
          .toList(),
      classes: (json['classes'] as List)
          .map((classInfo) => ClassInfoModel.fromJson(classInfo))
          .toList(),
      notificationSettings:
          NotificationSettingsModel.fromJson(json['notificationSettings']),
      roles: (json['roles'] as List)
          .map((role) => RoleModel.fromJson(role))
          .toList(),
      currentRole: RoleModel.fromJson(json['currentRole']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'avatarUrl': avatarUrl,
      'children': (children as List<ChildModel>)
          .map((child) => child.toJson())
          .toList(),
      'classes': (classes as List<ClassInfoModel>)
          .map((classInfo) => classInfo.toJson())
          .toList(),
      'notificationSettings':
          (notificationSettings as NotificationSettingsModel).toJson(),
      'roles': (roles as List<RoleModel>).map((role) => role.toJson()).toList(),
      'currentRole': (currentRole as RoleModel).toJson(),
    };
  }
}

class ChildModel extends Child {
  const ChildModel({
    required String name,
    required String email,
    String? avatarUrl,
  }) : super(
          name: name,
          email: email,
          avatarUrl: avatarUrl,
        );

  factory ChildModel.fromJson(Map<String, dynamic> json) {
    return ChildModel(
      name: json['name'],
      email: json['email'],
      avatarUrl: json['avatarUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'avatarUrl': avatarUrl,
    };
  }
}

class ClassInfoModel extends ClassInfo {
  const ClassInfoModel({
    required String name,
    required String role,
  }) : super(
          name: name,
          role: role,
        );

  factory ClassInfoModel.fromJson(Map<String, dynamic> json) {
    return ClassInfoModel(
      name: json['name'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'role': role,
    };
  }
}

class NotificationSettingsModel extends NotificationSettings {
  const NotificationSettingsModel({
    required bool notifications,
    required bool attendanceNotifications,
    required bool eventsNotifications,
  }) : super(
          notifications: notifications,
          attendanceNotifications: attendanceNotifications,
          eventsNotifications: eventsNotifications,
        );

  factory NotificationSettingsModel.fromJson(Map<String, dynamic> json) {
    return NotificationSettingsModel(
      notifications: json['notifications'],
      attendanceNotifications: json['attendanceNotifications'],
      eventsNotifications: json['eventsNotifications'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'notifications': notifications,
      'attendanceNotifications': attendanceNotifications,
      'eventsNotifications': eventsNotifications,
    };
  }
}

class RoleModel extends Role {
  const RoleModel({
    required String name,
    required String description,
  }) : super(
          name: name,
          description: description,
        );

  factory RoleModel.fromJson(Map<String, dynamic> json) {
    return RoleModel(
      name: json['name'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
    };
  }
}
