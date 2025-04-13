import 'package:booking/src/features/seat/domain/entities/seat_item_entity.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/base/base_usecase/use_case.dart';
import '../../../../core/exceptions/domain_exception.dart';
import '../../data/repositories/seat_repository_impl.dart';
import '../repositories/i_seat_repository.dart';
import '../requests/get_seat_request.dart';

@lazySingleton
class GetSeatUseCase extends UseCase<SeatItemEntity, GetSeatRequest> {
  final ISeatRepository _repository;

  GetSeatUseCase(@Named.from(SeatRepositoryImpl) this._repository);

  @override
  Future<Either<DomainException, SeatItemEntity>> execute(GetSeatRequest requestModel) {
    return _repository.getSeat(requestModel);
  }
}
