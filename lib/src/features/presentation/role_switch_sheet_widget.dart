// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:provider/provider.dart';
// import 'package:shimmer/shimmer.dart';

// import '../../core/services/auth/entities/user_entity.dart';

// class RoleSwitchSheetWidget extends StatefulWidget {
//   const RoleSwitchSheetWidget({
//     super.key,
//     required this.user,
//   });

//   final UserEntity user;
//   static final Map<String, StudentState> _studentStateCache = {};
//   static final Map<String, ClassState> _classStateCache = {};
//   static void clearAllCaches() {
//     _studentStateCache.clear();
//     _classStateCache.clear();
//   }

//   static void clearStudentCache([String? studentId]) {
//     if (studentId != null) {
//       _studentStateCache.remove(studentId);
//     } else {
//       _studentStateCache.clear();
//     }
//   }

//   static void clearClassCache([String? classId]) {
//     if (classId != null) {
//       _classStateCache.remove(classId);
//     } else {
//       _classStateCache.clear();
//     }
//   }

//   @override
//   State<RoleSwitchSheetWidget> createState() => _RoleSwitchSheetWidgetState();
// }

// class _RoleSwitchSheetWidgetState extends State<RoleSwitchSheetWidget> {
//   late final SettingsBloc _settingsBloc;
//   late String _selectedRole;
//   late String _selectedRoleId;
//   late final RoleNotifier _roleNotifier;
//   final StorageServiceImpl _storageService = StorageServiceImpl();

//   static const double _kPadding = 16.0;
//   static const double _kSpacing = 8.0;

//   @override
//   void initState() {
//     super.initState();
//     _roleNotifier = context.read<RoleNotifier>();
//     _selectedRole = _roleNotifier.currentRole;
//     _selectedRoleId = _roleNotifier.currentRoleId;
//     _settingsBloc = getIt<SettingsBloc>();
//     _settingsBloc.add(const SettingsEvent.retrieve());
//   }

//   void _handleRoleSelection(String role, String roleId, {String? classId}) {
//     setState(() {
//       _selectedRole = role;
//       _selectedRoleId = roleId;
//     });
//     _storageService.setRole(role);
//     _roleNotifier.setRole(role, roleId, classId: classId);
//     context.pop();
//   }

//   String _getRoleSubtitle(String roleTitle) {
//     switch (roleTitle) {
//       case 'teacher':
//         return context.loc.teacher;
//       case 'classroomTeacher':
//         return context.loc.classroomTeacher;
//       default:
//         return roleTitle;
//     }
//   }

//   bool _isRoleSelected(String role, String roleId, {String? classId}) {
//     if (role == 'classroomTeacher') {
//       return _selectedRole == role && _selectedRoleId == roleId && _roleNotifier.currentClassId == classId;
//     }
//     return _selectedRole == role && _selectedRoleId == roleId;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BaseBlocWidget<SettingsBloc, SettingsEvent, SettingsState>(
//       bloc: _settingsBloc,
//       starterEvent: const SettingsEvent.retrieve(),
//       builder: (context, state, bloc) {
//         return state.maybeWhen(
//           orElse: () => const Center(child: CircularProgressIndicator()),
//           done: (_) => Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: _kPadding,
//                   // vertical: 16,
//                 ),
//                 child: _buildHeader(),
//               ),
//               Flexible(
//                 child: SingleChildScrollView(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: _kPadding),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         if (_roleNotifier.hasRole('teacher'))
//                           _buildTeacherSection(
//                             title: '${context.loc.teacher}:',
//                             roleInfos: _roleNotifier.getRoleInfos('teacher'),
//                           ),
//                         if (_roleNotifier.hasRole('classroomTeacher'))
//                           _buildClassroomTeacherSection(
//                             title: '${context.loc.classroomTeacher}:',
//                             roleInfos: _roleNotifier.getRoleInfos('classroomTeacher'),
//                           ),
//                         if (_roleNotifier.hasRole('parent'))
//                           _buildParentSection(
//                             title: '${context.loc.parent}:',
//                             roleInfos: _roleNotifier.getRoleInfos('parent'),
//                           ),
//                         // const SizedBox(height: _kPadding * 3),
//                         const SizedBox(height: _kPadding),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildHeader() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         UserProfileWidget(user: widget.user),
//         IconButton(
//           onPressed: () {
//             context.push(RoutePaths.profile);
//             Navigator.pop(context);
//           },
//           icon: const Icon(
//             AppIcons.settings,
//             size: 24,
//             color: context.colors.gray500,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildTeacherSection({
//     required String title,
//     required List<RoleInfo> roleInfos,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: const FigmaTextStyles().typography1Regular.copyWith(
//                 color: context.colors.gray600,
//               ),
//         ),
//         const SizedBox(height: _kSpacing),
//         _buildRoleContainer(
//           role: 'teacher',
//           roleId: roleInfos.first.teacherId!,
//           child: _buildTeacherInfo(roleInfos.first),
//         ),
//       ],
//     );
//   }

