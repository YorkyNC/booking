import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';

class ScheduleDeletedSubjectTile extends StatelessWidget {
  final String subjectName;
  final String className;
  final String startTime;
  final String endTime;
  final String room;
  final String subjectId;

  const ScheduleDeletedSubjectTile({
    super.key,
    required this.subjectName,
    required this.className,
    required this.startTime,
    required this.endTime,
    required this.room,
    required this.subjectId,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subjectName,
            style: context.typography.textsmSemibold.copyWith(
              color: context.colors.black,
            ),
          ),
          Text(
            className,
            style: context.typography.textxsRegular.copyWith(color: context.colors.gray500),
          ),
          Text(
            room,
            style: context.typography.textxsRegular.copyWith(color: context.colors.gray500),
          ),
        ],
      ),
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 50,
            height: 58,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  startTime,
                  style: context.typography.textsmMedium.copyWith(
                    color: context.colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  endTime,
                  style: context.typography.textsmRegular.copyWith(
                    color: context.colors.gray500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          VerticalDivider(
            color: context.colors.gray300,
          )
        ],
      ),
      trailing: IconButton(
        icon: Icon(
          context.icons.arrow_up_1__arrow_up_keyboard,
          color: context.colors.gray500,
        ),
        onPressed: () {},
      ),
    );
  }
}
