import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:booking/src/core/components/events/domain/extensions/event_type_extension.dart';
import 'package:booking/src/core/components/events/domain/models/enums/event_type.dart';
import 'package:booking/src/core/components/filter/domain/extensions/date_filter_extension.dart';
import 'package:booking/src/core/components/filter/domain/models/date_filter.dart';
import 'package:booking/src/core/components/filter/domain/models/events_filter.dart';
import 'package:booking/src/core/components/filter/presentation/widgets/date_filter_view.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';

class EventsFilterView extends StatefulWidget {
  const EventsFilterView({
    super.key,
    required this.initialFilter,
    required this.count,
    this.onFilterConfirm,
    this.onFilterSelected,
  });

  final EventsFilter initialFilter;
  final int? count;
  final void Function(EventsFilter)? onFilterSelected;
  final void Function(EventsFilter)? onFilterConfirm;

  @override
  State<EventsFilterView> createState() => _EventsFilterViewState();
}

class _EventsFilterViewState extends State<EventsFilterView> {
  late EventsFilter _currentFilter = widget.initialFilter;

  void _onDateSelected(DateFilter dateFilter) {
    setState(() {
      _currentFilter = _currentFilter.copyWith(
        date: dateFilter,
      );
    });
    widget.onFilterSelected?.call(_currentFilter);
  }

  void _onTypeSelected(bool selected, EventType type) {
    final newSet = _currentFilter.eventTypes.toSet();
    if (selected) {
      newSet.add(type);
    } else {
      newSet.remove(type);
    }
    setState(() {
      _currentFilter = _currentFilter.copyWith(
        eventTypes: newSet,
      );
    });
    widget.onFilterSelected?.call(_currentFilter);
  }

  void _clear() {
    setState(() {
      _currentFilter = EventsFilter(
        date: DateFilter.day(
          startDate: DateTime.now(),
        ),
      );
    });
    widget.onFilterSelected?.call(_currentFilter);
  }

  @override
  Widget build(BuildContext context) {
    final count = widget.count;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (_currentFilter.isDefault)
          OutlinedButton.icon(
            iconAlignment: IconAlignment.end,
            onPressed: _clear,
            icon: Icon(
              context.icons.delete_1__remove_add_button_buttons_delete_cross_x_mathematics_multiply_math,
            ),
            label: Text(context.loc.clearAll),
          ),
        const SizedBox(
          height: 10,
        ),
        Text(
          context.loc.byDate,
          style: context.typography.typography1SemiBold.copyWith(
            color: context.colors.black,
          ),
        ),
        DateFilterView(
          dateFilter: _currentFilter.date,
          onSelected: _onDateSelected,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          context.loc.byType,
          style: context.typography.typography1SemiBold.copyWith(
            color: context.colors.black,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        ListView.separated(
          shrinkWrap: true,
          itemCount: EventType.values.length,
          itemBuilder: (context, index) {
            final e = EventType.values[index];
            final selected = _currentFilter.eventTypes.contains(e);
            return CheckboxListTile(
              activeColor: context.colors.purple500,
              checkColor: context.colors.white,
              checkboxShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              selectedTileColor: context.colors.blueGray50,
              selected: selected,
              value: selected,
              onChanged: (selected) => _onTypeSelected(selected ?? false, e),
              title: Row(
                children: [
                  SvgPicture.asset(e.getFilledAssetPath(context)),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      e.getLocalizedTextPlural(context),
                      style: context.typography.textlgRegular.copyWith(
                        color: context.colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (ctx, _) => const Divider(
            height: 8,
          ),
        ),
        ElevatedButton(
          onPressed: () => widget.onFilterConfirm?.call(_currentFilter),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                context.loc.showResults,
              ),
              const SizedBox(
                width: 8,
              ),
              (count == null)
                  ? Padding(
                      padding: const EdgeInsets.only(left: 1),
                      child: SizedBox(
                        width: 12,
                        height: 12,
                        child: CircularProgressIndicator(
                          strokeWidth: 1.2,
                          color: context.colors.white,
                        ),
                      ),
                    )
                  : Text("($count)"),
            ],
          ), //TODO add loader for null count
        ),
      ],
    );
  }
}
