import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/components/events/domain/models/summary_highlight_entity.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';

class FeedbackInvolvedPersonHighlightView extends StatelessWidget {
  const FeedbackInvolvedPersonHighlightView({
    super.key,
    required this.highlight,
  });

  final SummaryHighlightEntity highlight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: context.colors.gray50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            highlight.title,
            style: context.typography.textmdSemibold.copyWith(
              color: context.colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            highlight.content,
            style: context.typography.textsmMedium.copyWith(
              color: context.colors.gray600,
            ),
          ),
        ],
      ),
    );
  }
}
