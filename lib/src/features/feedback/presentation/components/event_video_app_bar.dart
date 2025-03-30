import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/components/events/domain/extensions/event_type_extension.dart';
import 'package:booking/src/core/components/events/domain/models/event_entity.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/extensions/date_time_extension.dart';
import 'package:booking/src/core/widgets/buttons/custom_icon_button.dart';

class EventVideoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EventVideoAppBar({super.key, required this.event});

  final EventEntity event;

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      left: false,
      right: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Row(
          children: [
            CustomIconButton(
              onTap: context.pop,
              icon: context.icons.chevron_left,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.createdAt.formatDateTimeFull,
                    style: context.typography.textsmMedium.copyWith(
                      color: context.colors.white,
                    ),
                  ),
                  Text(
                    event.eventType.getLocalizedText(context),
                    style: context.typography.textxlBold.copyWith(
                      color: context.colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
