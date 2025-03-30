import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/popups/sheet_popup.dart';
import 'package:booking/src/features/schedule/presentation/bloc/schedule_bloc.dart';
import 'package:booking/src/features/schedule/presentation/bloc/schedule_event.dart';
import 'package:booking/src/features/schedule/presentation/components/editing_room_pop_up.dart';

class ScheduleEditingTile extends StatelessWidget {
  final String subjectName;
  final String className;
  final String startTime;
  final String endTime;
  final String room;
  final String subjectId;

  const ScheduleEditingTile({
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
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            iconSize: 24,
            onPressed: () {
              showEditingRoomPopUp(context);
            },
            color: context.colors.gray500,
            icon: Icon(
              context.icons.pencil__change_edit_modify_pencil_write_writing,
            ),
          ),
          Transform.rotate(
            angle: 45 * 3.14159 / 180,
            child: IconButton(
              iconSize: 24,
              icon: Icon(
                context.icons.add_circle__button_remove_cross_add_buttons_plus_circle___mathematics_math,
              ),
              onPressed: () {
                context.read<ScheduleBloc>().add(
                      ScheduleEventDeleteSubject(subjectId),
                    );
              },
              color: context.colors.gray500,
            ),
          )
        ],
      ),
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
    );
  }

  Future<dynamic> showEditingRoomPopUp(BuildContext context) {
    return showSheetPopup(
      title: Text(
        context.loc.editing,
        style: context.typography.textlgSemibold.copyWith(
          color: context.colors.black,
        ),
      ),
      context,
      builder: (value) {
        return EditingRoomPopUp(subjectName: subjectName, className: className, room: room);
      },
    );
  }
}
