import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/router/router.dart';
import 'package:booking/src/core/widgets/buttons/switchable_icon_button.dart';

class TeacherScheduleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TeacherScheduleAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colors.white,
      child: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
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
                      context.loc.scheduleOfSubjects,
                      style: context.typography.textlgBold.copyWith(
                        color: context.colors.gray800,
                      ),
                    ),
                  ],
                ),
              ),
              SwitchableIconButton(
                onTap: () {
                  context.push(RoutePaths.scheduleCalendar);
                },
                icon: context.icons.blank_calendar__blank_calendar_date_day_month_empty,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
