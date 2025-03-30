import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/shimmer/shimmer_container.dart';

class ScheduleTileShimmer extends StatelessWidget {
  final bool isSecondVariant;
  const ScheduleTileShimmer({super.key, this.isSecondVariant = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: isSecondVariant ? 2.0 : 8),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: isSecondVariant ? MediaQuery.of(context).size.height * 0.6 : null,
              padding: isSecondVariant
                  ? const EdgeInsets.all(0)
                  : const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 16,
                    ),
              decoration: BoxDecoration(
                color: context.colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: isSecondVariant
                  ? SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Column(children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ShimmerContainer(
                              width: 59,
                              height: 20,
                              isEight: true,
                            ),
                            ShimmerContainer(
                              width: 75,
                              height: 20,
                              isEight: true,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const ShimmerContainer(width: double.infinity, height: 36),
                        const SizedBox(height: 10),
                        ...List.generate(
                          15,
                          (index) => _buildShimmerTile(context),
                        ),
                      ]),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const ShimmerContainer(
                              width: 138,
                              height: 24,
                              isEight: true,
                            ),
                            Icon(
                              context.icons.chevron_right,
                              color: context.colors.gray700,
                              size: 24,
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        ...List.generate(
                          5,
                          (index) => _buildShimmerTile(context),
                        ),
                      ],
                    ),
            ),
            const SizedBox(height: 8)
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerTile(BuildContext context) {
    return ListTile(
      title: const ShimmerContainer(
        width: 138,
        height: 20,
        isEight: true,
      ),
      trailing: const ShimmerContainer(
        width: 50,
        height: 18,
        isEight: true,
      ),
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const ShimmerContainer(
            width: 40,
            height: 48,
            isEight: true,
          ),
          const SizedBox(width: 8),
          Container(
            height: 40,
            width: 1,
            color: context.colors.gray300,
          )
        ],
      ),
    );
  }
}
