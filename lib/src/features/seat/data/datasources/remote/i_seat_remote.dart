import 'package:booking/src/features/seat/domain/entities/get_all_seat_entity.dart';
import 'package:booking/src/features/seat/domain/entities/seat_item_entity.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../core/exceptions/domain_exception.dart';
import '../../../domain/requests/get_all_seat_request.dart';
import '../../../domain/requests/get_seat_request.dart';

abstract class ISeatRemote {
  Future<Either<DomainException, GetAllSeatEntity>> getAllSeat(
    GetAllSeatRequest file,
  );

  Future<Either<DomainException, SeatItemEntity>> getSeat(
    GetSeatRequest request,
  );
}
