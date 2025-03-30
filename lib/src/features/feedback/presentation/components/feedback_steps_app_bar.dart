import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/components/events/domain/extensions/event_type_extension.dart';
import 'package:booking/src/core/components/events/domain/models/event_entity.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/buttons/custom_icon_button.dart';

class FeedbackStepsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FeedbackStepsAppBar({
    super.key,
    required this.event,
    required this.subtitle,
  });

  final EventEntity event;
  final String subtitle;

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                    context.loc.feedbackEventType(
                      event.eventType.getLocalizedText(
                        context,
                      ),
                    ),
                    style: context.typography.textxlBold.copyWith(
                      color: context.colors.gray800,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: context.typography.textsmMedium.copyWith(
                      color: context.colors.gray500,
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
