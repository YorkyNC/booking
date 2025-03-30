import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/components/events/domain/models/suspect_entity.dart';
import 'package:booking/src/core/components/users/presentation/widgets/adaptive_user_avatar.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/features/feedback/presentation/components/feedback_action.dart';
import 'package:booking/src/features/feedback/presentation/components/feedback_involved_person_highlight_view.dart';
import 'package:booking/src/features/feedback/presentation/popups/feedback_involved_person_expanded_popup.dart';

class FeedbackCompletedInvolvedPersonSummaryView extends StatelessWidget {
  const FeedbackCompletedInvolvedPersonSummaryView({
    super.key,
    required this.involvedPerson,
  });

  final SuspectEntity involvedPerson;

  @override
  Widget build(BuildContext context) {
    final description = involvedPerson.description;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FeedbackActionTile(
          title: involvedPerson.user?.fullName ?? "",
          subtitle: "6Б класс",
          onTap: () {}, //TODO add push to dossier
          leading: AdaptiveUserAvatar(
            imageUri: involvedPerson.imageUrl,
          ),
          trailing: Text(context.loc.dossier),
          trailingIcon: context.icons.chevron_right,
        ),
        const SizedBox(height: 4),
        for (final highlight in involvedPerson.highlights.take(2))
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 16,
            ),
            child: FeedbackInvolvedPersonHighlightView(
              highlight: highlight,
            ),
          ),
        if (description != null || involvedPerson.highlights.length > 2)
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: OutlinedButton(
              onPressed: () => showFeedbackInvolvedPersonExpandedPopup(
                context,
                involvedPerson: involvedPerson,
              ),
              child: Text(
                context.loc.readFull,
              ),
            ),
          ),
        const SizedBox(height: 4),
        const Divider(),
      ],
    );
  }
}
