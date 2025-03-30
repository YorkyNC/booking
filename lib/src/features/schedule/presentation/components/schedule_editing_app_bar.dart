import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/buttons/switchable_icon_button.dart';

class ScheduleEditingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ScheduleEditingAppBar({super.key});
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  SwitchableIconButton(
                    onTap: () {
                      context.pop();
                    },
                    icon: context.icons.chevron_left,
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.loc.editing,
                        style: context.typography.textlgBold.copyWith(
                          color: context.colors.gray800,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '18.10 Пятница',
                        style: context.typography.textsmRegular.copyWith(
                          color: context.colors.gray500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.colors.brand400,
                  foregroundColor: context.colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  context.loc.save,
                  style: context.typography.textsmSemibold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
