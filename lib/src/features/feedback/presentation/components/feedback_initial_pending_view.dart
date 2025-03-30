import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/components/events/domain/models/event_entity.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/padding/default_horizontal_padding.dart';
import 'package:booking/src/features/feedback/presentation/bloc/feedback_bloc.dart';
import 'package:booking/src/features/feedback/presentation/bloc/feedback_event.dart';
import 'package:booking/src/features/feedback/presentation/components/feedback_action.dart';
import 'package:booking/src/features/feedback/presentation/popups/feedback_become_responsible_popup.dart';
import 'package:booking/src/features/feedback/presentation/popups/feedback_redirect_popup.dart';

class FeedbackInitialPendingView extends StatelessWidget {
  const FeedbackInitialPendingView({
    super.key,
    required this.event,
  });

  final EventEntity event;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DefaultHorizontalPadding(
          child: Text(
            context.loc.responsiblePerson,
            style: context.typography.textlgSemibold.copyWith(
              color: context.colors.black,
            ),
          ),
        ),
        const SizedBox(height: 8),
        DefaultHorizontalPadding(
          child: Text(
            context.loc.responsiblePersonSubtitle,
            style: context.typography.textsmRegular.copyWith(
              color: context.colors.gray500,
            ),
          ),
        ),
        const Spacer(),
        DefaultHorizontalPadding(
          child: FeedbackActionTile(
            onTap: () => showFeedbackBecomeResponsiblePopup(
              context,
              onConfirm: () => context.read<FeedbackBloc>().add(const FeedbackBecomeResponsiblePressed()),
            ),
            leading: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: context.colors.blueGray200,
              ),
              padding: const EdgeInsets.all(8),
              child: Icon(
                context.icons.add_1__expand_cross_buttons_button_more_remove_plus_add___mathematics_math,
                color: context.colors.blueGray700,
              ),
            ),
            backgroundColor: context.colors.blueGray50,
            title: context.loc.becomeResponsiblePerson,
          ),
        ),
        const SizedBox(height: 8),
        DefaultHorizontalPadding(
          child: FeedbackActionTile(
            onTap: () => showFeedbackRedirectPopup(context),
            leading: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: context.colors.gray200,
              ),
              padding: const EdgeInsets.all(8),
              child: Icon(
                context.icons.mail_send_reply_all__email_message_reply_all_actions_action_arrow,
                color: context.colors.gray700,
              ),
            ),
            backgroundColor: context.colors.gray50,
            title: context.loc.redirect,
          ),
        ),
      ],
    );
  }
}
