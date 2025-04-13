import 'package:booking/src/features/seat/domain/entities/get_all_seat_entity.dart';
import 'package:booking/src/features/seat/domain/requests/get_all_seat_request.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/base/base_usecase/use_case.dart';
import '../../../../core/exceptions/domain_exception.dart';
import '../../data/repositories/seat_repository_impl.dart';
import '../repositories/i_seat_repository.dart';

@lazySingleton
class GetAllSeatUseCase extends UseCase<GetAllSeatEntity, GetAllSeatRequest> {
  final ISeatRepository _repository;

  GetAllSeatUseCase(@Named.from(SeatRepositoryImpl) this._repository);

  @override
  Future<Either<DomainException, GetAllSeatEntity>> execute(GetAllSeatRequest requestModel) {
    return _repository.getAllSeat(requestModel);
  }
}
