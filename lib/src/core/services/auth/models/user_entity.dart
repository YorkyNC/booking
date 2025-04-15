import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/base/base_models/base_entity.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed
class UserEntity extends BaseEntity with _$UserEntity {
  const factory UserEntity({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    Role? role,
    bool? deleted,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) => _$UserEntityFromJson(json);
}

enum Role {
  @JsonValue('STUDENT')
  student,
  @JsonValue('LIBRARIAN')
  librarian,
  @JsonValue('ADMIN')
  admin,
}
