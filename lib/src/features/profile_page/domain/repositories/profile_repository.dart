import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import '../entities/profile.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]);

  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  const ServerFailure();
}

class CacheFailure extends Failure {
  const CacheFailure();
}

abstract class ProfileRepository {
  Future<Either<Failure, Profile>> getProfile();
  Future<Either<Failure, void>> updateNotificationSettings(
      NotificationSettings settings);
  Future<Either<Failure, void>> updateCurrentRole(Role role);
}
