import 'package:fpdart/fpdart.dart';

import '../../domain/entities/profile.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_data_source.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDataSource dataSource;

  ProfileRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, Profile>> getProfile() async {
    try {
      final profile = await dataSource.getProfile();
      return right(profile);
    } catch (e) {
      return left(const ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateNotificationSettings(
      NotificationSettings settings) async {
    try {
      await dataSource.updateNotificationSettings(settings);
      return right(null);
    } catch (e) {
      return left(const ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateCurrentRole(Role role) async {
    try {
      await dataSource.updateCurrentRole(role);
      return right(null);
    } catch (e) {
      return left(const ServerFailure());
    }
  }
}
