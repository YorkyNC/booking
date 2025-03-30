import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/shimmer/shimmer_container.dart';

class ParentHomeButtonsShimmer extends StatelessWidget {
  const ParentHomeButtonsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: Row(
        spacing: 8,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildButtonShimmer(context),
          _buildButtonShimmer(context),
        ],
      ),
    );
  }

  Widget _buildButtonShimmer(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: context.colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShimmerContainer(
                width: context.width * 0.12,
                height: context.width * 0.12,
                isEight: true,
              ),
              const SizedBox(height: 8),
              ShimmerContainer(
                width: context.width * 0.2,
                height: context.height * 0.022,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
