import 'package:booking/src/features/history/domain/enum/entities/get_history_entity.dart';
import 'package:booking/src/features/history/domain/enum/repositories/i_history_repository.dart';
import 'package:booking/src/features/history/domain/enum/requests/get_history_request.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/base/base_usecase/use_case.dart';
import '../../../../core/exceptions/domain_exception.dart';
import '../../data/repositories/history_repository_impl.dart';

@lazySingleton
class GetHistoryUseCase extends UseCase<GetHistoryList, GetHistoryRequest> {
  final IHistoryRepository _repository;

  GetHistoryUseCase(@Named.from(HistoryRepositoryImpl) this._repository);

  @override
  Future<Either<DomainException, GetHistoryList>> execute(GetHistoryRequest requestModel) {
    return _repository.getHistory(requestModel);
  }
}
