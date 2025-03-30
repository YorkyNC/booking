import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/shimmer/shimmer_container.dart';
import 'package:booking/src/features/schedule/presentation/components/shimmers/schedule_tile_shimmer.dart';

class ActiveDetectionShimmer extends StatelessWidget {
  const ActiveDetectionShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12).copyWith(top: 12),
              decoration: BoxDecoration(
                color: context.colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const ShimmerContainer(
                    width: 152,
                    height: 24,
                    isEight: true,
                  ),
                  const SizedBox(height: 4),
                  const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ShimmerContainer(
                              width: 67,
                              height: 20,
                              isEight: true,
                            ),
                            SizedBox(height: 4),
                            ShimmerContainer(
                              width: 49,
                              height: 18,
                              isEight: true,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 4),
                  Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    child: ListTile(
                      onTap: () {},
                      contentPadding: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      selected: true,
                      selectedTileColor: context.colors.gray50,
                      tileColor: Colors.white,
                      selectedColor: context.colors.black,
                      title: Column(
                        children: [
                          Text(
                            '08:00-08:45',
                            style: context.typography.displaymdSemibold.copyWith(
                              color: Colors.transparent,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Осталось 23 мин',
                            style: context.typography.textxsRegular.copyWith(color: Colors.transparent),
                          ),
                        ],
                      ),
                      trailing: Icon(
                        context.icons.chevron_right,
                        size: 24,
                        color: context.colors.gray700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerContainer(
                        width: 78,
                        height: 18,
                        isEight: true,
                      ),
                      SizedBox(height: 8),
                      ShimmerContainer(
                        width: 160,
                        height: 20,
                        isEight: true,
                      ),
                      SizedBox(height: 8),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: context.colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Expanded(
                        child: ShimmerContainer(
                          width: 150,
                          height: 24,
                          isEight: true,
                        ),
                      ),
                      Expanded(
                        child: ShimmerContainer(
                          width: 150,
                          height: 24,
                          isEight: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const ShimmerContainer(
                    width: 35,
                    height: 20,
                    isEight: true,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) => const ScheduleTileShimmer(
                      isSecondVariant: true,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
