import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/components/events/domain/models/event_entity.dart';
import 'package:booking/src/core/components/events/domain/models/suspect_entity.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/router/router.dart';
import 'package:booking/src/core/widgets/padding/default_horizontal_padding.dart';
import 'package:booking/src/features/feedback/presentation/bloc/feedback_bloc.dart';
import 'package:booking/src/features/feedback/presentation/bloc/feedback_event.dart';
import 'package:booking/src/features/feedback/presentation/components/feedback_action.dart';
import 'package:booking/src/features/feedback/presentation/components/feedback_suspect_tile.dart';
import 'package:booking/src/features/feedback/presentation/popups/feedback_confirm_suspect_popup.dart';
import 'package:booking/src/features/feedback/presentation/popups/feedback_find_suspect_popup.dart';

class FeedbackAssignedMeView extends StatelessWidget {
  const FeedbackAssignedMeView({
    super.key,
    required this.event,
    required this.involvedPeople,
  });

  final EventEntity event;
  final List<SuspectEntity> involvedPeople;

  @override
  Widget build(BuildContext context) {
    return DefaultHorizontalPadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            context.loc.involvedPeople,
            style: context.typography.textlgSemibold.copyWith(
              color: context.colors.black,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                FeedbackActionTile(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  onTap: () => context.push("${RoutePaths.feedback}/${event.id}/${RoutePaths.addParticipant}"),
                  leading: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: context.colors.gray200,
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      context.icons.add_1__expand_cross_buttons_button_more_remove_plus_add___mathematics_math,
                      color: context.colors.gray500,
                    ),
                  ),
                  title: context.loc.addParticipant,
                ),
                const Divider(),
                for (var i = 0; i < involvedPeople.length * 2 - 1; i++)
                  i % 2 == 0
                      ? FeedbackSuspectTile(
                          suspect: involvedPeople[i ~/ 2],
                          onTap: () {
                            final suspect = involvedPeople[i ~/ 2];
                            if (suspect.user != null) {
                              showFeedbackConfirmSuspectPopup(
                                context,
                                suspect: suspect,
                                onDoNotKnow: () => context.read<FeedbackBloc>().add(
                                      FeedbackInvolvedPersonForgotten(suspect),
                                    ),
                              );
                            } else {
                              showFeedbackFindSuspectPopup(
                                context,
                                suspect: suspect,
                              );
                            }
                          },
                        )
                      : const Divider(),
              ],
            ),
          ),
          const SizedBox(height: 8),
          if (involvedPeople.any((e) => e.user == null)) ...[
            Text(
              context.loc.suspectListHint,
              textAlign: TextAlign.center,
              style: context.typography.textsmRegular.copyWith(
                color: context.colors.gray500,
              ),
            ),
            const SizedBox(height: 8),
          ],
          ElevatedButton(
            onPressed: () => context.push(
              "${RoutePaths.feedback}/${event.id}/${RoutePaths.confirmSuspects}",
            ),
            child: Text(context.loc.continueNext),
          ),
        ],
      ),
    );
  }
}
