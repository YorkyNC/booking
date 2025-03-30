import 'package:fpdart/fpdart.dart';
import 'package:booking/src/core/services/auth/entities/user_entity.dart';
import 'package:booking/src/core/services/auth/models/sign_in_response.dart';
import 'package:booking/src/core/services/auth/models/update_password_request.dart';
import 'package:booking/src/core/services/auth/models/update_password_response.dart';

import '../../exceptions/domain_exception.dart';
import 'models/forgot_password_request.dart';
import 'models/forgot_password_response.dart';
import 'models/refresh_token_response.dart';
import 'models/sign_in_request.dart';
import 'models/verify_request.dart';
import 'models/verify_response.dart';

abstract class IAuthService {
  Future<Either<DomainException, SignInResponse>> loginUser(SignInRequest body);
  Future<Either<DomainException, VerifyResponse>> verifyUser(VerifyRequest request);

  Future<Either<DomainException, UserEntity>> getUser();

  Future<Either<DomainException, RefreshTokenResponse>> refreshToken();

  Future<Either<DomainException, ForgotPasswordResponse>> forgotPassword(ForgotPasswordRequest request);

  Future<Either<DomainException, UpdatePasswordResponse>> updatePassword(UpdatePasswordRequest request);
}
