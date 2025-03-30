import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/extensions/build_context_extension.dart';
import 'package:booking/src/features/feedback/presentation/bloc/feedback_bloc.dart';
import 'package:booking/src/features/feedback/presentation/bloc/feedback_state.dart';
import 'package:booking/src/features/feedback/presentation/components/feedback_app_bar.dart';
import 'package:booking/src/features/feedback/presentation/components/feedback_assigned_else_view.dart';
import 'package:booking/src/features/feedback/presentation/components/feedback_assigned_me_view.dart';
import 'package:booking/src/features/feedback/presentation/components/feedback_completed_view.dart';
import 'package:booking/src/features/feedback/presentation/components/feedback_initial_pending_view.dart';
import 'package:booking/src/features/feedback/presentation/components/feedback_video_sheet_wrapper.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({
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
        final assignedTo = event.assignedTo;

        final Widget view;

        if (event.completedAt != null) {
          view = FeedbackCompletedView(event: event);
        } else if (assignedTo != null) {
          if (assignedTo.isMe) {
            view = FeedbackAssignedMeView(
              event: event,
              involvedPeople: state.suspects,
            );
          } else {
            view = FeedbackAssignedElseView(assignee: assignedTo);
          }
        } else {
          view = FeedbackInitialPendingView(event: event);
        }

        return Scaffold(
          appBar: FeedbackAppBar(event: event),
          backgroundColor: context.colors.gray100,
          body: Column(
            children: [
              Expanded(
                child: FeedbackVideoSheetWrapper(
                  thumbnail: thumbnail,
                  event: event,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: view,
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
