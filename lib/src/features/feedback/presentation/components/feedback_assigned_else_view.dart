import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/components/users/domain/models/user_entity.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/padding/default_horizontal_padding.dart';
import 'package:booking/src/features/feedback/presentation/components/feedback_action.dart';

class FeedbackAssignedElseView extends StatelessWidget {
  const FeedbackAssignedElseView({super.key, required this.assignee});

  final UserEntity assignee;

  @override
  Widget build(BuildContext context) {
    return DefaultHorizontalPadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            context.loc.responsiblePerson,
            style: context.typography.textsmSemibold.copyWith(
              color: context.colors.black,
            ),
          ),
          const SizedBox(height: 8),
          FeedbackActionTile(
            onTap: () {},
            leading: SizedBox(
              height: 40,
              width: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  assignee.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            backgroundColor: context.colors.gray50,
            title: assignee.fullName,
            subtitle: "Психолог",
            //TODO: get from UserEntity
            trailingIcon: context.icons.chevron_right,
          ),
          const SizedBox(height: 8),
          Text(
            context.loc.taskAlreadyAssigned,
            style: context.typography.textsmRegular.copyWith(
              color: context.colors.gray500,
            ),
          ),
        ],
      ),
    );
  }
}
