import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/popups/sheet_popup.dart';
import 'package:booking/src/features/events/domain/models/enums/events_sort.dart';
import 'package:booking/src/features/events/presentation/bloc/events_bloc.dart';
import 'package:booking/src/features/events/presentation/bloc/events_state.dart';

Future<void> showEventsSortPopup(BuildContext context,
    {required EventsSort initialSort, required void Function(EventsSort)? onSortUpdated}) {
  return showSheetPopup(
    context,
    title: Text(context.loc.sort),
    builder: (_) => BlocProvider.value(
      value: context.read<EventsBloc>(),
      child: BlocBuilder<EventsBloc, EventsState>(
        builder: (context, state) {
          return EventsSortView(
            initialSort: initialSort,
            onSortUpdated: (sort) {
              onSortUpdated?.call(sort);
              context.pop();
            },
          );
        },
      ),
    ),
  );
}

class EventsSortView extends StatelessWidget {
  const EventsSortView({
    super.key,
    required this.initialSort,
    this.onSortUpdated,
  });

  final EventsSort initialSort;
  final void Function(EventsSort)? onSortUpdated;

  String _getSortText(BuildContext context, EventsSort sort) {
    return switch (sort) {
      EventsSort.urgent => context.loc.eventsUrgent,
      EventsSort.latest => context.loc.eventsNew,
      EventsSort.old => context.loc.eventsOld,
    };
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: EventsSort.values.length,
      itemBuilder: (context, index) {
        final element = EventsSort.values[index];
        final selected = initialSort == element;
        return Material(
          borderRadius: BorderRadius.circular(8),
          color: selected ? context.colors.blueGray50 : Colors.transparent,
          child: RadioListTile(
            controlAffinity: ListTileControlAffinity.trailing,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            value: element,
            groupValue: initialSort,
            onChanged: (value) {
              if (value != null) onSortUpdated?.call(value);
            },
            activeColor: context.colors.blueGray400,
            title: Text(
              _getSortText(context, element),
              style: context.typography.textlgRegular.copyWith(
                color: context.colors.black,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          ),
        );
      },
      separatorBuilder: (ctx, _) => const Divider(
        height: 8,
      ),
    );
  }
}
