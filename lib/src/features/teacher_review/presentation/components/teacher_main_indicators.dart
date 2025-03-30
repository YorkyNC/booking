import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';

class TeacherMainIndicators extends StatelessWidget {
  final String assetPath;
  final String title;
  final VoidCallback onTap;
  const TeacherMainIndicators({
    super.key,
    required this.assetPath,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: context.colors.white,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(children: [
              SvgPicture.asset(assetPath),
              const SizedBox(height: 8),
              Text(
                title,
                style: context.typography.textsmSemibold.copyWith(
                  color: context.colors.black,
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
