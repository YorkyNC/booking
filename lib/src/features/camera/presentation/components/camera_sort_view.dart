import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/features/camera/domain/entities/enums/sorting_options.dart';

class CameraSortView extends StatefulWidget {
  final CameraSorting? initialValue;
  final Function(CameraSorting) onSortUpdated;

  const CameraSortView({
    Key? key,
    this.initialValue,
    required this.onSortUpdated,
  }) : super(key: key);

  String _getSortText(BuildContext context, CameraSorting sort) {
    return switch (sort) {
      CameraSorting.moreEvents => context.loc.moreEvents,
      CameraSorting.lessEvents => context.loc.lessEvents,
      CameraSorting.aToZ => context.loc.aToZ,
      CameraSorting.zToA => context.loc.zToA,
    };
  }

  @override
  State<CameraSortView> createState() => _CameraSortViewState();
}

class _CameraSortViewState extends State<CameraSortView> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: CameraSorting.values.length,
      itemBuilder: (context, index) {
        final element = CameraSorting.values[index];
        final selected = CameraSorting.moreEvents == element;
        return Material(
          borderRadius: BorderRadius.circular(8),
          color: selected ? context.colors.blueGray50 : Colors.transparent,
          child: RadioListTile(
            controlAffinity: ListTileControlAffinity.trailing,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            value: element,
            groupValue: widget.initialValue,
            onChanged: (value) {
              if (value != null) widget.onSortUpdated.call(value);
            },
            activeColor: context.colors.blueGray400,
            title: Text(
              widget._getSortText(context, element),
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
