import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/services/injectable/injectable_service.dart';
import 'package:booking/src/features/parent/presentation/bloc/parent_bloc.dart';
import 'package:booking/src/features/parent/presentation/bloc/parent_event.dart';
import 'package:booking/src/features/parent/presentation/bloc/parent_state.dart';
import 'package:booking/src/features/parent/presentation/components/parent_app_bar.dart';
import 'package:booking/src/features/parent/presentation/components/parent_attendance_status.dart';
import 'package:booking/src/features/parent/presentation/components/parent_home_buttons_section.dart';
import 'package:booking/src/features/parent/presentation/components/parent_loading_state.dart';
import 'package:booking/src/features/parent/presentation/components/parent_schedule_header.dart';
import 'package:booking/src/features/parent/presentation/components/parent_schedule_list.dart';

import '../../../core/router/router.dart';

class ParentHomePage extends StatefulWidget {
  const ParentHomePage({super.key});

  @override
  State<ParentHomePage> createState() => _ParentHomePageState();
}

class _ParentHomePageState extends State<ParentHomePage> {
  late final ParentBloc _parentBloc;
  final bool _isInSchool = false;

  @override
  void initState() {
    super.initState();
    _parentBloc = getIt<ParentBloc>();
    _parentBloc.add(const ParentEventFetched());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _parentBloc,
      child: Scaffold(
        backgroundColor: context.colors.gray100,
        appBar: const ParentAppBar(),
        body: BlocBuilder<ParentBloc, ParentState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const ParentLoadingState();
            }

            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: ParentAttendanceStatus(
                    isInSchool: _isInSchool,
                    onTap: () {
                      context.push(RoutePaths.actions);
                    },
                  ),
                ),
                const SliverToBoxAdapter(
                  child: ParentHomeButtonsSection(),
                ),
                ParentScheduleHeader(
                  startTime: state.schedule?.isNotEmpty == true ? state.schedule!.first.startTime : DateTime.now(),
                  endTime: state.schedule?.isNotEmpty == true
                      ? state.schedule!.last.endTime
                      : DateTime.now().add(const Duration(hours: 6)),
                  lessonsCount: state.schedule?.length ?? 0,
                ),
                SliverToBoxAdapter(
                  child: ParentScheduleList(
                    schedule: state.schedule,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
