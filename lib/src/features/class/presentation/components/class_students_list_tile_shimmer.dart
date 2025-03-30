import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/shimmer/shimmer_container.dart';

class ClassStudentsListTileShimmer extends StatelessWidget {
  const ClassStudentsListTileShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
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
              leading: const ShimmerContainer(
                width: 40,
                height: 40,
                isEight: true,
              ),
              title: const ShimmerContainer(
                width: 50,
                height: 24,
                isEight: true,
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const ShimmerContainer(
                    width: 77,
                    height: 20,
                    isEight: true,
                  ),
                  Icon(
                    context.icons.chevron_right,
                    size: 24,
                    color: context.colors.gray500,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
