import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/base/base_models/base_entity.dart';

part 'role_entity.freezed.dart';
part 'role_entity.g.dart';

@freezed
class RoleEntity extends BaseEntity with _$RoleEntity {
  const factory RoleEntity({
    required String title,
    String? childId,
    String? courseId,
  }) = _RoleEntity;

  factory RoleEntity.fromJson(Map<String, dynamic> json) =>
      _$RoleEntityFromJson(json);
}
