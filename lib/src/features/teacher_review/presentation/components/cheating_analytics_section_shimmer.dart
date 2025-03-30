import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/shimmer/shimmer_container.dart';

class CheatingAnalyticsSectionShimmer extends StatelessWidget {
  const CheatingAnalyticsSectionShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.white,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(12),
        ),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [ShimmerContainer(width: 130, height: 18), ShimmerContainer(width: 54, height: 28)],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: LinearProgressIndicator(
              color: context.colors.warning500,
              value: 0,
              backgroundColor: context.colors.gray100,
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }
}
