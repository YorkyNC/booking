import 'package:flutter_svg/svg.dart';
import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/shimmer/shimmer_container.dart';

class ClassTableShimmer extends StatelessWidget {
  const ClassTableShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: List.generate(
            5,
            (index) => Container(
                color: index % 2 == 1 ? context.colors.gray50 : null,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShimmerContainer(
                            isEight: true,
                            width: 119,
                            height: 24,
                          ),
                          SizedBox(height: 4),
                          ShimmerContainer(
                            isEight: true,
                            width: 76,
                            height: 18,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const ShimmerContainer(
                            isEight: true,
                            width: 44,
                            height: 18,
                          ),
                          const SizedBox(width: 4),
                          const ShimmerContainer(
                            isEight: true,
                            width: 44,
                            height: 18,
                          ),
                          const SizedBox(width: 4),
                          const ShimmerContainer(
                            isEight: true,
                            width: 44,
                            height: 18,
                          ),
                          SvgPicture.asset(context.assetImages.chevronRight),
                        ],
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
