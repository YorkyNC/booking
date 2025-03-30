import 'package:flutter/material.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/shimmer/shimmer_container.dart';

class ScheduleEditingTileShimmer extends StatelessWidget {
  const ScheduleEditingTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ShimmerContainer(
            width: 67,
            height: 20,
            isEight: true,
          ),
          SizedBox(height: 4),
          ShimmerContainer(
            width: 39,
            height: 18,
            isEight: true,
          ),
          SizedBox(height: 4),
          ShimmerContainer(
            width: 49,
            height: 18,
            isEight: true,
          ),
        ],
      ),
      trailing: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ShimmerContainer(width: 20, height: 20, isEight: true),
          ShimmerContainer(width: 20, height: 20, isEight: true),
        ],
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
          ),
        ],
      ),
    );
  }
}
