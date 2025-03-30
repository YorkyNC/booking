import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/extensions/date_time_extension.dart';
import 'package:booking/src/core/widgets/popups/sheet_popup.dart';
import 'package:booking/src/features/detection/presentation/components/add_detection_pop_up.dart';
import 'package:booking/src/features/detection/presentation/components/app_bar/cheating_plan_detection_app_bar.dart';
import 'package:booking/src/features/schedule/presentation/components/custom_calendar.dart';

class CheatingPlanDetectionView extends StatelessWidget {
  const CheatingPlanDetectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.gray100,
      appBar: const CheatingPlanDetectionAppBar(),
      body: CustomCalendar(
        selectable: false,
        firstDay: DateTime.now().subtract(const Duration(days: 365)),
        lastDay: DateTime.now().add(const Duration(days: 365)),
        initialSelectedDate: DateTime.now(),
        onDateSelected: (date) {},
        onTapDate: (DateTime selectedDate) {
          _showPlanningDetectionSchedule(context, selectedDate);
        },
      ),
    );
  }
}

Future<dynamic> _showPlanningDetectionSchedule(BuildContext context, DateTime selectedDate) {
  return showSheetPopup(context,
      title: Text(
        selectedDate.formatDateWithWeekday,
        style: context.typography.typography3SemiBold.copyWith(
          color: context.colors.black,
        ),
      ), builder: (context) {
    return const AddDetectionPopUp();
  });
}
