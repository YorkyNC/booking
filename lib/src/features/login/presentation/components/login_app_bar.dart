import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/buttons/switchable_icon_button.dart';

class LoginAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const LoginAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
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
                title,
                style: context.typography.textlgBold.copyWith(
                  color: context.colors.gray800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
