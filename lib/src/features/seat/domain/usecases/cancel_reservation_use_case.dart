import 'package:booking/src/features/history/domain/enum/entities/get_history_entity.dart';
import 'package:booking/src/features/seat/domain/requests/cancel_reservation_request.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/base/base_usecase/use_case.dart';
import '../../../../core/exceptions/domain_exception.dart';
import '../../data/repositories/seat_repository_impl.dart';
import '../repositories/i_seat_repository.dart';

@lazySingleton
class CancelReservationUseCase extends UseCase<GetHistoryEntity, CancelReservationRequest> {
  final ISeatRepository _repository;

  CancelReservationUseCase(@Named.from(SeatRepositoryImpl) this._repository);

  @override
  Future<Either<DomainException, GetHistoryEntity>> execute(CancelReservationRequest requestModel) {
    return _repository.cancelReservation(requestModel);
  }
}
