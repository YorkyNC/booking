import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/buttons/switchable_icon_button.dart';

class ClassStudentsListAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String className;
  final int studentsCount;
  const ClassStudentsListAppBar({
    super.key,
    required this.className,
    required this.studentsCount,
  });

  @override
  State<ClassStudentsListAppBar> createState() => _ClassStudentsListAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _ClassStudentsListAppBarState extends State<ClassStudentsListAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Row(
            children: [
              SwitchableIconButton(
                onTap: () => context.pop(),
                icon: context.icons.chevron_left,
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.className,
                    style: context.typography.textlgSemibold.copyWith(
                      color: context.colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${widget.studentsCount} учеников',
                    style: context.typography.textsmRegular.copyWith(
                      color: context.colors.gray500,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
