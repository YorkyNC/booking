import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/components/events/domain/models/event_entity.dart';
import 'package:booking/src/core/components/users/presentation/widgets/adaptive_user_avatar.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/padding/default_horizontal_padding.dart';
import 'package:booking/src/features/feedback/presentation/components/feedback_action.dart';
import 'package:booking/src/features/feedback/presentation/components/feedback_completed_involved_person_summary_view.dart';

class FeedbackCompletedView extends StatelessWidget {
  const FeedbackCompletedView({
    super.key,
    required this.event,
  });

  final EventEntity event;

  @override
  Widget build(BuildContext context) {
    final assignee = event.assignedTo;
    final description = event.description;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (assignee != null) ...[
          DefaultHorizontalPadding(
            child: Text(
              context.loc.responsiblePerson,
              style: context.typography.textsmSemibold.copyWith(
                color: context.colors.black,
              ),
            ),
          ),
          const SizedBox(height: 8),
          DefaultHorizontalPadding(
            child: FeedbackActionTile(
              onTap: () {},
              leading: AdaptiveUserAvatar(
                imageUri: assignee.imageUrl,
              ),
              backgroundColor: context.colors.gray50,
              title: assignee.fullName,
              subtitle: "Психолог",
              //TODO: get from UserEntity
              trailingIcon: context.icons.chevron_right,
            ),
          ),
          const SizedBox(height: 8),
        ],
        DefaultHorizontalPadding(
          child: Text(
            context.loc.eventDescription,
            style: context.typography.textsmSemibold.copyWith(
              color: context.colors.black,
            ),
          ),
        ),
        const SizedBox(height: 8),
        if (description != null)
          DefaultHorizontalPadding(
            child: Text(
              description,
              style: context.typography.textsmMedium.copyWith(
                color: context.colors.gray600,
              ),
            ),
          ),
        const SizedBox(height: 8),
        const Divider(),
        const SizedBox(height: 8),
        DefaultHorizontalPadding(
          child: Text(
            context.loc.involvedPeopleCount(event.involvedPeople.length),
            style: context.typography.textsmSemibold.copyWith(
              color: context.colors.black,
            ),
          ),
        ),
        const SizedBox(height: 8),
        for (final involvedPerson in event.involvedPeople)
          FeedbackCompletedInvolvedPersonSummaryView(involvedPerson: involvedPerson),
      ],
    );
  }
}
