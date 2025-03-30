import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/buttons/switchable_icon_button.dart';
import 'package:booking/src/features/camera/presentation/components/custom_fliter_chip.dart';

class ScheduleCalendarAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isCalendarView;
  final Function(bool) onViewChanged;

  const ScheduleCalendarAppBar({
    super.key,
    required this.isCalendarView,
    required this.onViewChanged,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
          child: Row(
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomFliterChip(
                          context: context,
                          label: 'Месяц',
                          isSelected: isCalendarView,
                          onTap: () {
                            if (!isCalendarView) {
                              onViewChanged(true);
                            }
                          },
                        ),
                        CustomFliterChip(
                          context: context,
                          label: 'Четверть',
                          isSelected: !isCalendarView,
                          onTap: () {
                            if (isCalendarView) {
                              onViewChanged(false);
                            }
                          },
                        ),
                      ],
                    )
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
