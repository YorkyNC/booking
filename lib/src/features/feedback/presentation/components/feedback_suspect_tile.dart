import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/components/events/domain/models/suspect_entity.dart';
import 'package:booking/src/core/components/users/presentation/widgets/adaptive_user_avatar.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/features/feedback/presentation/components/feedback_action.dart';

class FeedbackSuspectTile extends StatelessWidget {
  const FeedbackSuspectTile({
    super.key,
    required this.suspect,
    this.onTap,
  });

  final VoidCallback? onTap;
  final SuspectEntity suspect;

  @override
  Widget build(BuildContext context) {
    final user = suspect.user;
    if (user == null) {
      return FeedbackActionTile(
        padding: const EdgeInsets.symmetric(vertical: 8),
        onTap: onTap,
        leading: AdaptiveUserAvatar(imageUri: suspect.imageUrl),
        title: context.loc.notIdentified,
        trailingIcon: onTap != null ? context.icons.chevron_right : null,
        titleStyle: context.typography.textmdRegular.copyWith(
          color: context.colors.gray500,
        ),
      );
    } else {
      return FeedbackActionTile(
        padding: const EdgeInsets.symmetric(vertical: 8),
        onTap: onTap,
        leading: AdaptiveUserAvatar(
          imageUri: user.imageUrl,
        ),
        trailingIcon: onTap != null ? context.icons.pencil__change_edit_modify_pencil_write_writing : null,
        title: user.fullName,
        subtitle: "6Б класс",
        trailing: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: AdaptiveUserAvatar(
            imageUri: suspect.imageUrl,
          ),
        ),
      );
    }
  }
}
