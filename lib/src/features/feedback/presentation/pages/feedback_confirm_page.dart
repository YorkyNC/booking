import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/core/widgets/buttons/custom_icon_button.dart';
import 'package:booking/src/core/widgets/padding/default_horizontal_padding.dart';
import 'package:booking/src/features/feedback/presentation/bloc/feedback_bloc.dart';
import 'package:booking/src/features/feedback/presentation/bloc/feedback_event.dart';
import 'package:booking/src/features/feedback/presentation/bloc/feedback_state.dart';
import 'package:booking/src/features/feedback/presentation/components/feedback_app_bar.dart';
import 'package:booking/src/features/feedback/presentation/components/feedback_confirm_involved_person_summary_view.dart';
import 'package:booking/src/features/feedback/presentation/components/feedback_video_sheet_wrapper.dart';
import 'package:booking/src/features/feedback/presentation/popups/feedback_ai_analysis_explanation_popup.dart';
import 'package:booking/src/features/feedback/presentation/popups/feedback_submit_success_popup.dart';

class FeedbackConfirmPage extends StatelessWidget {
  const FeedbackConfirmPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeedbackBloc, FeedbackState>(
      listenWhen: (prev, curr) => prev.submitState != curr.submitState,
      listener: (context, state) {
        if (state.submitState is FeedbackSubmitSuccess) {
          showFeedbackSubmitSuccessPopup(
            context,
            destination: state.destination,
          );
        }
      },
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

        final Widget view;

        if (state.aiAnalysisInProgress) {
          view = Center(
            child: Text(
              context.loc.analysisInProgress,
              style: context.typography.textmdSemibold.copyWith(
                color: context.colors.brand500,
              ),
            ),
          );
        } else if (state.submitState is FeedbackSubmitLoading) {
          view = const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          view = Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DefaultHorizontalPadding(
                  child: Text(
                    context.loc.eventDescription,
                    style: context.typography.textmdSemibold.copyWith(
                      color: context.colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                DefaultHorizontalPadding(
                  child: Text(
                    state.description,
                    style: context.typography.textsmMedium.copyWith(
                      color: context.colors.gray600,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Divider(),
                const SizedBox(height: 8),
                DefaultHorizontalPadding(
                  child: Text(
                    context.loc.involvedPeopleCount(
                      event.involvedPeople.length,
                    ),
                    style: context.typography.textmdSemibold.copyWith(
                      color: context.colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                for (final involvedPerson in state.suspects)
                  FeedbackConfirmInvolvedPersonSummaryView(
                    involvedPerson: involvedPerson,
                  ),
              ],
            ),
          );
        }

        final requestAiAnalysisCallback =
            state.aiAnalysisInProgress || state.aiAnalysisCount == 0 || state.submitState is FeedbackSubmitLoading
                ? null
                : () {
                    context.read<FeedbackBloc>().add(const FeedbackAiAnalysisRequested());
                  };

        return Scaffold(
          appBar: FeedbackAppBar(event: event),
          backgroundColor: context.colors.gray100,
          body: Column(
            children: [
              Expanded(
                child: FeedbackVideoSheetWrapper(
                  thumbnail: thumbnail,
                  event: event,
                  child: view,
                ),
              ),
              const SizedBox(height: 12),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: context.colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DefaultHorizontalPadding(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 12),
                      if (state.aiAnalysisCount != 0)
                        Text(
                          context.loc.attemptsLeft(state.aiAnalysisCount),
                          style: context.typography.textsmMedium.copyWith(
                            color: context.colors.brand500,
                          ),
                          textAlign: TextAlign.center,
                        )
                      else
                        Text(
                          context.loc.attemptsSpent,
                          style: context.typography.textsmMedium.copyWith(
                            color: context.colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: state.aiAnalysisCount == 3
                                ? ElevatedButton(
                                    onPressed: requestAiAnalysisCallback,
                                    child: Text(context.loc.analyzeWithAi),
                                  )
                                : FilledButton(
                                    onPressed: requestAiAnalysisCallback,
                                    child: Text(context.loc.analyzeWithAi),
                                  ),
                          ),
                          const SizedBox(width: 8),
                          CustomIconButton(
                            onTap: () => showFeedbackAiAnalysisExplanationPopup(context),
                            padding: const EdgeInsets.all(9),
                            icon: context.icons.help_question_1__circle_faq_frame_help_info_mark_more_query_question,
                          ),
                        ],
                      ),
                      if (state.aiAnalysisCount != 3) ...[
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: state.submitState is FeedbackSubmitLoading
                              ? null
                              : () => context.read<FeedbackBloc>().add(const FeedbackSubmitted()),
                          child: Text(context.loc.done),
                        ),
                      ],
                      const SizedBox(height: 12),
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
