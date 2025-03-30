import 'package:intl/intl.dart';
import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';

class ParentScheduleHeader extends StatelessWidget {
  final DateTime startTime;
  final DateTime endTime;
  final int lessonsCount;

  const ParentScheduleHeader({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.lessonsCount,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      surfaceTintColor: Colors.transparent,
      pinned: true,
      backgroundColor: context.colors.gray100,
      centerTitle: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            color: context.colors.white,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(12),
            ),
          ),
        ),
      ),
      toolbarHeight: kToolbarHeight * 1.25,
      titleTextStyle: context.typography.textmdSemibold.copyWith(
        color: context.colors.black,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.loc.today,
            style: context.typography.textmdSemibold.copyWith(
              color: context.colors.black,
            ),
          ),
          Text(
            DateFormat('dd.MM EEE').format(DateTime.now()),
            style: context.typography.textsmRegular.copyWith(
              color: context.colors.gray600,
            ),
          ),
        ],
      ),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      actions: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '${DateFormat('HH:mm').format(startTime)} - ${DateFormat('HH:mm').format(endTime)}',
              style: context.typography.textsmMedium.copyWith(
                color: context.colors.black,
              ),
            ),
            Text(
              '$lessonsCount ${context.loc.lessons}',
              style: context.typography.textsmRegular.copyWith(
                color: context.colors.gray500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
