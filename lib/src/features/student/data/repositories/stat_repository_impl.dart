import 'dart:developer' as developer;

import 'package:booking/src/features/student/domain/entities/get_stat_entity.dart';
import 'package:booking/src/features/student/domain/requests/get_stat_request.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/exceptions/domain_exception.dart';
import '../../domain/repositories/i_stat_repository.dart';
import '../datasources/remote/i_stat_remote.dart';
import '../datasources/remote/stat_remote_impl.dart';

@named
@LazySingleton(as: IStatRepository)
class StatRepositoryImpl implements IStatRepository {
  final IStatRemote _statImpl;
  StatRepositoryImpl(@Named.from(StatRemoteImpl) this._statImpl);

  @override
  Future<Either<DomainException, GetStatEntity>> getStat(GetStatRequest request) async {
    developer.log('Getting statistics for request: $request', name: 'StatRepositoryImpl');

    try {
      final result = await _statImpl.getStat(request);

      return result.fold(
        (error) {
          developer.log('Error in repository while getting statistics: ${error.message}',
              name: 'StatRepositoryImpl', error: error);
          return Left(error);
        },
        (statEntity) {
          developer.log('Successfully retrieved statistics: $statEntity', name: 'StatRepositoryImpl');
          return Right(statEntity);
        },
      );
    } catch (e) {
      developer.log('Unexpected error in repository: $e', name: 'StatRepositoryImpl', error: e);
      return Left(UnknownException(message: 'Repository error: $e'));
    }
  }
}
