import 'package:flutter/material.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/shimmer/shimmer_container.dart';

class ClassClassesListTileShimmer extends StatelessWidget {
  const ClassClassesListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: context.colors.white,
        ),
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: 20,
          itemBuilder: (context, index) {
            return ListTile(
              title: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ShimmerContainer(
                    width: 63,
                    height: 24,
                    isEight: true,
                  ),
                  SizedBox(height: 8),
                  ShimmerContainer(
                    width: 94,
                    height: 24,
                    isEight: true,
                  ),
                ],
              ),
              trailing: Icon(
                context.icons.chevron_right,
                size: 24,
                color: context.colors.gray500,
              ),
            );
          },
        ),
      ),
    );
  }
}
