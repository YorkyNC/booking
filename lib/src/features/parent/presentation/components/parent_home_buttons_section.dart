import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/router/router.dart';
import 'package:booking/src/features/parent/presentation/components/parent_home_button.dart';

class ParentHomeButtonsSection extends StatelessWidget {
  const ParentHomeButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: const BorderRadius.vertical(
        bottom: Radius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: Row(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ParentHomeButton(
              assetPath: context.assetImages.calendar,
              title: context.loc.schedule,
              onTap: () {
                context.push(RoutePaths.teacherSchedule);
              },
            ),
            ParentHomeButton(
              assetPath: context.assetImages.conflicts,
              title: context.loc.events,
              onTap: () {
                context.push(
                  RoutePaths.parentEvents,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
