import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:booking/src/features/class/domain/entity/class_entity.dart';

part 'class_state.freezed.dart';

@freezed
class ClassState with _$ClassState {
  factory ClassState({
    List<ClassEntity>? classes,
  }) = _ClassState;
}
