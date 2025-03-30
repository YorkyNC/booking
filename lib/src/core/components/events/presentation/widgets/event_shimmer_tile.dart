import 'package:flutter_svg/flutter_svg.dart';
import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/shimmer/shimmer_container.dart';

class ReviewEventShimmerTile extends StatelessWidget {
  const ReviewEventShimmerTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          const ShimmerContainer(
            width: 32,
            height: 32,
          ),
          const SizedBox(width: 12),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerContainer(
                width: 134,
                height: 18,
              ),
              SizedBox(height: 4),
              ShimmerContainer(
                width: 95,
                height: 24,
              ),
            ],
          ),
          const Spacer(),
          SvgPicture.asset(context.assetImages.chevronRight),
        ],
      ),
    );
  }
}
