import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:booking/src/core/components/events/domain/models/event_entity.dart';
import 'package:booking/src/core/components/events/domain/models/suspect_entity.dart';
import 'package:booking/src/core/components/users/domain/models/user_entity.dart';

part 'feedback_state.freezed.dart';

@freezed
class FeedbackState with _$FeedbackState {
  factory FeedbackState({
    EventEntity? event,
    Uint8List? thumbnail,
    @Default([]) List<SuspectEntity> suspects,
    @Default([]) List<UserEntity>? searchUsers,
    @Default(FeedbackDestination.parent) FeedbackDestination destination,
    @Default("") String description,
    @Default(3) int aiAnalysisCount,
    @Default(false) bool aiAnalysisInProgress,
    required FeedbackSubmitState submitState,
    required FeedbackSubmitState voiceProcessingState,
  }) = _FeedbackState;
}

enum FeedbackDestination {
  student,
  parent;
}

@freezed
class FeedbackSubmitState with _$FeedbackSubmitState {
  factory FeedbackSubmitState.initial() = FeedbackSubmitInitial;
  factory FeedbackSubmitState.loading() = FeedbackSubmitLoading;
  factory FeedbackSubmitState.success() = FeedbackSubmitSuccess;
}
