import 'package:booking/src/core/services/auth/models/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/base/base_models/base_entity.dart';

part 'sign_up_response.freezed.dart';
part 'sign_up_response.g.dart';

@freezed
class SignUpResponse extends BaseEntity with _$SignUpResponse {
  const factory SignUpResponse({
    required String accessToken,
    required String refreshToken,
    required UserEntity user,
  }) = _SignUpResponse;

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => _$SignUpResponseFromJson(json);
}
