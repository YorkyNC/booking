import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/padding/default_horizontal_padding.dart';
import 'package:booking/src/core/widgets/popups/base_popup.dart';

Future<T?> showSheetPopup<T>(
  BuildContext context, {
  Color? backgroundColor,
  Widget? title,
  required Widget Function(BuildContext) builder,
  bool useRootNavigator = true,
  EdgeInsets padding = DefaultHorizontalPadding.defaultPadding,
}) {
  return showBasePopup<T>(
    context,
    useRootNavigator: useRootNavigator,
    useSafeArea: true,
    builder: (context) => DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor ?? context.colors.white,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (title != null)
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 20, 12, 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: DefaultTextStyle(
                          style: context.typography.typography3SemiBold.copyWith(
                            color: context.colors.black,
                          ),
                          child: title,
                        ),
                      ),
                      InkWell(
                        customBorder: const CircleBorder(),
                        onTap: context.pop,
                        child: SvgPicture.asset(
                          context.assetImages.cross,
                        ),
                      ),
                    ],
                  ),
                ),
              Padding(
                padding: padding,
                child: builder(context),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
