import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';

class ChevronChip extends StatelessWidget {
  const ChevronChip({
    super.key,
    required this.label,
    required this.onTap,
  });

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      onPressed: onTap,
      color: WidgetStatePropertyAll(context.colors.white),
      side: const BorderSide(
        color: Color(0xFFD5D7DA),
      ),
      padding: const EdgeInsets.all(4),
      elevation: 1,
      shadowColor: const Color(0xFF0A0D12).withValues(alpha: 0.05),
      label: Row(
        children: [
          Text(
            label,
            style: context.typography.typography1SemiBold.copyWith(
              color: context.colors.gray700,
            ),
          ),
          SvgPicture.asset(
            context.assetImages.chevronRight,
            colorFilter: ColorFilter.mode(
              context.colors.gray700,
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
      backgroundColor: context.colors.white,
      labelStyle: TextStyle(color: context.colors.black),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(200),
      ),
    );
  }
}
