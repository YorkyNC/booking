import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/buttons/switchable_icon_button.dart';

class ForgotPasswordAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ForgotPasswordAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

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
              Text(context.loc.resetPassword,
                  style: context.typography.textlgBold.copyWith(
                    color: context.colors.gray800,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
