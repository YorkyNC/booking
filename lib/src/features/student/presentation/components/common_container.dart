import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonContainer extends StatelessWidget {
  final String path;
  final Color color;
  final String title;

  const CommonContainer({
    super.key,
    required this.path,
    required this.color,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: color.withValues(alpha: 0.25),
      ),
      child: Row(
        children: [
          SvgPicture.asset(path),
          const SizedBox(width: 8),
          Text(
            title,
            style: context.typography.textmdSemibold.copyWith(
              color: context.colors.black,
            ),
          )
        ],
      ),
    );
  }
}
