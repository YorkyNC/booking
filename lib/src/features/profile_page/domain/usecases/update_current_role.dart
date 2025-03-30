import 'package:fpdart/fpdart.dart';

import '../entities/profile.dart';
import '../repositories/profile_repository.dart';

class UpdateCurrentRole {
  final ProfileRepository repository;

  UpdateCurrentRole(this.repository);

  Future<Either<Failure, void>> call(Role role) async {
    return await repository.updateCurrentRole(role);
  }
}
