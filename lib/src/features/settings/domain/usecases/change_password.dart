import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:booking/src/core/error/failures.dart';
import 'package:booking/src/core/services/auth/models/update_password_request.dart';
import 'package:booking/src/core/services/auth/models/update_password_response.dart';
import 'package:booking/src/features/login/data/repositories/i_auth_repository.dart';

@lazySingleton
class ChangePassword {
  final IAuthRepository repository;

  ChangePassword(this.repository);

  Future<Either<Failure, UpdatePasswordResponse>> call(String newPassword) async {
    try {
      final result = await repository.updatePassword(
        UpdatePasswordRequest(password: newPassword),
      );

      return result.fold(
        (error) => Left(AuthFailure(error.message)),
        (response) => Right(response),
      );
    } catch (e) {
      return Left(AuthFailure(e.toString()));
    }
  }
}
