import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/popups/sheet_popup.dart';

Future<void> showFeedbackAiAnalysisExplanationPopup(BuildContext context) {
  return showSheetPopup(
    context,
    title: Text(context.loc.whatIsAiAnalysisQuestion),
    builder: (_) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            context.loc.aiAnalysisDescription,
            style: context.typography.textmdRegular.copyWith(
              color: context.colors.black,
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: context.pop,
            child: Text(context.loc.understood),
          ),
        ],
      );
    },
  );
}
