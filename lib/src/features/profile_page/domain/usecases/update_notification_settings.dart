import 'package:fpdart/fpdart.dart';

import '../entities/profile.dart';
import '../repositories/profile_repository.dart';

class UpdateNotificationSettings {
  final ProfileRepository repository;

  UpdateNotificationSettings(this.repository);

  Future<Either<Failure, void>> call(NotificationSettings settings) async {
    return await repository.updateNotificationSettings(settings);
  }
}
