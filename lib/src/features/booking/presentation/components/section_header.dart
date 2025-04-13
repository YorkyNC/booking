// section_header.dart

import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String text;

  const SectionHeader({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.typography.textmdMedium.copyWith(
        color: context.colors.black,
      ),
    );
  }
}
