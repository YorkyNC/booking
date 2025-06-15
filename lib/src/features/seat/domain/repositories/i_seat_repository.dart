import 'package:booking/src/features/history/domain/enum/entities/get_history_entity.dart';
import 'package:booking/src/features/history/domain/enum/requests/get_history_request.dart';
import 'package:booking/src/features/seat/domain/entities/create_reservation_entity.dart';
import 'package:booking/src/features/seat/domain/entities/seat_item_entity.dart';
import 'package:booking/src/features/seat/domain/requests/create_reservation_request.dart';
import 'package:booking/src/features/seat/domain/requests/repeat_last_request.dart';
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
  Future<Either<DomainException, CreateReservationEntity>> createReservation(
    CreateReservationRequest request,
  );
  Future<Either<DomainException, GetHistoryEntity>> getHistory(
    GetHistoryRequest request,
  );
  Future<Either<DomainException, GetHistoryEntity>> repeatLast(
    RepeatLastRequest request,
  );
}
