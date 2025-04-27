// import 'package:booking/src/app/imports.dart';
// import 'package:booking/src/core/extensions/build_context_extension.dart';
// import 'package:booking/src/core/router/router.dart';
// import 'package:booking/src/features/class/presentation/components/app_bar/class_students_list_app_bar.dart';
// import 'package:booking/src/features/class/presentation/components/class_students_list_tile_shimmer.dart';
// import 'package:booking/src/features/student/presentation/bloc/stat_bloc.dart';
// import 'package:booking/src/features/student/presentation/bloc/stat_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ClassStudentsListPage extends StatelessWidget {
//   final String className;
//   final int studentsCount;
//   const ClassStudentsListPage({super.key, required this.className, required this.studentsCount});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: context.colors.gray100,
//       appBar: ClassStudentsListAppBar(
//         className: className,
//         studentsCount: studentsCount,
//       ),
//       body: BlocProvider(
//         create: (context) => StudentBloc(),
//         child: BlocBuilder<StudentBloc, StudentState>(
//           builder: (context, state) {
//             final students = state.students;
//             if (students == null) {
//               return const ClassStudentsListTileShimmer();
//             }

//             return Padding(
//               padding: const EdgeInsets.symmetric(vertical: 8.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   color: context.colors.white,
//                 ),
//                 padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                 child: ListView.separated(
//                   physics: const ClampingScrollPhysics(),
//                   itemCount: students.length,
//                   separatorBuilder: (context, index) => const Divider(),
//                   itemBuilder: (context, index) {
//                     final student = students[index];
//                     return ListTile(
//                       onTap: () => context.push(
//                         RoutePaths.studentDossier,
//                         extra: {
//                           'firstName': student.firstName,
//                           'secondName': student.secondName,
//                         },
//                       ),
//                       contentPadding: const EdgeInsets.all(0),
//                       leading: Container(
//                         width: 45,
//                         padding: const EdgeInsets.symmetric(vertical: 8),
//                         decoration: BoxDecoration(
//                           color: context.colors.avatarLightPurple,
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         child: Text(
//                           '${student.firstName[0]}${student.secondName[0]}',
//                           style: context.typography.textmdMedium.copyWith(
//                             color: context.colors.avatarPurple,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                       title: Text(
//                         '${student.firstName} ${student.secondName[0]}.',
//                         style: context.typography.textmdMedium.copyWith(
//                           color: context.colors.black,
//                         ),
//                       ),
//                       trailing: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Text(
//                             '${student.eventCount} ${context.loc.event}',
//                             style: context.typography.textsmMedium.copyWith(
//                               color: context.colors.gray500,
//                             ),
//                           ),
//                           const SizedBox(width: 4),
//                           Icon(
//                             context.icons.chevron_right,
//                             size: 24,
//                             color: context.colors.gray500,
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
