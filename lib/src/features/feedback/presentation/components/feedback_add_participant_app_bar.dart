import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/components/events/domain/extensions/event_type_extension.dart';
import 'package:booking/src/core/components/events/domain/models/enums/event_type.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/buttons/custom_icon_button.dart';

class FeedbackAddParticipantAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FeedbackAddParticipantAppBar({super.key, required this.eventType});

  final EventType eventType;

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
                    context.loc.addParticipant,
                    style: context.typography.textxlBold.copyWith(
                      color: context.colors.gray800,
                    ),
                  ),
                  Text(
                    eventType.getLocalizedText(context),
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
