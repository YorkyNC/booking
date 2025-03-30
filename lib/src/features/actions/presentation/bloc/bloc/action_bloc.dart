import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:booking/src/features/actions/domain/models/action_entity.dart';

part 'action_bloc.freezed.dart';
part 'action_event.dart';
part 'action_state.dart';

@injectable
class ActionBloc extends Bloc<ActionEvent, ActionState> {
  ActionBloc() : super(const ActionState.initial()) {
    on<_Started>((event, emit) {
      emit(ActionState.loaded(_generateMockActions()));
    });

    // Trigger loading of actions when bloc is created
    add(const ActionEvent.started());
  }

  List<ActionEntity> _generateMockActions() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    return [
      // Today's actions
      ActionEntity(
        id: '1',
        createdAt: today.add(const Duration(hours: 8, minutes: 10)),
        actionType: ActionType.entered,
        actionContext: ActionContext.beforeLesson,
      ),
      ActionEntity(
        id: '2',
        createdAt: today.add(const Duration(hours: 9, minutes: 37)),
        actionType: ActionType.left,
        actionContext: ActionContext.duringBreak,
      ),
      ActionEntity(
        id: '3',
        createdAt: today.add(const Duration(hours: 9, minutes: 45)),
        actionType: ActionType.entered,
        actionContext: ActionContext.duringBreak,
      ),
      ActionEntity(
        id: '4',
        createdAt: today.add(const Duration(hours: 11, minutes: 37)),
        actionType: ActionType.left,
        actionContext: ActionContext.duringLesson,
        lessonName: 'История Казахстана',
      ),
      ActionEntity(
        id: '5',
        createdAt: today.add(const Duration(hours: 11, minutes: 45)),
        actionType: ActionType.entered,
        actionContext: ActionContext.duringLesson,
        lessonName: 'История Казахстана',
      ),
      ActionEntity(
        id: '6',
        createdAt: today.add(const Duration(hours: 15, minutes: 52)),
        actionType: ActionType.left,
        actionContext: ActionContext.afterLesson,
      ),

      // Yesterday's actions
      ActionEntity(
        id: '7',
        createdAt: yesterday.add(const Duration(hours: 8, minutes: 10)),
        actionType: ActionType.entered,
        actionContext: ActionContext.beforeLesson,
      ),
      ActionEntity(
        id: '8',
        createdAt: yesterday.add(const Duration(hours: 15, minutes: 52)),
        actionType: ActionType.left,
        actionContext: ActionContext.afterLesson,
      ),

      // 12.03.2025
      ActionEntity(
        id: '9',
        createdAt: DateTime(2025, 3, 12),
        actionType: ActionType.entered,
        actionContext: ActionContext.beforeLesson,
      ),
      ActionEntity(
        id: '10',
        createdAt: DateTime(2025, 3, 12),
        actionType: ActionType.left,
        actionContext: ActionContext.afterLesson,
      ),
      ActionEntity(
        id: '11',
        createdAt: DateTime(2025, 3, 12),
        actionType: ActionType.entered,
        actionContext: ActionContext.beforeLesson,
      ),
      ActionEntity(
        id: '12',
        createdAt: DateTime(2025, 3, 12),
        actionType: ActionType.left,
        actionContext: ActionContext.afterLesson,
      ),

      //11.03.2025
      ActionEntity(
        id: '13',
        createdAt: DateTime(2025, 3, 11),
        actionType: ActionType.entered,
        actionContext: ActionContext.beforeLesson,
      ),
      ActionEntity(
        id: '14',
        createdAt: DateTime(2025, 3, 11),
        actionType: ActionType.left,
        actionContext: ActionContext.afterLesson,
      ),
      ActionEntity(
        id: '15',
        createdAt: DateTime(2025, 3, 11),
        actionType: ActionType.entered,
        actionContext: ActionContext.beforeLesson,
      ),
      ActionEntity(
        id: '16',
        createdAt: DateTime(2025, 3, 11),
        actionType: ActionType.left,
        actionContext: ActionContext.afterLesson,
      ),

      // 10.03.2025
      ActionEntity(
        id: '17',
        createdAt: DateTime(2025, 3, 10),
        actionType: ActionType.entered,
        actionContext: ActionContext.beforeLesson,
      ),

      // 09.03.2025
      ActionEntity(
        id: '18',
        createdAt: DateTime(2025, 3, 9),
        actionType: ActionType.entered,
        actionContext: ActionContext.beforeLesson,
      ),
      ActionEntity(
        id: '19',
        createdAt: DateTime(2025, 3, 9),
        actionType: ActionType.left,
        actionContext: ActionContext.afterLesson,
      ),
      ActionEntity(
        id: '20',
        createdAt: DateTime(2025, 3, 9),
        actionType: ActionType.entered,
        actionContext: ActionContext.beforeLesson,
      ),
    ];
  }
}
