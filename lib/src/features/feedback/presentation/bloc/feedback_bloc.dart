import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:booking/src/core/components/events/domain/models/event_entity.dart';
import 'package:booking/src/core/components/events/domain/models/summary_highlight_entity.dart';
import 'package:booking/src/core/components/users/domain/models/user_entity.dart';
import 'package:booking/src/features/feedback/presentation/bloc/feedback_event.dart';
import 'package:booking/src/features/feedback/presentation/bloc/feedback_state.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

@injectable
class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  FeedbackBloc({
    @factoryParam required String eventId,
    @factoryParam EventEntity? event,
  }) : super(
          FeedbackState(
            event: event,
            suspects: event?.involvedPeople ?? [],
            submitState: FeedbackSubmitInitial(),
            voiceProcessingState: FeedbackSubmitInitial(),
          ),
        ) {
    _setupHandlers();
    add(FeedbackEventFetched(eventId));
  }

  void _setupHandlers() {
    on<FeedbackEventFetched>(_fetchData);
    on<FeedbackBecomeResponsiblePressed>(_becomeResponsible);
    on<FeedbackSearchEntered>(_searchEntered);
    on<FeedbackSearchCommitted>(_searchCommitted);
    on<FeedbackNewInvolvedPersonSelected>(_addInvolvedPerson);
    on<FeedbackInvolvedPersonForgotten>(_forgetInvolvedPersonUser);
    on<FeedbackDestinationChanged>(_destinationChanged);
    on<FeedbackDescriptionChanged>(_descriptionChanged);
    on<FeedbackDescriptionVoiceRecorded>(_descriptionVoiceRecorded);
    on<FeedbackSuspectFeedbackChanged>(_suspectFeedbackChanged);
    on<FeedbackSuspectFeedbackVoiceRecorded>(_suspectFeedbackVoiceRecorded);
    on<FeedbackAiAnalysisRequested>(_performAiAnalysis);
    on<FeedbackSubmitted>(_submitFeedback);
  }

  Timer? _timer;

  Future<void> _fetchData(
    FeedbackEventFetched _,
    Emitter<FeedbackState> emit,
  ) async {
    final stateEvent = state.event;
    if (stateEvent == null) {
      //TODO fetch from backend
      return;
    }
    final thumbnail = await VideoThumbnail.thumbnailData(video: stateEvent.videoUrl);
    if (thumbnail != null) {
      emit(
        state.copyWith(
          thumbnail: thumbnail,
          suspects: stateEvent.involvedPeople,
        ),
      );
    }
  }

  Future<void> _becomeResponsible(
    FeedbackBecomeResponsiblePressed _,
    Emitter<FeedbackState> emit,
  ) async {
    final stateEvent = state.event;
    if (stateEvent == null) {
      return;
    }
    emit(state.copyWith(event: null));
    await Future.delayed(const Duration(seconds: 2));
    emit(
      state.copyWith(
        event: stateEvent.copyWith(
          assignedTo: UserEntity(
            id: "00000",
            fullName: "Айсин Арсен Амирович",
            imageUrl: "https://raw.githubusercontent.com/Tosemite/miscellaneous/refs/heads/main/arsen.jpg",
            isMe: true,
          ),
        ),
      ),
    );
  }

  Future<void> _searchEntered(
    FeedbackSearchEntered event,
    Emitter<FeedbackState> emit,
  ) async {
    if (event.value.isEmpty) {
      emit(state.copyWith(
        searchUsers: [],
      ));
      return;
    }
    emit(state.copyWith(
      searchUsers: null,
    ));
    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 1), () {
      add(FeedbackSearchCommitted(event.value));
    });
  }

  Future<void> _searchCommitted(
    FeedbackSearchCommitted event,
    Emitter<FeedbackState> emit,
  ) async {
    emit(state.copyWith(
      searchUsers: [
        UserEntity(
          id: "id",
          fullName: "Светлана М.",
          imageUrl: "https://www.figma.com/file/533ZGNgNx1Aidsq043LbYz/image/8b992350d9dfa1255edcdc51696bc89aa4ad826f",
        ),
        UserEntity(
          id: "id2",
          fullName: "Ертулеу Б.",
          imageUrl: "https://www.figma.com/file/533ZGNgNx1Aidsq043LbYz/image/9b4d87e445628b6c120b8962ff6e5b864e1e6660",
        ),
      ]
          .where(
            (e) => e.fullName.contains(
              event.value,
            ),
          )
          .toList(),
    ));
  }

  Future<void> _addInvolvedPerson(
    FeedbackNewInvolvedPersonSelected event,
    Emitter<FeedbackState> emit,
  ) async {
    final involvedPeople = state.suspects.toList();
    involvedPeople.removeWhere((e) => e.id == event.involvedPerson.id);
    involvedPeople.add(event.involvedPerson);
    emit(
      state.copyWith(
        suspects: involvedPeople,
      ),
    );
  }

  Future<void> _forgetInvolvedPersonUser(
    FeedbackInvolvedPersonForgotten event,
    Emitter<FeedbackState> emit,
  ) async {
    final involvedPeople = state.suspects.toList();
    involvedPeople.removeWhere((e) => e.id == event.involvedPerson.id);
    involvedPeople.add(
      event.involvedPerson.copyWith(
        user: null,
      ),
    );
    emit(
      state.copyWith(
        suspects: involvedPeople,
      ),
    );
  }

  Future<void> _destinationChanged(
    FeedbackDestinationChanged event,
    Emitter<FeedbackState> emit,
  ) async {
    emit(
      state.copyWith(
        destination: event.destination,
      ),
    );
  }

  Future<void> _descriptionChanged(
    FeedbackDescriptionChanged event,
    Emitter<FeedbackState> emit,
  ) async {
    emit(
      state.copyWith(
        description: event.description,
      ),
    );
  }

  Future<void> _descriptionVoiceRecorded(
    FeedbackDescriptionVoiceRecorded event,
    Emitter<FeedbackState> emit,
  ) async {
    emit(state.copyWith(voiceProcessingState: FeedbackSubmitLoading()));
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(voiceProcessingState: FeedbackSubmitSuccess()));
    add(FeedbackDescriptionChanged("${state.description}\nТекст из голоса"));
  }

  Future<void> _suspectFeedbackChanged(
    FeedbackSuspectFeedbackChanged event,
    Emitter<FeedbackState> emit,
  ) async {
    final suspects = state.suspects.toList();
    suspects[event.index] = suspects[event.index].copyWith(description: event.feedback);
    emit(
      state.copyWith(suspects: suspects),
    );
  }

  Future<void> _suspectFeedbackVoiceRecorded(
    FeedbackSuspectFeedbackVoiceRecorded event,
    Emitter<FeedbackState> emit,
  ) async {
    emit(state.copyWith(voiceProcessingState: FeedbackSubmitLoading()));
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(voiceProcessingState: FeedbackSubmitSuccess()));
    add(
      FeedbackSuspectFeedbackChanged(
        event.index,
        "${state.description}\nТекст из голоса",
      ),
    );
  }

  Future<void> _performAiAnalysis(
    FeedbackAiAnalysisRequested _,
    Emitter<FeedbackState> emit,
  ) async {
    if (state.aiAnalysisCount == 0 || state.aiAnalysisInProgress) return;
    emit(state.copyWith(aiAnalysisInProgress: true));
    await Future.delayed(const Duration(seconds: 1));
    final suspects = state.suspects.toList();
    for (int i = 0; i < suspects.length; i++) {
      suspects[i] = suspects[i].copyWith(
        highlights: [
          SummaryHighlightEntity(
            title: "Социальная информация",
            content: "Текст описание обработанное ИИ",
          ),
          SummaryHighlightEntity(
            title: "Еще пункт",
            content: "Текст описание обработанное ИИ",
          ),
          SummaryHighlightEntity(
            title: "Еще пункт",
            content: "Текст описание обработанное ИИ",
          ),
        ],
      );
    }
    emit(
      state.copyWith(
        suspects: suspects,
        aiAnalysisInProgress: false,
        aiAnalysisCount: state.aiAnalysisCount - 1,
      ),
    );
  }

  Future<void> _submitFeedback(
    FeedbackSubmitted _,
    Emitter<FeedbackState> emit,
  ) async {
    if (state.submitState is FeedbackSubmitLoading) return;
    emit(state.copyWith(submitState: FeedbackSubmitLoading()));
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(submitState: FeedbackSubmitSuccess()));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
