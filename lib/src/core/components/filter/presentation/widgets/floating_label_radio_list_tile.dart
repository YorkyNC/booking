import 'package:flutter/material.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';

class FloatingLabelRadioListTile extends StatefulWidget {
  const FloatingLabelRadioListTile({
    super.key,
    required this.label,
    required this.text,
    this.onTap,
  });

  final String label;
  final String? text;
  final VoidCallback? onTap;

  @override
  State<FloatingLabelRadioListTile> createState() => _FloatingLabelRadioListTileState();
}

class _FloatingLabelRadioListTileState extends State<FloatingLabelRadioListTile> {
  late final _controller = TextEditingController(text: widget.text);

  @override
  void didUpdateWidget(covariant FloatingLabelRadioListTile oldWidget) {
    if (oldWidget.text != widget.text) {
      _controller.text = widget.text ?? "";
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      color: widget.text != null ? context.colors.blueGray50 : Colors.transparent,
      child: RadioListTile(
        controlAffinity: ListTileControlAffinity.trailing,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        activeColor: context.colors.blueGray400,
        onChanged: (_) => widget.onTap?.call(),
        value: widget.text != null,
        groupValue: true,
        title: TextField(
          controller: _controller,
          style: context.typography.typography3SemiBold.copyWith(
            color: context.colors.black,
          ),
          decoration: InputDecoration(
            labelText: widget.label,
            labelStyle: context.typography.typography3Regular.copyWith(
              color: context.colors.black,
            ),
            border: InputBorder.none,
          ),
          enabled: false,
        ),
      ),
    );
  }
}
