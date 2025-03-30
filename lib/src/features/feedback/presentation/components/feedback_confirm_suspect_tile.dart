import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/components/events/domain/models/suspect_entity.dart';
import 'package:booking/src/core/components/users/presentation/widgets/adaptive_user_avatar.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/features/feedback/presentation/components/feedback_action.dart';

class FeedbackConfirmSuspectTile extends StatelessWidget {
  const FeedbackConfirmSuspectTile({
    super.key,
    required this.suspect,
  });

  final SuspectEntity suspect;

  @override
  Widget build(BuildContext context) {
    final user = suspect.user;
    if (user == null) {
      return FeedbackActionTile(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        title: context.loc.unidentifiedStudent,
        subtitle: context.loc.willBeIdentifiedAfterSent,
        leading: AdaptiveUserAvatar(
          imageUri: suspect.imageUrl,
        ),
      );
    }
    return FeedbackActionTile(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      title: user.fullName,
      subtitle: "6Б класс",
      onTap: () {},
      leading: AdaptiveUserAvatar(
        imageUri: suspect.imageUrl,
      ),
      trailing: Text(context.loc.dossier),
      trailingIcon: context.icons.chevron_right,
    );
  }
}
