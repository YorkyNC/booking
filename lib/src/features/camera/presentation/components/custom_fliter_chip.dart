import 'package:flutter/material.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';

class CustomFliterChip extends StatelessWidget {
  CustomFliterChip({
    super.key,
    required this.context,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final BuildContext context;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? context.colors.white : context.colors.gray100,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected ? context.colors.purple500 : context.colors.gray100,
              width: 1,
            ),
          ),
          child: Text(
            label,
            style: context.typography.typography2Regular.copyWith(
              color: isSelected ? context.colors.purple500 : context.colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
