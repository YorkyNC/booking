import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';

class FeedbackActionTile extends StatelessWidget {
  const FeedbackActionTile({
    super.key,
    required this.title,
    required this.leading,
    this.backgroundColor,
    this.onTap,
    this.trailingIcon,
    this.subtitle,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.trailing,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    this.titleStyle,
  });

  final Color? backgroundColor;
  final Widget leading;
  final IconData? trailingIcon;
  final Widget? trailing;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final BorderRadius borderRadius;
  final EdgeInsets padding;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: backgroundColor,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: onTap,
          child: Padding(
            padding: padding,
            child: IconTheme(
              data: const IconThemeData(size: 24),
              child: Row(
                children: [
                  leading,
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: titleStyle ??
                              context.typography.textmdRegular.copyWith(
                                color: context.colors.black,
                              ),
                        ),
                        if (subtitle != null)
                          Text(
                            subtitle!,
                            style: context.typography.textsmRegular.copyWith(
                              color: context.colors.gray500,
                            ),
                          )
                      ],
                    ),
                  ),
                  if (trailing != null)
                    DefaultTextStyle(
                      style: context.typography.textsmRegular.copyWith(
                        color: context.colors.gray500,
                        height: 1,
                      ),
                      child: trailing!,
                    ),
                  if (trailingIcon != null)
                    Icon(
                      trailingIcon,
                      color: context.colors.gray500,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
