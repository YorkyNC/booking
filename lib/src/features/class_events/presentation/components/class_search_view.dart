import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/features/class_events/presentation/bloc/class_events_bloc.dart';
import 'package:booking/src/features/class_events/presentation/bloc/class_events_event.dart';
import 'package:booking/src/features/class_events/presentation/bloc/class_events_state.dart';
import 'package:booking/src/features/class_events/presentation/components/class_search_app_bar.dart';

class ClassSearchView extends StatefulWidget {
  final String initialQuery;
  final String heroTag;

  const ClassSearchView({
    super.key,
    required this.initialQuery,
    required this.heroTag,
  });

  @override
  State<ClassSearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<ClassSearchView> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialQuery);
    if (widget.initialQuery.isNotEmpty) {
      context.read<ClassEventsBloc>().add(ClassSearched(query: widget.initialQuery));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClassEventsBloc(),
      child: Scaffold(
        backgroundColor: context.colors.gray100,
        appBar: ClassSearchAppBar(
          heroTag: widget.heroTag,
          onChanged: (value) {},
        ),
        body: BlocBuilder<ClassEventsBloc, ClassEventsState>(
          builder: (context, state) {
            if (state.classes == null) {
              return Center(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(
                    strokeWidth: 10,
                    color: context.colors.brand100,
                  ),
                ),
              );
            }
            final results = state.isSearching ? state.filteredClasses! : state.classes!;
            if (results.isEmpty) {
              // Show empty state
              return Center(
                child: Text(
                  'Ничего не найдено',
                  style: context.typography.textlgMedium.copyWith(color: context.colors.gray500),
                ),
              );
            }
            return ListView.builder(
              shrinkWrap: true,
              itemCount: results.length,
              itemBuilder: (context, index) {
                final classItem = results[index];
                return ListTile(
                  title: Text(
                    classItem.className,
                    style: context.typography.textmdRegular.copyWith(color: context.colors.black),
                  ),
                  subtitle: Text(
                    'Учеников: ${classItem.studentsCount}',
                    style: context.typography.textsmRegular.copyWith(color: context.colors.gray600),
                  ),
                  onTap: () {
                    context.pop(
                        //push to page of list
                        );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
