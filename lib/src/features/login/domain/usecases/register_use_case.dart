import 'package:booking/src/core/services/auth/models/sign_up_request.dart';
import 'package:booking/src/core/services/auth/models/sign_up_response.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/base/base_usecase/use_case.dart';
import '../../../../core/exceptions/domain_exception.dart';
import '../../data/repositories/i_auth_repository.dart';
import '../repositories/auth_repository_impl.dart';

@lazySingleton
class RegisterUseCase extends UseCase<SignUpResponse, SignUpRequest> {
  final IAuthRepository _authRepository;

  RegisterUseCase(@Named.from(AuthRepositoryImpl) this._authRepository);

  @override
  Future<Either<DomainException, SignUpResponse>> execute(SignUpRequest requestModel) async =>
      _authRepository.register(requestModel);
}
