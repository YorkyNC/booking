import 'package:flutter/material.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/popups/sheet_popup.dart';
import 'package:booking/src/features/feedback/presentation/components/feedback_action.dart';

Future<void> showFeedbackRedirectPopup(BuildContext context) {
  return showSheetPopup(
    context,
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.loc.redirectTo),
        const SizedBox(
          height: 4,
        ),
        Text(
          context.loc.selectReceiver,
          style: context.typography.textxsMedium.copyWith(
            color: context.colors.gray500,
          ),
        ),
      ],
    ),
    builder: (_) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            context.loc.selectReceiverSubtitle,
            style: context.typography.textmdRegular.copyWith(
              color: context.colors.black,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          FeedbackActionTile(
            onTap: () {},
            leading: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: context.colors.gray200,
              ),
              padding: const EdgeInsets.all(8),
              child: Icon(
                context.icons.backpack__bag_backpack_school_baggage_cloth_clothing_accessories,
                color: context.colors.gray500,
              ),
            ),
            trailingIcon: context.icons.mail_send_reply_all__email_message_reply_all_actions_action_arrow,
            backgroundColor: context.colors.gray50,
            title: context.loc.toClassTeacher,
            subtitle: context.loc.throughAdministration,
          ),
        ],
      );
    },
  );
}
