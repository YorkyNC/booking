import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';

DataCell buildMetricCell(BuildContext context, dynamic value) {
  final String displayValue = value?.toString() ?? '0';

  return DataCell(
    Container(
      alignment: Alignment.center,
      child: Text(
        displayValue,
        style: context.typography.textsmRegular.copyWith(
          color: context.colors.black,
        ),
      ),
    ),
  );
}