//   Widget _buildClassroomTeacherSection({
//     required String title,
//     required List<RoleInfo> roleInfos,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: const FigmaTextStyles().typography1Regular.copyWith(
//                 color: context.colors.gray600,
//               ),
//         ),
//         const SizedBox(height: _kSpacing),
//         ...roleInfos.map((roleInfo) => _buildRoleContainer(
//               role: 'classroomTeacher',
//               roleId: roleInfo.teacherId!,
//               classId: roleInfo.classId,
//               child: _buildClassroomTeacherInfo(roleInfo),
//             )),
//       ],
//     );
//   }

//   Widget _buildParentSection({
//     required String title,
//     required List<RoleInfo> roleInfos,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: const FigmaTextStyles().typography1Regular.copyWith(
//                 color: context.colors.gray600,
//               ),
//         ),
//         const SizedBox(height: _kSpacing),
//         ...roleInfos.expand((roleInfo) => roleInfo.childIds.map((childId) => _buildRoleContainer(
//               role: 'parent',
//               roleId: childId,
//               child: _buildParentInfo(childId, roleNotifier.getCurrentSchoolId()!),
//             ))),
//       ],
//     );
//   }

//   Widget _buildRoleContainer({
//     required String role,
//     required String roleId,
//     String? classId,
//     required Widget child,
//   }) {
//     final bool isSelected = _isRoleSelected(role, roleId, classId: classId);

