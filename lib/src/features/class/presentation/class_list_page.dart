import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/router/router.dart';
import 'package:booking/src/features/class/presentation/bloc/class_bloc.dart';
import 'package:booking/src/features/class/presentation/bloc/class_state.dart';
import 'package:booking/src/features/class/presentation/components/app_bar/class_state.dart';
import 'package:booking/src/features/class/presentation/components/class_classes_list_tile_shimmer.dart';
import 'package:booking/src/features/class/presentation/components/class_list_tile.dart';

class ClassListPage extends StatelessWidget {
  const ClassListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClassBloc(),
      child: Scaffold(
        backgroundColor: context.colors.gray100,
        appBar: const ClassListAppBar(),
        body: BlocBuilder<ClassBloc, ClassState>(
          builder: (context, state) {
            final classes = state.classes;
            if (classes == null) {
              return const Center(
                child: ClassClassesListTileShimmer(),
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: context.colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  shrinkWrap: true,
                  itemCount: classes.length,
                  itemBuilder: (context, index) {
                    final classEntity = classes[index];
                    return ClassListTile(
                      onTap: () {
                        context.push(RoutePaths.studentsList, extra: {
                          'className': classEntity.className,
                          'studentsCount': classEntity.studentsCount,
                        });
                      },
                      className: classEntity.className,
                      studentCount: '${classEntity.studentsCount ?? 0}',
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
