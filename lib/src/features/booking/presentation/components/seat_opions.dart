import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class SeatOpions extends StatelessWidget {
  const SeatOpions({
    super.key,
    required this.color,
    required this.label,
  });
  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            border: Border.all(
              color: context.colors.gray400,
            ),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: context.typography.textsmRegular.copyWith(
            color: context.colors.gray700,
          ),
        ),
      ],
    );
  }
}
