import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/buttons/switchable_icon_button.dart';
import 'package:booking/src/features/class_events/presentation/components/custom_search_bar.dart';

class ClassSearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String heroTag;
  final Function(String)? onChanged;
  const ClassSearchAppBar({super.key, required this.heroTag, required this.onChanged});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Row(
            children: [
              SwitchableIconButton(
                onTap: () => context.pop(),
                icon: context.icons.chevron_left,
              ),
              const SizedBox(width: 12),
              CustomSearchBar(
                heroTag: heroTag,
                hintText: 'Найти класс или ученика',
                isExpanded: true,
                onChanged: (value) {
                  if (onChanged != null) {
                    onChanged!(value);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
