import 'package:booking/src/features/history/domain/enum/entities/get_history_entity.dart';
import 'package:booking/src/features/history/domain/enum/requests/get_history_request.dart';
import 'package:booking/src/features/seat/data/repositories/seat_repository_impl.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/base/base_usecase/use_case.dart';
import '../../../../core/exceptions/domain_exception.dart';
import '../repositories/i_seat_repository.dart';

@lazySingleton
class GetHistoryUseCase extends UseCase<GetHistoryEntity, GetHistoryRequest> {
  final ISeatRepository _repository;

  GetHistoryUseCase(@Named.from(SeatRepositoryImpl) this._repository);

  @override
  Future<Either<DomainException, GetHistoryEntity>> execute(GetHistoryRequest requestModel) {
    return _repository.getHistory(requestModel);
  }
}
