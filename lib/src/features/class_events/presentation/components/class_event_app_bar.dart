import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/buttons/switchable_icon_button.dart';

class ClassEventAppBar extends StatefulWidget implements PreferredSizeWidget {
  const ClassEventAppBar({super.key});

  @override
  State<ClassEventAppBar> createState() => _ClassEventAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _ClassEventAppBarState extends State<ClassEventAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    SwitchableIconButton(
                      onTap: () {
                        context.pop();
                      },
                      icon: context.icons.chevron_left,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      context.loc.classes,
                      style: context.typography.typography4Bold.copyWith(
                        color: context.colors.gray800,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
