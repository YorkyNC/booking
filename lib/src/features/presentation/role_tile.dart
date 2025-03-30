import 'package:flutter/material.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/theme/typography.dart';

class RoleTile extends StatelessWidget {
  final String role;
  final String subTitle;
  final bool isSelected;
  final VoidCallback onTap;

  const RoleTile({
    super.key,
    required this.role,
    required this.subTitle,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        role,
        style: const FigmaTextStyles().typography2Regular.copyWith(color: context.colors.black),
      ),
      subtitle: Text(
        subTitle,
        style: const FigmaTextStyles().typography1Regular.copyWith(color: context.colors.gray600),
      ),
      trailing: isSelected
          ? Icon(
              context.icons.add_square__square_remove_cross_buttons_add_plus_button___mathematics_math,
              color: context.colors.blue500,
              size: 20,
            )
          : null,
      onTap: onTap,
    );
  }
}
