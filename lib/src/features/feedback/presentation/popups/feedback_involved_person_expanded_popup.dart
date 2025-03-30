import 'package:flutter/material.dart';
import 'package:booking/src/core/components/events/domain/models/suspect_entity.dart';
import 'package:booking/src/core/components/users/presentation/widgets/adaptive_user_avatar.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/padding/default_horizontal_padding.dart';
import 'package:booking/src/core/widgets/popups/sheet_popup.dart';
import 'package:booking/src/features/feedback/presentation/components/feedback_action.dart';
import 'package:booking/src/features/feedback/presentation/components/feedback_involved_person_highlight_view.dart';

Future<void> showFeedbackInvolvedPersonExpandedPopup(
  BuildContext context, {
  required SuspectEntity involvedPerson,
}) {
  final description = involvedPerson.description;
  return showSheetPopup(
    context,
    title: Text(context.loc.feedback),
    padding: EdgeInsets.zero,
    builder: (_) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FeedbackActionTile(
            title: involvedPerson.user?.fullName ?? "",
            subtitle: "6Б класс",
            onTap: () {},
            leading: AdaptiveUserAvatar(
              imageUri: involvedPerson.imageUrl,
            ),
            trailing: Text(context.loc.dossier),
            trailingIcon: context.icons.chevron_right,
          ),
          const SizedBox(height: 4),
          if (description != null)
            DefaultHorizontalPadding(
              child: Text(
                description,
                style: context.typography.textmdMedium.copyWith(
                  color: context.colors.gray600,
                ),
              ),
            ),
          const SizedBox(height: 4),
          for (final highlight in involvedPerson.highlights)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              child: FeedbackInvolvedPersonHighlightView(
                highlight: highlight,
              ),
            ),
        ],
      );
    },
  );
}
