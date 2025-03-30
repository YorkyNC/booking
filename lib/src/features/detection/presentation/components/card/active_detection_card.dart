import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';

class ActiveDetectionCard extends StatelessWidget {
  const ActiveDetectionCard({
    super.key,
    this.icon,
    required this.title,
    required this.subTitle,
  });

  final IconData? icon;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        color: context.colors.gray50,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                icon != null
                    ? Icon(
                        icon,
                        size: 28,
                        color: context.colors.gray400,
                      )
                    : const SizedBox(),
                icon != null ? const SizedBox(width: 4) : const SizedBox(width: 0),
                Text(
                  title,
                  style: context.typography.textxsRegular.copyWith(
                    color: context.colors.gray500,
                  ),
                )
              ],
            ),
            const SizedBox(height: 4),
            Text(
              subTitle,
              style: context.typography.textsmMedium.copyWith(
                color: context.colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
