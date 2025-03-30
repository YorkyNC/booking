import 'package:flutter_svg/flutter_svg.dart';
import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/shimmer/shimmer_nullable_wrapper.dart';

class ReviewAnalyticsCategoryTile extends StatelessWidget {
  const ReviewAnalyticsCategoryTile({
    super.key,
    required this.buttonText,
    required this.assetPath,
    required this.title,
    this.text,
    this.onTap,
  });

  final VoidCallback? onTap;
  final String buttonText;
  final String assetPath;
  final String title;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(assetPath),
                    const SizedBox(width: 4),
                    Text(
                      title,
                      style: context.typography.typography1Regular.copyWith(
                        color: context.colors.gray500,
                      ),
                    ),
                  ],
                ),
                ShimmerNullableWrapper(
                  height: 24,
                  width: 120,
                  value: text,
                  builder: (ctx, text) => Text(
                    text,
                    style: context.typography.typography2Medium.copyWith(
                      color: context.colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  buttonText,
                  style: context.typography.typography1Medium.copyWith(
                    color: context.colors.gray500,
                  ),
                ),
                SvgPicture.asset(context.assetImages.chevronRight),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
