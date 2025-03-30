import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/shimmer/shimmer_container.dart';

class ParentScheduleShimmer extends StatelessWidget {
  const ParentScheduleShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: List.generate(
            3,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Column(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerContainer(
                        width: context.width * 0.15,
                        height: context.height * 0.022,
                      ),
                      ShimmerContainer(
                        width: context.width * 0.1,
                        height: context.height * 0.022,
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Column(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerContainer(
                        width: context.width * 0.2,
                        height: context.height * 0.022,
                      ),
                      ShimmerContainer(
                        width: context.width * 0.15,
                        height: context.height * 0.022,
                      ),
                    ],
                  ),
                  const Spacer(),
                  ShimmerContainer(
                    width: context.width * 0.12,
                    height: context.height * 0.022,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
