import 'package:booking/src/core/components/events/domain/models/suspect_entity.dart';
import 'package:booking/src/features/feedback/presentation/bloc/feedback_state.dart';

sealed class FeedbackEvent {
  const FeedbackEvent();
}

class FeedbackEventFetched extends FeedbackEvent {
  final String eventId;

  const FeedbackEventFetched(this.eventId);
}

class FeedbackBecomeResponsiblePressed extends FeedbackEvent {
  const FeedbackBecomeResponsiblePressed();
}

class FeedbackSearchEntered extends FeedbackEvent {
  final String value;

  const FeedbackSearchEntered(this.value);
}

class FeedbackSearchCommitted extends FeedbackEvent {
  final String value;

  const FeedbackSearchCommitted(this.value);
}

class FeedbackNewInvolvedPersonSelected extends FeedbackEvent {
  final SuspectEntity involvedPerson;

  const FeedbackNewInvolvedPersonSelected(this.involvedPerson);
}

class FeedbackInvolvedPersonForgotten extends FeedbackEvent {
  final SuspectEntity involvedPerson;

  const FeedbackInvolvedPersonForgotten(this.involvedPerson);
}

class FeedbackDestinationChanged extends FeedbackEvent {
  final FeedbackDestination destination;

  const FeedbackDestinationChanged(this.destination);
}

class FeedbackDescriptionChanged extends FeedbackEvent {
  final String description;

  const FeedbackDescriptionChanged(this.description);
}

class FeedbackDescriptionVoiceRecorded extends FeedbackEvent {
  final String path;

  const FeedbackDescriptionVoiceRecorded(this.path);
}

class FeedbackSuspectFeedbackChanged extends FeedbackEvent {
  final int index;
  final String feedback;

  const FeedbackSuspectFeedbackChanged(this.index, this.feedback);
}

class FeedbackSuspectFeedbackVoiceRecorded extends FeedbackEvent {
  final int index;
  final String path;

  const FeedbackSuspectFeedbackVoiceRecorded(this.index, this.path);
}

class FeedbackAiAnalysisRequested extends FeedbackEvent {
  const FeedbackAiAnalysisRequested();
}

class FeedbackSubmitted extends FeedbackEvent {
  const FeedbackSubmitted();
}
