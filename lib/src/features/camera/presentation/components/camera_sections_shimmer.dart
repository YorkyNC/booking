import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/shimmer/shimmer_container.dart';

class CameraSectionsShimmer extends StatelessWidget {
  const CameraSectionsShimmer({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: context.colors.white,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ShimmerContainer(width: 117, height: 32),
                  ShimmerContainer(width: 117, height: 32),
                ],
              ),
              SizedBox(height: 8),
              ShimmerContainer(width: double.infinity, height: 32),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: context.colors.white,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  // Camera header row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShimmerContainer(width: 134, height: 16),
                          SizedBox(height: 4),
                          ShimmerContainer(width: 96, height: 14),
                        ],
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: context.colors.gray500,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),

                  // Camera details row
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        const ShimmerContainer(width: 32, height: 32),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ShimmerContainer(width: 134, height: 18),
                              SizedBox(height: 4),
                              ShimmerContainer(width: 95, height: 24),
                            ],
                          ),
                        ),
                        SvgPicture.asset(
                          context.assetImages.chevronRight,
                          color: context.colors.gray500,
                        ),
                      ],
                    ),
                  ),

                  Divider(
                    thickness: 0.5,
                    height: 1,
                    color: context.colors.gray100,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
