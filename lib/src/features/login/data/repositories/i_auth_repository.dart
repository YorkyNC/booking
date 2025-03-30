import 'package:fpdart/fpdart.dart';
import 'package:booking/src/core/services/auth/models/sign_in_response.dart';

import '../../../../core/exceptions/domain_exception.dart';
import '../../../../core/services/auth/entities/user_entity.dart';
import '../../../../core/services/auth/models/forgot_password_response.dart';
import '../../../../core/services/auth/models/models.dart';
import '../../../../core/services/auth/models/refresh_token_response.dart';
import '../../../../core/services/auth/models/update_password_request.dart';
import '../../../../core/services/auth/models/update_password_response.dart';

abstract class IAuthRepository {
  Future<Either<DomainException, SignInResponse>> loginUser(
    SignInRequest body,
  );
  Future<Either<DomainException, VerifyResponse>> verifyUser(
    VerifyRequest body,
  );

  Future<Either<DomainException, UserEntity>> getUser();

  Future<Either<DomainException, ForgotPasswordResponse>> forgotPassword(
    ForgotPasswordRequest body,
  );

  Future<Either<DomainException, UpdatePasswordResponse>> updatePassword(
    UpdatePasswordRequest body,
  );

  Future<Either<DomainException, RefreshTokenResponse>> refreshToken();
}
