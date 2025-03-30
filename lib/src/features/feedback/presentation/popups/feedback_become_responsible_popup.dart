import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/popups/sheet_popup.dart';

Future<void> showFeedbackBecomeResponsiblePopup(
  BuildContext context, {
  required VoidCallback? onConfirm,
}) {
  return showSheetPopup(
    context,
    builder: (_) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 50),
          Icon(
            context.icons.office_worker__office_worker_human_resources,
            size: 60,
            color: context.colors.gray500,
          ),
          const SizedBox(height: 8),
          Text(
            context.loc.responsiblePersonExplanation,
            textAlign: TextAlign.center,
            style: context.typography.textxlBold.copyWith(
              color: context.colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            context.loc.selectContinueIfYouAgree,
            textAlign: TextAlign.center,
            style: context.typography.textmdMedium.copyWith(
              color: context.colors.gray500,
            ),
          ),
          const SizedBox(height: 60),
          ElevatedButton(
            onPressed: () {
              onConfirm?.call();
              context.pop();
            },
            child: Text(context.loc.continueNext),
          ),
          OutlinedButton(
            onPressed: context.pop,
            child: Text(context.loc.cancel),
          ),
        ],
      );
    },
  );
}
