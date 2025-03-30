// import 'package:flutter/material.dart';
// import 'package:injectable/injectable.dart';
// import 'package:jwt_decode/jwt_decode.dart';
// import 'package:booking/src/core/services/storage/storage_service_impl.dart';
// import 'package:booking/src/features/settings/domain/entities/user_token_entity.dart';

// class RoleInfo {
//   final String roleTitle;
//   final String? teacherId;
//   final List<String> childIds;
//   final List<String> courseIds;
//   final String? classId;

//   RoleInfo({
//     required this.roleTitle,
//     this.teacherId,
//     this.childIds = const [],
//     this.courseIds = const [],
//     this.classId,
//   });

//   // Helper to create a copy of the RoleInfo with modified fields
//   RoleInfo copyWith({
//     String? roleTitle,
//     String? teacherId,
//     List<String>? childIds,
//     List<String>? courseIds,
//     String? classId,
//   }) {
//     return RoleInfo(
//       roleTitle: roleTitle ?? this.roleTitle,
//       teacherId: teacherId ?? this.teacherId,
//       childIds: childIds ?? this.childIds,
//       courseIds: courseIds ?? this.courseIds,
//       classId: classId ?? this.classId,
//     );
//   }

//   // Create a unique identifier for the role
//   String get uniqueId => classId != null ? '$roleTitle-$classId' : roleTitle;
// }

// @injectable
// class RoleNotifier extends ChangeNotifier {
//   late UserTokenEntity _user;
//   final Map<String, List<RoleInfo>> _roleMap = {};
//   final StorageServiceImpl _storageService = StorageServiceImpl();

//   RoleNotifier() {
//     _initializeFromToken();
//     // Listen for token changes
//     _storageService.addListener(_onStorageChanged);
//   }

//   // Current role state
//   late String _currentRole;
//   late String _currentRoleId;
//   String? _currentClassId;

//   void _onStorageChanged() {
//     final token = _storageService.getToken();
//     if (token != null) {
//       try {
//         final newUser = UserTokenEntity.fromJson(Jwt.parseJwt(token));
//         if (newUser != _user) {
//           print('RoleNotifier _onStorageChanged - User changed'); // Debug print
//           _user = newUser;
//           _roleMap.clear();
//           _initializeRoles();
//           notifyListeners();
//         }
//       } catch (e) {
//         debugPrint('Error parsing token: $e');
//       }
//     } else {
//       _roleMap.clear();

//       _currentRole = '';
//       _currentRoleId = '';
//       _currentClassId = null;
//       notifyListeners();
//     }
//   }

//   void _initializeFromToken() {
//     final token = _storageService.getToken();
//     if (token != null) {
//       _user = UserTokenEntity.fromJson(Jwt.parseJwt(token));
//       _initializeRoles();
//     } else {
//       _currentRole = '';
//       _currentRoleId = '';
//       _currentClassId = null;
//     }
//   }

//   @override
//   void dispose() {
//     _storageService.removeListener(_onStorageChanged);
//     super.dispose();
//   }

//   // Getters
//   String get currentRole => _currentRole;
//   String get currentRoleId => _currentRoleId;
//   String? get currentClassId => _currentClassId;
//   Map<String, List<RoleInfo>> get roles => Map.unmodifiable(_roleMap);

//   // Rest of the existing methods remain the same
//   void _initializeRoles() {
//     _roleMap['teacher'] = [];
//     _roleMap['classroomTeacher'] = [];
//     _roleMap['parent'] = [];

//     for (final school in _user.permissions.schools) {
//       for (final classInfo in school.classes) {
//         for (final role in classInfo.roles) {
//           switch (role.title) {
//             case 'teacher':
//               _handleTeacherRole(role, school.teacherId);
//               break;
//             case 'classroomTeacher':
//               _handleClassroomTeacherRole(role, school.teacherId, classInfo.id);
//               break;
//             case 'parent':
//               _handleParentRole(role, school.teacherId);
//               break;
//           }
//         }
//       }
//     }

//     _initializeCurrentRole();
//   }

//   void _handleTeacherRole(dynamic role, String? teacherId) {
//     var existingRole = _roleMap['teacher']!.firstWhere(
//       (r) => r.teacherId == teacherId,
//       orElse: () {
//         var newRole = RoleInfo(
//           roleTitle: 'teacher',
//           teacherId: teacherId,
//           courseIds: [],
//         );
//         _roleMap['teacher']!.add(newRole);
//         return newRole;
//       },
//     );

//     if (role.courseId != null && !existingRole.courseIds.contains(role.courseId)) {
//       var updatedCourseIds = List<String>.from(existingRole.courseIds)..add(role.courseId);
//       var index = _roleMap['teacher']!.indexOf(existingRole);
//       _roleMap['teacher']![index] = existingRole.copyWith(courseIds: updatedCourseIds);
//     }
//   }

//   void _handleClassroomTeacherRole(dynamic role, String? teacherId, String classId) {
//     if (!_roleMap['classroomTeacher']!.any((r) => r.classId == classId)) {
//       _roleMap['classroomTeacher']!.add(RoleInfo(
//         roleTitle: 'classroomTeacher',
//         teacherId: teacherId,
//         classId: classId,
//       ));
//     }
//   }

