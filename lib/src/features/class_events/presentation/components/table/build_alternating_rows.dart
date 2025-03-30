import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/components/events/domain/models/enums/event_type.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/router/router.dart';
import 'package:booking/src/features/class/domain/entity/class_entity.dart';
import 'package:booking/src/features/class_events/presentation/components/table/build_metric_cell.dart';

List<DataRow> buildAlternatingRows(BuildContext context, List<ClassEntity> classes) {
  final List<DataRow> rows = [];
  for (int i = 0; i < classes.length; i++) {
    final ClassEntity classEntity = classes[i];
    final bool isEvenRow = i % 2 == 1;

    rows.add(
      DataRow(
        color:
            isEvenRow ? WidgetStateProperty.all(context.colors.gray50) : WidgetStateProperty.all(context.colors.white),
        cells: [
          DataCell(
            onTap: () {
              context.push(RoutePaths.studentsList, extra: {
                'className': classEntity.className,
                'studentsCount': classEntity.studentsCount,
              });
            },
            Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        classEntity.className,
                        style: context.typography.textsmSemibold.copyWith(
                          color: context.colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${classEntity.studentsCount} учеников',
                        style: context.typography.textxsRegular.copyWith(
                          color: context.colors.gray500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          buildMetricCell(context, classEntity.eventCounts[EventType.conflict]),
          buildMetricCell(context, classEntity.eventCounts[EventType.smoking]),
          buildMetricCell(context, classEntity.eventCounts[EventType.cheating]),
        ],
      ),
    );
  }
  return rows;
}
