import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/router/router.dart';
import 'package:booking/src/core/widgets/padding/default_horizontal_padding.dart';
import 'package:booking/src/features/feedback/presentation/bloc/feedback_bloc.dart';
import 'package:booking/src/features/feedback/presentation/bloc/feedback_event.dart';
import 'package:booking/src/features/feedback/presentation/bloc/feedback_state.dart';
import 'package:booking/src/features/feedback/presentation/components/feedback_app_bar.dart';
import 'package:booking/src/features/feedback/presentation/components/feedback_confirm_suspect_tile.dart';
import 'package:booking/src/features/feedback/presentation/components/feedback_steps_app_bar.dart';
import 'package:booking/src/features/feedback/presentation/components/feedback_text_audio_input_view.dart';
import 'package:booking/src/features/feedback/presentation/components/feedback_video_sheet_wrapper.dart';

class FeedbackCreateSuspectFeedbackPage extends StatelessWidget {
  const FeedbackCreateSuspectFeedbackPage({
    super.key,
    required this.suspectIndex,
  });

  final int suspectIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedbackBloc, FeedbackState>(
      builder: (context, state) {
        final event = state.event;
        final thumbnail = state.thumbnail;
        if (event == null) {
          return Scaffold(
            backgroundColor: context.colors.gray100,
            appBar: const FeedbackAppBar(
              event: null,
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        final pushPath = state.suspects.length - 1 == suspectIndex
            ? "${RoutePaths.feedback}/${event.id}/${RoutePaths.confirm}"
            : "${RoutePaths.feedback}/${event.id}/${RoutePaths.suspectFeedback}/${suspectIndex + 1}";

        final suspect = state.suspects[suspectIndex];

        return Scaffold(
          appBar: FeedbackStepsAppBar(
            event: event,
            subtitle: context.loc.stepFrom(
              suspectIndex + 2,
              state.suspects.length + 2,
            ),
          ),
          backgroundColor: context.colors.gray100,
          body: Column(
            children: [
              Expanded(
                child: FeedbackVideoSheetWrapper(
                  thumbnail: thumbnail,
                  event: event,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      FeedbackConfirmSuspectTile(
                        suspect: suspect,
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: DefaultHorizontalPadding(
                          child: state.voiceProcessingState is! FeedbackSubmitLoading
                              ? FeedbackTextAudioInputView(
                                  initialValue: suspect.description,
                                  onTextChanged: (value) => context.read<FeedbackBloc>().add(
                                        FeedbackSuspectFeedbackChanged(
                                          suspectIndex,
                                          value,
                                        ),
                                      ),
                                  onAudioRecorded: (path) => context.read<FeedbackBloc>().add(
                                        FeedbackSuspectFeedbackVoiceRecorded(
                                          suspectIndex,
                                          path,
                                        ),
                                      ),
                                  hintText: switch (state.destination) {
                                    FeedbackDestination.student => context.loc.giveFeedbackToStudent,
                                    FeedbackDestination.parent => context.loc.giveFeedbackToParent,
                                  },
                                )
                              : const Center(
                                  child: CircularProgressIndicator(),
                                ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      if (suspect.description?.isNotEmpty ?? false) ...[
                        DefaultHorizontalPadding(
                          child: Row(
                            children: [
                              Expanded(
                                child: OutlinedButton.icon(
                                  onPressed: context.pop,
                                  icon: Icon(context.icons.chevron_left),
                                  label: Text(context.loc.back),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: FilledButton.icon(
                                  onPressed: () {
                                    context.push(pushPath);
                                  },
                                  iconAlignment: IconAlignment.end,
                                  icon: Icon(context.icons.chevron_right),
                                  label: Text(context.loc.next),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: MediaQuery.paddingOf(context).bottom,
                color: context.colors.white,
              ),
            ],
          ),
        );
      },
    );
  }
}
