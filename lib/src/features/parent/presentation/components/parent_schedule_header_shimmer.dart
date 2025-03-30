import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/shimmer/shimmer_container.dart';

class ParentScheduleHeaderShimmer extends StatelessWidget {
  const ParentScheduleHeaderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      surfaceTintColor: Colors.transparent,
      pinned: true,
      backgroundColor: context.colors.gray100,
      centerTitle: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            color: context.colors.white,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(12),
            ),
          ),
        ),
      ),
      toolbarHeight: kToolbarHeight * 1.25,
      titleTextStyle: context.typography.textmdSemibold.copyWith(
        color: context.colors.black,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerContainer(
            width: context.width * 0.2,
            height: context.height * 0.025,
          ),
          const SizedBox(height: 4),
          ShimmerContainer(
            width: context.width * 0.3,
            height: context.height * 0.02,
          ),
        ],
      ),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      actions: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ShimmerContainer(
              width: context.width * 0.25,
              height: context.height * 0.02,
            ),
            const SizedBox(height: 4),
            ShimmerContainer(
              width: context.width * 0.18,
              height: context.height * 0.018,
            ),
          ],
        ),
      ],
    );
  }
}
