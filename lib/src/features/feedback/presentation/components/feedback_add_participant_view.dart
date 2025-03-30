import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking/src/app/imports.dart';
import 'package:booking/src/core/components/events/domain/models/event_entity.dart';
import 'package:booking/src/core/components/events/domain/models/suspect_entity.dart';
import 'package:booking/src/features/feedback/presentation/bloc/feedback_bloc.dart';
import 'package:booking/src/features/feedback/presentation/bloc/feedback_event.dart';
import 'package:booking/src/features/feedback/presentation/components/feedback_add_participant_crop_frame_view.dart';
import 'package:booking/src/features/feedback/presentation/components/feedback_add_participant_select_frame_view.dart';
import 'package:uuid/uuid.dart';

class FeedbackAddParticipantView extends StatefulWidget {
  const FeedbackAddParticipantView({
    super.key,
    required this.event,
  });

  final EventEntity event;

  @override
  State<FeedbackAddParticipantView> createState() => _FeedbackAddParticipantViewState();
}

class _FeedbackAddParticipantViewState extends State<FeedbackAddParticipantView> {
  String? framePath;

  void _onFrameSelected(String frame) {
    setState(() {
      framePath = frame;
    });
  }

  void _onFrameCropped(String croppedFrame) {
    context.read<FeedbackBloc>().add(
          FeedbackNewInvolvedPersonSelected(
            SuspectEntity(
              id: const Uuid().v4(),
              imageUrl: "file://$croppedFrame",
            ),
          ),
        );
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final framePath = this.framePath;
    return framePath == null
        ? FeedbackAddParticipantSelectFrameView(
            videoUrl: widget.event.videoUrl,
            onFrameSelected: _onFrameSelected,
          )
        : FeedbackAddParticipantCropFrameView(
            imageUrl: framePath,
            onImageCropped: _onFrameCropped,
          );
  }
}
