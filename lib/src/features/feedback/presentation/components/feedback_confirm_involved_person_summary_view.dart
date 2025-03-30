import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/components/events/domain/models/suspect_entity.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/padding/default_horizontal_padding.dart';
import 'package:booking/src/features/feedback/presentation/components/feedback_confirm_suspect_tile.dart';
import 'package:booking/src/features/feedback/presentation/components/feedback_involved_person_highlight_view.dart';

class FeedbackConfirmInvolvedPersonSummaryView extends StatelessWidget {
  const FeedbackConfirmInvolvedPersonSummaryView({
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
        FeedbackConfirmSuspectTile(
          suspect: involvedPerson,
        ),
        const SizedBox(height: 12),
        if (description != null) ...[
          DefaultHorizontalPadding(
            child: Text(
              context.loc.aboutStudent,
              style: context.typography.textmdSemibold.copyWith(
                color: context.colors.black,
              ),
            ),
          ),
          const SizedBox(height: 4),
          DefaultHorizontalPadding(
            child: Text(
              description,
              style: context.typography.textsmMedium.copyWith(
                color: context.colors.gray600,
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
        if (involvedPerson.highlights.isNotEmpty) ...[
          DefaultHorizontalPadding(
            child: Text(
              context.loc.mainPoints,
              style: context.typography.textmdSemibold.copyWith(
                color: context.colors.black,
              ),
            ),
          ),
          const SizedBox(height: 4),
          for (final highlight in involvedPerson.highlights)
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 16,
              ),
              child: FeedbackInvolvedPersonHighlightView(
                highlight: highlight,
              ),
            ),
        ],
        const SizedBox(height: 4),
        const Divider(),
      ],
    );
  }
}
