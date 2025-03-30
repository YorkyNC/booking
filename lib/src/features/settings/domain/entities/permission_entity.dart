import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/base/base_models/base_entity.dart';
import 'school_entity.dart';

part 'permission_entity.freezed.dart';
part 'permission_entity.g.dart';

@freezed
class PermissionEntity extends BaseEntity with _$PermissionEntity {
  const factory PermissionEntity({
    required List<SchoolEntity> schools,
  }) = _PermissionEntity;

  factory PermissionEntity.fromJson(Map<String, dynamic> json) => _$PermissionEntityFromJson(json);
}
