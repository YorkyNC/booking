import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:booking/src/core/components/events/domain/models/suspect_entity.dart';
import 'package:booking/src/core/components/users/domain/models/user_entity.dart';
import 'package:booking/src/core/components/users/presentation/widgets/adaptive_image.dart';
import 'package:booking/src/core/components/users/presentation/widgets/adaptive_user_avatar.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/buttons/custom_icon_button.dart';
import 'package:booking/src/core/widgets/layout/two_children_overlapping_view.dart';
import 'package:booking/src/core/widgets/padding/default_horizontal_padding.dart';
import 'package:booking/src/core/widgets/popups/base_popup.dart';
import 'package:booking/src/features/feedback/presentation/bloc/feedback_bloc.dart';
import 'package:booking/src/features/feedback/presentation/bloc/feedback_event.dart';
import 'package:booking/src/features/feedback/presentation/bloc/feedback_state.dart';
import 'package:booking/src/features/feedback/presentation/components/feedback_action.dart';
import 'package:booking/src/features/feedback/presentation/popups/feedback_confirm_suspect_popup.dart';

Future<void> showFeedbackFindSuspectPopup(
  BuildContext originalContext, {
  required SuspectEntity suspect,
}) {
  return showBasePopup(
    originalContext,
    useRootNavigator: false,
    builder: (context) {
      return Stack(
        fit: StackFit.passthrough,
        children: [
          TwoChildrenOverlappingView(
            firstChild: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: AdaptiveImage(
                imageUri: suspect.imageUrl,
                fit: BoxFit.fitWidth,
              ),
            ),
            secondChild: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: context.colors.white,
              ),
              child: DefaultHorizontalPadding(
                child: SafeArea(
                  child: FeedbackFindSuspectPopup(
                    onTap: (user) {
                      final newSuspect = suspect.copyWith(
                        user: user,
                      );
                      showFeedbackConfirmSuspectPopup(
                        originalContext,
                        onYes: () => originalContext.read<FeedbackBloc>().add(
                              FeedbackNewInvolvedPersonSelected(
                                newSuspect,
                              ),
                            ),
                        suspect: newSuspect.copyWith(
                          user: user,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: CustomIconButton(
              onTap: context.pop,
              size: 16,
              icon: context.icons.delete_1__remove_add_button_buttons_delete_cross_x_mathematics_multiply_math,
            ),
          ),
        ],
      );
    },
  );
}

class FeedbackFindSuspectPopup extends StatelessWidget {
  const FeedbackFindSuspectPopup({
    super.key,
    this.onTap,
  });

  final void Function(UserEntity)? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Text(
          context.loc.whoIsItQuestion,
          style: context.typography.textlgSemibold.copyWith(
            color: context.colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          context.loc.findStudentByNameOrClass,
          style: context.typography.textsmRegular.copyWith(
            color: context.colors.gray500,
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          decoration: InputDecoration(
            fillColor: context.colors.gray100,
            filled: true,
            prefixIcon: Icon(context.icons.magnifying_glass__glass_search_magnifying),
            hintText: context.loc.findStudent,
          ),
          onChanged: (value) => context.read<FeedbackBloc>().add(
                FeedbackSearchEntered(value),
              ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: BlocBuilder<FeedbackBloc, FeedbackState>(
            buildWhen: (prev, curr) => prev.searchUsers != curr.searchUsers,
            builder: (context, state) {
              final users = state.searchUsers;

              if (users == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (users.isEmpty) {
                return const SizedBox.shrink();
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.loc.foundCount(users.length),
                    style: context.typography.textsmRegular.copyWith(
                      color: context.colors.gray500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Expanded(
                    child: ListView.separated(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        final user = users[index];
                        return FeedbackActionTile(
                          // padding: const EdgeInsets.symmetric(
                          //   vertical: 4,
                          // ),
                          onTap: () {
                            context.pop();
                            onTap?.call(user);
                          },
                          leading: AdaptiveUserAvatar(
                            imageUri: user.imageUrl,
                          ),
                          title: user.fullName,
                          subtitle: "6Б класс",
                          trailing: Text(context.loc.select),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) => const Divider(),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
