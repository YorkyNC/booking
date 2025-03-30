import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/router/router.dart';
import 'package:booking/src/features/class_events/presentation/bloc/class_events_bloc.dart';
import 'package:booking/src/features/class_events/presentation/components/class_event_app_bar.dart';
import 'package:booking/src/features/class_events/presentation/components/class_table.dart';
import 'package:booking/src/features/class_events/presentation/components/custom_search_bar.dart';

class ClassEventPage extends StatefulWidget {
  const ClassEventPage({super.key});

  @override
  State<ClassEventPage> createState() => _ClassEventPageState();
}

class _ClassEventPageState extends State<ClassEventPage> {
  final String searchHeroTag = 'class_search_bar';
  String searchQuery = '';

  void _navigateToSearch() async {
    final result = await context.push(RoutePaths.classSearch, extra: {
      'heroTag': searchHeroTag,
    });

    if (result != null) {
      setState(() {
        searchQuery = result as String;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClassEventsBloc(),
      child: Scaffold(
        backgroundColor: context.colors.gray100,
        appBar: const ClassEventAppBar(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              color: context.colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  CustomSearchBar(
                    heroTag: searchHeroTag,
                    hintText: searchQuery.isEmpty ? 'Найти класс или ученика' : searchQuery,
                    onTap: _navigateToSearch,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const ClassTable(),
          ],
        ),
      ),
    );
  }
}
