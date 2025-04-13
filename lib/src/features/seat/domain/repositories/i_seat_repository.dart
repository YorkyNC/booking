import 'package:booking/src/features/seat/domain/entities/seat_item_entity.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/exceptions/domain_exception.dart';
import '../entities/get_all_seat_entity.dart';
import '../requests/get_all_seat_request.dart';
import '../requests/get_seat_request.dart';

abstract class ISeatRepository {
  Future<Either<DomainException, GetAllSeatEntity>> getAllSeat(
    GetAllSeatRequest request,
  );

  Future<Either<DomainException, SeatItemEntity>> getSeat(
    GetSeatRequest request,
  );
}
