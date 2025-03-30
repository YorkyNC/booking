import 'package:flutter/material.dart';
import 'package:booking/src/core/components/users/presentation/widgets/adaptive_image.dart';

class AdaptiveUserAvatar extends StatelessWidget {
  const AdaptiveUserAvatar({
    super.key,
    required this.imageUri,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.width = 40.0,
    this.height = 40.0,
    this.fit = BoxFit.cover,
  });

  final BoxFit fit;
  final double width;
  final double height;
  final BorderRadius borderRadius;
  final String imageUri;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: AdaptiveImage(
          imageUri: imageUri,
          fit: fit,
        ),
      ),
    );
  }
}
