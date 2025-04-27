import 'package:booking/src/features/student/domain/entities/get_stat_entity.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/base/base_usecase/use_case.dart';
import '../../../../core/exceptions/domain_exception.dart';
import '../../data/repositories/stat_repository_impl.dart';
import '../repositories/i_stat_repository.dart';
import '../requests/get_stat_request.dart';

@lazySingleton
class GetStatUseCase extends UseCase<GetStatEntity, GetStatRequest> {
  final IStatRepository _repository;

  GetStatUseCase(@Named.from(StatRepositoryImpl) this._repository);

  @override
  Future<Either<DomainException, GetStatEntity>> execute(GetStatRequest requestModel) {
    return _repository.getStat(requestModel);
  }
}
