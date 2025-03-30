import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';

import '../../../../core/widgets/buttons/switchable_icon_button.dart';

class ActionsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ActionsAppBar({
    super.key,
    this.onDateSelected,
  });

  final Function(DateTime)? onDateSelected;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              SwitchableIconButton(
                onTap: context.pop,
                icon: context.icons.chevron_left,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  context.loc.actions,
                  style: context.typography.typography4Bold.copyWith(
                    color: context.colors.gray800,
                  ),
                ),
              ),
              OutlinedButton.icon(
                iconAlignment: IconAlignment.start,
                icon: Icon(context.icons.blank_calendar__blank_calendar_date_day_month_empty),
                label: Text(
                  context.loc.findDate,
                ),
                onPressed: () => _showDatePicker(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDatePicker(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (selectedDate != null && onDateSelected != null) {
      onDateSelected!(selectedDate);
    }
  }
}
