import 'package:freezed_annotation/freezed_annotation.dart';

part 'action_entity.freezed.dart';

enum ActionType { entered, left }

enum ActionContext { beforeLesson, duringLesson, duringBreak, afterLesson }

@freezed
class ActionEntity with _$ActionEntity {
  factory ActionEntity({
    required String id,
    required DateTime createdAt,
    required ActionType actionType,
    required ActionContext actionContext,
    String? lessonName,
  }) = _ActionEntity;
}
