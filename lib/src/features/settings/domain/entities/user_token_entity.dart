import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/base/base_models/base_entity.dart';
import 'permission_entity.dart';

part 'user_token_entity.freezed.dart';
part 'user_token_entity.g.dart';

@freezed
class UserTokenEntity extends BaseEntity with _$UserTokenEntity {
  const factory UserTokenEntity({
    required String sub,
    required PermissionEntity permissions,
    required int exp,
  }) = _UserTokenEntity;

  factory UserTokenEntity.fromJson(Map<String, dynamic> json) =>
      _$UserTokenEntityFromJson(json);
}
