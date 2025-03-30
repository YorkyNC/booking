import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/extensions/date_time_extension.dart';
import 'package:booking/src/core/widgets/popups/sheet_popup.dart';
import 'package:booking/src/features/schedule/data/datasource/timetable_local_data_source.dart';
import 'package:booking/src/features/schedule/data/repository/timetable_repository_impl.dart';
import 'package:booking/src/features/schedule/domain/usecase/get_timetable_entries.dart';
import 'package:booking/src/features/schedule/presentation/bloc/schedule_bloc.dart';
import 'package:booking/src/features/schedule/presentation/bloc/timetable_bloc.dart';
import 'package:booking/src/features/schedule/presentation/components/custom_calendar.dart';
import 'package:booking/src/features/schedule/presentation/components/popups/schedule_day_pop_up.dart';
import 'package:booking/src/features/schedule/presentation/components/schedule_calendar_app_bar.dart';
import 'package:booking/src/features/schedule/presentation/components/timetable/quarter_timetable_widget.dart';

class ScheduleCalendar extends StatefulWidget {
  const ScheduleCalendar({super.key});

  @override
  State<ScheduleCalendar> createState() => _ScheduleCalendarState();
}

class _ScheduleCalendarState extends State<ScheduleCalendar> {
  bool _isCalendarView = true;
  late final TimetableBloc _timetableBloc;

  @override
  void initState() {
    super.initState();
    // Create the TimetableBloc with its dependencies
    final timetableLocalDataSource = TimetableLocalDataSource();
    final timetableRepository = TimetableRepositoryImpl(
      localDataSource: timetableLocalDataSource,
    );
    final getTimetableEntriesUseCase = GetTimetableEntries(timetableRepository);
    _timetableBloc = TimetableBloc(
      getTimetableEntriesUseCase: getTimetableEntriesUseCase,
    );
  }

  void _onViewChanged(bool isCalendarView) {
    setState(() {
      _isCalendarView = isCalendarView;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScheduleBloc(),
      child: Scaffold(
        backgroundColor: _isCalendarView ? context.colors.gray100 : context.colors.white,
        appBar: ScheduleCalendarAppBar(
          isCalendarView: _isCalendarView,
          onViewChanged: _onViewChanged,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Column(
            children: [
              Expanded(
                child: _isCalendarView
                    ? CustomCalendar(
                        selectable: false,
                        firstDay: DateTime.now().subtract(const Duration(days: 365)),
                        lastDay: DateTime.now().add(const Duration(days: 365)),
                        initialSelectedDate: DateTime.now(),
                        onDateSelected: (date) {},
                        onTapDate: (DateTime selectedDate) {
                          _showScheduleDayPopUp(context, selectedDate);
                        },
                      )
                    : QuarterTimetableWidget(
                        entries: _timetableBloc.getTimetableEntries(),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showScheduleDayPopUp(BuildContext context, DateTime selectedDate) {
    return showSheetPopup(
      context,
      title: Text(
        selectedDate.formatDateWithWeekday,
        style: context.typography.typography3SemiBold.copyWith(
          color: context.colors.black,
        ),
      ),
      builder: (context) {
        return const ScheduleDayPopUp();
      },
    );
  }
}
