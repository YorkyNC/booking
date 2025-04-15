import 'package:booking/src/core/services/auth/models/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/base/base_models/base_entity.dart';

part 'sign_in_response.freezed.dart';
part 'sign_in_response.g.dart';

@freezed
class SignInResponse extends BaseEntity with _$SignInResponse {
  const factory SignInResponse({
    required String accessToken,
    required String refreshToken,
    required UserEntity user,
  }) = _SignInResponse;

  factory SignInResponse.fromJson(Map<String, dynamic> json) => _$SignInResponseFromJson(json);
}
