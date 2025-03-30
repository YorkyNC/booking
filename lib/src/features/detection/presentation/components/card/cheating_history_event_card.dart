import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/theme/colors.dart';
import 'package:booking/src/core/theme/typography.dart';
import 'package:booking/src/features/detection/presentation/components/card/cheating_detection_image_card.dart';

class CheatingHistoryEventCard extends StatelessWidget {
  const CheatingHistoryEventCard({
    super.key,
    required this.colors,
    required this.typography,
  });

  final AppColors colors;
  final FigmaTextStyles typography;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'История событий',
                    style: typography.textsmSemibold.copyWith(
                      color: colors.black,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: colors.warning100,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              title: Text(
                'Не определено',
                style: typography.textmdRegular.copyWith(
                  color: colors.gray500,
                ),
              ),
              trailing: Icon(
                context.icons.chevron_right,
                size: 24,
                color: colors.gray500,
              ),
            ),
            const CheatingDetectionImageCard()
          ],
        ),
      ),
    );
  }
}
