import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';

class CustomAlertDialog extends StatelessWidget {
  final Color backgorundColor;
  final Color iconColor;
  final String title;
  final String subtitle;
  const CustomAlertDialog({
    super.key,
    required this.backgorundColor,
    required this.iconColor,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: context.colors.white,
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            Positioned(
              top: -4,
              right: 0,
              child: IconButton(
                onPressed: () => context.pop(),
                icon: Icon(
                  context.icons.delete_1__remove_add_button_buttons_delete_cross_x_mathematics_multiply_math,
                  // size: 24,
                  color: context.colors.black,
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: backgorundColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      context.icons.alarm_clock__time_tock_stopwatch_measure_clock_tick,
                      color: iconColor,
                      size: 60,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  title,
                  // textAlign: TextAlign.center,
                  style: context.typography.textlgSemibold.copyWith(
                    color: context.colors.black,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  subtitle,
                  style: context.typography.textmdRegular.copyWith(
                    color: context.colors.black,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          foregroundColor: context.colors.white,
                          textStyle: context.typography.textsmSemibold,
                          backgroundColor: context.colors.brand400,
                        ),
                        onPressed: () => context.pop(),
                        child: Text(
                          context.loc.cancel,
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: context.colors.black,
                          textStyle: context.typography.textsmSemibold,
                        ),
                        onPressed: () => context.pop(),
                        child: Text(
                          context.loc.yes,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
