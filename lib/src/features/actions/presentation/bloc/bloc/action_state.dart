part of 'action_bloc.dart';

@freezed
class ActionState with _$ActionState {
  const factory ActionState.initial() = _Initial;
  const factory ActionState.loading() = _Loading;
  const factory ActionState.loaded(List<ActionEntity> actions) = _Loaded;
  const factory ActionState.error(String message) = _Error;

  const ActionState._();

  List<ActionEntity>? get actions => maybeMap(
        loaded: (state) => state.actions,
        orElse: () => null,
      );
}
