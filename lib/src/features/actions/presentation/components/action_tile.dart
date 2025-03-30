import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/extensions/date_time_extension.dart';
import 'package:booking/src/features/actions/domain/models/action_entity.dart';

class ActionTile extends StatelessWidget {
  const ActionTile({
    super.key,
    required this.action,
    this.onTap,
  });

  final VoidCallback? onTap;
  final ActionEntity action;

  Color _getIconColor(BuildContext context) {
    return action.actionType == ActionType.entered ? context.colors.brand500 : context.colors.error500;
  }

  String _getActionText(BuildContext context) {
    final isEntered = action.actionType == ActionType.entered;
    return isEntered ? context.loc.enteredSchool : context.loc.leftSchool;
  }

  String _getContextText(BuildContext context) {
    switch (action.actionContext) {
      case ActionContext.beforeLesson:
        return context.loc.beforeLessons;
      case ActionContext.duringLesson:
        if (action.lessonName != null) {
          return '${context.loc.during}: ${action.lessonName}';
        }
        return context.loc.duringLesson;
      case ActionContext.duringBreak:
        return context.loc.duringBreak;
      case ActionContext.afterLesson:
        return context.loc.afterLessons;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: action.actionType == ActionType.entered ? context.colors.brand25 : context.colors.error25,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(
                  action.actionType == ActionType.entered
                      ? context.icons.login_1__arrow_enter_frame_left_login_point_rectangle
                      : context.icons.logout_1__arrow_exit_frame_leave_logout_rectangle_right,
                  color: _getIconColor(context),
                  size: 20,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _getActionText(context),
                  style: context.typography.textsmSemibold.copyWith(
                    color: context.colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _getContextText(context),
                  style: context.typography.textxsRegular.copyWith(
                    color: context.colors.gray500,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              action.createdAt.formatTime,
              style: context.typography.textsmSemibold.copyWith(
                color: context.colors.gray500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
