import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/buttons/switchable_icon_button.dart';

class CheatingPlanDetectionAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CheatingPlanDetectionAppBar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(70);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  children: [
                    SwitchableIconButton(
                      onTap: () {
                        context.pop();
                      },
                      icon: context.icons.delete_1__remove_add_button_buttons_delete_cross_x_mathematics_multiply_math,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Запланировать детекцию',
                        style: context.typography.textlgBold.copyWith(
                          color: context.colors.gray800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Готово',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