//     return Padding(
//       padding: const EdgeInsets.only(bottom: _kSpacing),
//       child: InkWell(
//         splashColor: Colors.transparent,
//         highlightColor: Colors.transparent,
//         onTap: () => _handleRoleSelection(role, roleId, classId: classId),
//         child: Container(
//           padding: const EdgeInsets.symmetric(
//             vertical: 12,
//             horizontal: _kPadding,
//           ),
//           decoration: BoxDecoration(
//             color: isSelected ? Appcolors.gray100 : Colors.white,
//             borderRadius: BorderRadius.circular(_kSpacing),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(child: child),
//               if (isSelected)
//                 const Icon(
//                   AppIcons.check,
//                   color: context.colors.blue500,
//                   size: 20,
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildClassInfoFromState(ClassState state) {
//     return state.maybeWhen(
//       orElse: () => Shimmer(
//         gradient: LinearGradient(
//           colors: [Colors.white, colors.gray.shade300],
//         ),
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(4),
//           ),
//           child: Text(
//             context.loc.loadingClass,
//             style: const FigmaTextStyles().typography2Regular.copyWith(
//                   color: Colors.transparent,
//                 ),
//           ),
//         ),
//       ),
//       loaded: (viewModel) {
//         return Text(
//           '${viewModel.classEntity!.grade}${viewModel.classEntity!.name}',
//           style: const FigmaTextStyles().typography1Regular.copyWith(
//                 color: context.colors.gray600,
//               ),
//         );
//       },
//     );
//   }

//   Widget _buildParentInfoFromState(StudentState state) {
//     return state.maybeWhen(
//       orElse: () => _buildParentInfoSkeleton(),
//       loaded: (viewModel) {
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               viewModel.student?.fullName ?? context.loc.unknownStudent,
//               style: const FigmaTextStyles().typography2Regular.copyWith(
//                     color: context.colors.black,
//                   ),
//             ),
//             const SizedBox(height: 4),
//             _buildClassInfo(viewModel.student!.classId!, schoolId),
//           ],
//         );
//       },
//     );
//   }

//   Widget _buildParentInfoSkeleton() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Shimmer(
//           gradient: LinearGradient(
//             colors: [Colors.white, colors.gray.shade300],
//           ),
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(4),
//             ),
//             child: Text(
//               context.loc.loading,
//               style: const FigmaTextStyles().typography1Regular.copyWith(
//                     color: Colors.transparent,
//                   ),
//             ),
//           ),
//         ),
//         const SizedBox(height: 4),
//         Shimmer(
//           gradient: LinearGradient(
//             colors: [Colors.white, colors.gray.shade300],
//           ),
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(4),
//             ),
//             child: Text(
//               context.loc.classs,
//               style: const FigmaTextStyles().typography2Regular.copyWith(
//                     color: Colors.transparent,
//                   ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildClassInfo(String classId, String schoolId) {
//     // Check cache first
//     if (RoleSwitchSheetWidget._classStateCache.containsKey(classId)) {
//       return _buildClassInfoFromState(RoleSwitchSheetWidget._classStateCache[classId]!);
//     }

//     return BaseBlocWidget<ClassBloc, ClassEvent, ClassState>(
//       bloc: getIt<ClassBloc>(),
//       starterEvent: ClassEvent.getClass(
//         GetClassRequest(
//           schoolId: schoolId,
//           classId: classId,
//         ),
//       ),
//       builder: (context, state, bloc) {
//         state.maybeWhen(
//           loaded: (viewModel) {
//             RoleSwitchSheetWidget._classStateCache[classId] = state;
//           },
//           orElse: () {},
//         );
//         return _buildClassInfoFromState(state);
//       },
//     );
//   }

//   Widget _buildTeacherInfo(RoleInfo roleInfo) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           _getRoleSubtitle('teacher'),
//           style: const FigmaTextStyles().typography1Regular.copyWith(
//                 color: context.colors.black,
//               ),
//         ),
//         Text(
//           '${roleInfo.courseIds.length} courses',
//           style: const FigmaTextStyles().typography1Regular.copyWith(
//                 color: context.colors.gray600,
//               ),
//         ),
//       ],
//     );
//   }

//   Widget _buildClassroomTeacherInfoFromState(ClassState state) {
//     return state.maybeWhen(
//       loaded: (viewModel) {
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               _getRoleSubtitle('classroomTeacher'),
//               style: const FigmaTextStyles().typography2Regular.copyWith(
//                     color: context.colors.black,
//                   ),
//             ),
//             Text(
//               'Class ${viewModel.classEntity!.grade}${viewModel.classEntity!.name}',
//               style: const FigmaTextStyles().typography1Regular.copyWith(
//                     color: context.colors.gray600,
//                   ),
//             ),
//           ],
//         );
//       },
//       orElse: () => Shimmer(
//         gradient: LinearGradient(
//           colors: [Colors.white, colors.gray.shade300],
//         ),
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(4),
//           ),
//           child: Text(
//             'Loading...',
//             style: const FigmaTextStyles().typography2Regular.copyWith(
//                   color: Colors.transparent,
//                 ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildClassroomTeacherInfo(RoleInfo roleInfo) {
//     // Check cache first
//     if (RoleSwitchSheetWidget._classStateCache.containsKey(roleInfo.classId)) {
//       return _buildClassroomTeacherInfoFromState(
//         RoleSwitchSheetWidget._classStateCache[roleInfo.classId]!,
//       );
//     }

//     return BaseBlocWidget<ClassBloc, ClassEvent, ClassState>(
//       bloc: getIt<ClassBloc>(),
//       starterEvent: ClassEvent.getClass(
//         GetClassRequest(
//           schoolId: roleNotifier.getCurrentSchoolId()!,
//           classId: roleInfo.classId!,
//         ),
//       ),
//       builder: (context, state, bloc) {
//         state.maybeWhen(
//           loaded: (viewModel) {
//             RoleSwitchSheetWidget._classStateCache[roleInfo.classId!] = state;
//           },
//           orElse: () {},
//         );
//         return _buildClassroomTeacherInfoFromState(state);
//       },
//     );
//   }

//   Widget _buildParentInfo(String childId, String schoolId) {
//     if (RoleSwitchSheetWidget._studentStateCache.containsKey(childId)) {
//       return _buildParentInfoFromState(RoleSwitchSheetWidget._studentStateCache[childId]!);
//     }

//     return BaseBlocWidget<StudentBloc, StudentEvent, StudentState>(
//       bloc: getIt<StudentBloc>(),
//       starterEvent: StudentEvent.getStudentById(
//         GetStudentByIdRequest(
//           schoolId: schoolId,
//           studentId: childId,
//         ),
//       ),
//       builder: (context, state, bloc) {
//         state.maybeWhen(
//           loaded: (viewModel) {
//             RoleSwitchSheetWidget._studentStateCache[childId] = state;
//           },
//           orElse: () {},
//         );
//         return _buildParentInfoFromState(state);
//       },
//     );
//   }
// }
