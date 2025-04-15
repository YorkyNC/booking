import 'package:booking/src/features/seat/domain/entities/create_reservation_entity.dart';
import 'package:booking/src/features/seat/domain/requests/create_reservation_request.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/base/base_usecase/use_case.dart';
import '../../../../core/exceptions/domain_exception.dart';
import '../../data/repositories/seat_repository_impl.dart';
import '../repositories/i_seat_repository.dart';

@lazySingleton
class CreateReservationUseCase extends UseCase<CreateReservationEntity, CreateReservationRequest> {
  final ISeatRepository _repository;

  CreateReservationUseCase(@Named.from(SeatRepositoryImpl) this._repository);

  @override
  Future<Either<DomainException, CreateReservationEntity>> execute(CreateReservationRequest requestModel) {
    return _repository.createReservation(requestModel);
  }
}
