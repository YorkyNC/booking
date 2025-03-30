import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/features/class_events/presentation/bloc/class_events_bloc.dart';
import 'package:booking/src/features/class_events/presentation/bloc/class_events_state.dart';
import 'package:booking/src/features/class_events/presentation/components/class_table_shimmer.dart';
import 'package:booking/src/features/class_events/presentation/components/table/build_alternating_rows.dart';
import 'package:booking/src/features/class_events/presentation/components/table/build_columns.dart' as columns;
import 'package:booking/src/features/class_events/presentation/components/table/build_table_border.dart';
import 'package:booking/src/features/class_events/presentation/components/table/on_sort.dart' as sort_util;

class ClassTable extends StatefulWidget {
  const ClassTable({Key? key}) : super(key: key);

  @override
  State<ClassTable> createState() => _ClassTableState();
}

class _ClassTableState extends State<ClassTable> {
  final ScrollController _verticalScrollController = ScrollController();
  final ScrollController _horizontalScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    columns.initOnSort((context, columnIndex, ascending) {
      sort_util.onSort(context, columnIndex, ascending);
    });
  }

  @override
  void dispose() {
    _verticalScrollController.dispose();
    _horizontalScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClassEventsBloc, ClassEventsState>(
      builder: (context, state) {
        final classes = state.classes;
        if (classes == null) {
          return const ClassTableShimmer();
        }
        return LayoutBuilder(
          builder: (context, constraints) {
            final availableWidth = constraints.maxWidth;
            return Container(
              decoration: BoxDecoration(
                color: context.colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: context.colors.gray100),
              ),
              child: Scrollbar(
                controller: _verticalScrollController,
                thumbVisibility: true,
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  controller: _verticalScrollController,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: availableWidth,
                    ),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        dataTableTheme: DataTableThemeData(
                          headingTextStyle: context.typography.textxsRegular.copyWith(
                            color: context.colors.gray500,
                          ),
                          dataTextStyle: context.typography.textsmRegular.copyWith(
                            color: context.colors.white,
                          ),
                        ),
                      ),
                      child: DataTable(
                        decoration: BoxDecoration(
                          color: context.colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        dividerThickness: 0.5,
                        sortAscending: state.sortAscending,
                        sortColumnIndex: state.sortColumnIndex >= 0 ? state.sortColumnIndex : null,
                        columns: columns.buildColumns(context, state),
                        border: buildTableBorder(context),
                        rows: buildAlternatingRows(context, classes),
                        columnSpacing: availableWidth > 600 ? 24 : 16,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
