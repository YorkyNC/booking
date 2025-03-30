import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/router/router.dart';
import 'package:booking/src/core/widgets/padding/default_horizontal_padding.dart';
import 'package:booking/src/features/feedback/presentation/bloc/feedback_bloc.dart';
import 'package:booking/src/features/feedback/presentation/bloc/feedback_event.dart';
import 'package:booking/src/features/feedback/presentation/bloc/feedback_state.dart';
import 'package:booking/src/features/feedback/presentation/components/feedback_app_bar.dart';
import 'package:booking/src/features/feedback/presentation/components/feedback_steps_app_bar.dart';
import 'package:booking/src/features/feedback/presentation/components/feedback_text_audio_input_view.dart';
import 'package:booking/src/features/feedback/presentation/components/feedback_video_sheet_wrapper.dart';

class FeedbackCreateDescriptionPage extends StatelessWidget {
  const FeedbackCreateDescriptionPage({
    super.key,
  });

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

        return Scaffold(
          appBar: FeedbackStepsAppBar(
            event: event,
            subtitle: context.loc.stepFrom(
              1,
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
                  child: DefaultHorizontalPadding(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: state.voiceProcessingState is! FeedbackSubmitLoading
                              ? FeedbackTextAudioInputView(
                                  initialValue: state.description,
                                  hintText: context.loc.describeIncidentInGeneral,
                                  onTextChanged: (value) =>
                                      context.read<FeedbackBloc>().add(FeedbackDescriptionChanged(value)),
                                  onAudioRecorded: (path) => context.read<FeedbackBloc>().add(
                                        FeedbackDescriptionVoiceRecorded(
                                          path,
                                        ),
                                      ),
                                )
                              : const Center(
                                  child: CircularProgressIndicator(),
                                ),
                        ),
                        const SizedBox(height: 2),
                        if (state.description.isNotEmpty) ...[
                          FilledButton.icon(
                            onPressed: () => context.push(
                              "${RoutePaths.feedback}/${event.id}/${RoutePaths.suspectFeedback}/0",
                            ),
                            iconAlignment: IconAlignment.end,
                            icon: Icon(context.icons.chevron_right),
                            label: Text(
                              context.loc.next,
                            ),
                          ),
                          const SizedBox(height: 10),
                        ]
                      ],
                    ),
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
