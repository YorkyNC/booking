import 'package:flutter/material.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';

import '../../domain/entities/profile.dart';

class ClassItem extends StatelessWidget {
  final ClassInfo classInfo;

  const ClassItem({
    super.key,
    required this.classInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: context.colors.gray100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: context.colors.brand100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Icon(
                  Icons.school_rounded,
                  color: context.colors.brand500,
                  size: 24,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    classInfo.name,
                    style: context.typography.textmdSemibold.copyWith(
                      color: context.colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    classInfo.role,
                    style: context.typography.textsmRegular.copyWith(
                      color: context.colors.gray500,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: context.colors.gray400,
            ),
          ],
        ),
      ),
    );
  }
}
