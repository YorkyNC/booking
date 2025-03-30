import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/shimmer/shimmer_container.dart';

class ParentAttendanceShimmer extends StatelessWidget {
  const ParentAttendanceShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          spacing: 16,
          children: [
            ShimmerContainer(
              width: context.width * 0.3,
              height: context.width * 0.3,
              isEight: true,
            ),
            Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShimmerContainer(
                  width: context.width * 0.3,
                  height: context.height * 0.03,
                ),
                const SizedBox(height: 4),
                ShimmerContainer(
                  width: context.width * 0.25,
                  height: context.height * 0.022,
                ),
                const SizedBox(height: 4),
                ShimmerContainer(
                  width: context.width * 0.15,
                  height: context.height * 0.03,
                ),
              ],
            ),
            const Spacer(),
            ShimmerContainer(
              width: context.width * 0.06,
              height: context.width * 0.06,
            ),
          ],
        ),
      ),
    );
  }
}
