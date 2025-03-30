import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/components/events/domain/extensions/event_type_extension.dart';
import 'package:booking/src/core/components/events/domain/models/enums/event_type.dart';
import 'package:booking/src/core/components/events/domain/models/event_entity.dart';
import 'package:booking/src/core/components/events/presentation/widgets/conflict_status_date.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/extensions/date_time_extension.dart';
import 'package:booking/src/core/widgets/buttons/custom_icon_button.dart';
import 'package:booking/src/core/widgets/shimmer/shimmer_container.dart';

class FeedbackAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FeedbackAppBar({super.key, this.event});

  final EventEntity? event;

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    final event = this.event;
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
                  if (event != null) ...[
                    Text(
                      event.eventType.getLocalizedText(context),
                      style: context.typography.textxlBold.copyWith(
                        color: context.colors.gray800,
                      ),
                    ),
                    Text(
                      event.createdAt.formatDateTimeFull,
                      style: context.typography.textsmMedium.copyWith(
                        color: context.colors.gray500,
                      ),
                    ),
                  ] else ...const [
                    ShimmerContainer(width: 98, height: 30),
                    SizedBox(height: 4),
                    ShimmerContainer(width: 113, height: 20),
                  ],
                ],
              ),
            ),
            if (event != null && event.eventType == EventType.conflict)
              Expanded(
                child: ConflictStatusDate(
                  event: event,
                  headerStyle: context.typography.textsmRegular,
                  dateStyle: context.typography.textlgSemibold,
                ),
              )
            else if (event == null)
              const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ShimmerContainer(width: 90, height: 20),
                  SizedBox(height: 4),
                  ShimmerContainer(width: 113, height: 28),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
