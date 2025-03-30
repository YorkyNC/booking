import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/buttons/switchable_icon_button.dart';
import 'package:booking/src/features/detection/presentation/components/custom_alert_dialog.dart';

class ActiveDetectionAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ActiveDetectionAppBar({super.key});

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
                        'Активная детекция',
                        style: context.typography.textlgBold.copyWith(
                          color: context.colors.gray800,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Класс 8Б',
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
                  backgroundColor: context.colors.turnOffButtonColor,
                  foregroundColor: context.colors.buttonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  shadowColor: const Color(0x0D0A0D12),
                  elevation: 2,
                ),
                onPressed: () => (BuildContext context) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomAlertDialog(
                        backgorundColor: context.colors.error50,
                        iconColor: context.colors.error500,
                        title: 'Хотите завершить детекцию?',
                        subtitle: 'Вы не сможете перезапустить ее снова',
                      );
                    },
                  );
                }(context),
                child: Text(
                  'Выключить',
                  style: context.typography.textsmSemibold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