//   void _handleParentRole(dynamic role, String? teacherId) {
//     if (role.childId != null) {
//       var existingRole = _roleMap['parent']!.firstWhere(
//         (r) => r.teacherId == teacherId,
//         orElse: () {
//           var newRole = RoleInfo(
//             roleTitle: 'parent',
//             teacherId: teacherId,
//             childIds: [],
//           );
//           _roleMap['parent']!.add(newRole);
//           return newRole;
//         },
//       );

//       if (!existingRole.childIds.contains(role.childId)) {
//         var updatedChildIds = List<String>.from(existingRole.childIds)..add(role.childId);
//         var index = _roleMap['parent']!.indexOf(existingRole);
//         _roleMap['parent']![index] = existingRole.copyWith(childIds: updatedChildIds);
//       }
//     }
//   }

//   void _initializeCurrentRole() {
//     String? firstRoleType;
//     RoleInfo? firstRoleInfo;

//     for (var entry in _roleMap.entries) {
//       if (entry.value.isNotEmpty) {
//         firstRoleType = entry.key;
//         firstRoleInfo = entry.value.first;
//         break;
//       }
//     }

//     if (firstRoleType != null && firstRoleInfo != null) {
//       _currentRole = firstRoleType;
//       switch (firstRoleType) {
//         case 'teacher':
//           _currentRoleId = firstRoleInfo.teacherId ?? '';
//           _currentClassId = null;
//           break;
//         case 'classroomTeacher':
//           _currentRoleId = firstRoleInfo.teacherId ?? '';
//           _currentClassId = firstRoleInfo.classId; // This is now correctly set
//           break;
//         case 'parent':
//           // For parent role, use the first childId as the roleId
//           _currentRoleId = firstRoleInfo.childIds.firstOrNull ?? '';
//           _currentClassId = null;
//           break;
//         default:
//           _currentRoleId = '';
//           _currentClassId = null;
//       }
//     } else {
//       _currentRole = '';
//       _currentRoleId = '';
//       _currentClassId = null;
//     }

//     _storageService.setRole(_currentRole);
//   }

//   void notify() {
//     notifyListeners();
//   }

//   void setRole(String role, String roleId, {String? classId}) {
//     print(
//         'RoleNotifier setRole - Current: $_currentRole, $_currentRoleId, $_currentClassId'); // Debug
//     print('RoleNotifier setRole - New: $role, $roleId, $classId'); // Debug

//     // Check if we need to update based on the new classId parameter first
//     bool needsUpdate = _currentRole != role ||
//         _currentRoleId != roleId ||
//         (classId != null && _currentClassId != classId);

//     if (needsUpdate) {
//       _currentRole = role;
//       _currentRoleId = roleId;

//       switch (role) {
//         case 'classroomTeacher':
//           // First try to find the RoleInfo matching both teacherId and classId
//           final roleInfo = _roleMap[role]?.firstWhere(
//             (r) => r.teacherId == roleId && r.classId == classId,
//             orElse: () => RoleInfo(roleTitle: role, teacherId: roleId, classId: classId),
//           );
//           _currentClassId = classId ?? roleInfo?.classId;
//           break;
//         case 'teacher':
//         case 'parent':
//           // For parent role, roleId should be the childId
//           final roleInfo = _roleMap[role]?.firstWhere(
//             (r) => r.childIds.contains(roleId),
//             orElse: () => RoleInfo(roleTitle: role),
//           );
//           _currentRole = role;
//           _currentRoleId = roleId; // This is childId
//           _currentClassId = null;
//           break;
//         default:
//           _currentClassId = null;
//       }

//       _storageService.setRole(role);
//       print(
//           'RoleNotifier setRole - Updated state: $_currentRole, $_currentRoleId, $_currentClassId'); // Debug
//       notifyListeners();
//     }
//   }

//   // Helper methods
//   bool hasRole(String roleTitle) =>
//       _roleMap.containsKey(roleTitle) && _roleMap[roleTitle]!.isNotEmpty;

//   List<RoleInfo> getRoleInfos(String roleTitle) => _roleMap[roleTitle] ?? [];

//   List<String> getChildIds() => _roleMap['parent']?.expand((r) => r.childIds).toList() ?? [];

//   List<String> getCourseIds() => _roleMap['teacher']?.expand((r) => r.courseIds).toList() ?? [];

//   List<String> getClassIds() => _roleMap['classroomTeacher']?.map((r) => r.classId!).toList() ?? [];

//   String? getCurrentSchoolId() {
//     if (_roleMap.isEmpty) return null;

//     return _user.permissions.schools.first.id;
//   }

//   // Get specific role info
//   RoleInfo? getCurrentRoleInfo() {
//     if (!_roleMap.containsKey(_currentRole)) return null;

//     return _roleMap[_currentRole]!.firstWhere(
//       (roleInfo) {
//         switch (_currentRole) {
//           case 'classroomTeacher':
//             return roleInfo.teacherId == _currentRoleId && roleInfo.classId == _currentClassId;
//           case 'teacher':
//             return roleInfo.teacherId == _currentRoleId;
//           case 'parent':
//             return roleInfo.childIds.contains(_currentRoleId);
//           default:
//             return false;
//         }
//       },
//       orElse: () => RoleInfo(roleTitle: _currentRole),
//     );
//   }
// }
