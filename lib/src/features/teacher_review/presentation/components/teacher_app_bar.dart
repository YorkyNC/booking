import 'package:flutter/material.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/buttons/switchable_icon_button.dart';

class TeacherAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TeacherAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {},
              child: Row(
                children: [
                  Text(
                    context.loc.mySubjects,
                    style: context.typography.textxlBold.copyWith(
                      color: context.colors.gray800,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    context.icons.chevron_down,
                    color: context.colors.grey500,
                    size: 24,
                  )
                ],
              ),
            ),
            SwitchableIconButton(
              icon: context.icons.ringing_bell_notification__notification_vibrate_ring_sound_alarm_alert_bell_noise,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
