import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/buttons/custom_icon_button.dart';

class PsychologistAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PsychologistAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Row(
          children: [
            Expanded(
              child: Text(
                context.loc.events,
                style: context.typography.typography4Bold.copyWith(
                  color: context.colors.gray800,
                ),
              ),
            ),
            CustomIconButton(
              icon: context.icons.ringing_bell_notification__notification_vibrate_ring_sound_alarm_alert_bell_noise,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
