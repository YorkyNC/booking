import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<T?> showBasePopup<T>(
  BuildContext context, {
  required Widget Function(BuildContext) builder,
  bool useRootNavigator = true,
  bool useSafeArea = true,
  void Function(BuildContext)? onDismiss,
}) {
  return showModalBottomSheet<T>(
    isScrollControlled: true,
    useRootNavigator: useRootNavigator,
    context: context,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withAlpha(125),
    useSafeArea: useSafeArea,
    builder: (context) => Stack(
      fit: StackFit.passthrough,
      children: [
        GestureDetector(
          onTap:
              onDismiss != null ? () => onDismiss.call(context) : context.pop,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: builder(context),
        ),
      ],
    ),
  );
}
