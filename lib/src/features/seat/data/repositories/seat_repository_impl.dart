import 'dart:developer';

import 'package:booking/src/features/history/domain/enum/entities/get_history_entity.dart';
import 'package:booking/src/features/history/domain/enum/requests/get_history_request.dart';
import 'package:booking/src/features/seat/domain/entities/create_reservation_entity.dart';
import 'package:booking/src/features/seat/domain/entities/seat_item_entity.dart';
import 'package:booking/src/features/seat/domain/requests/create_reservation_request.dart';
import 'package:booking/src/features/seat/domain/requests/repeat_last_request.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/exceptions/domain_exception.dart';
import '../../domain/entities/get_all_seat_entity.dart';
import '../../domain/repositories/i_seat_repository.dart';
import '../../domain/requests/get_all_seat_request.dart';
import '../../domain/requests/get_seat_request.dart';
import '../datasources/remote/i_seat_remote.dart';
import '../datasources/remote/seat_remote_impl.dart';

@named
@LazySingleton(as: ISeatRepository)
class SeatRepositoryImpl implements ISeatRepository {
  final ISeatRemote _seatImpl;
  SeatRepositoryImpl(@Named.from(SeatRemoteImpl) this._seatImpl);

  @override
  Future<Either<DomainException, GetAllSeatEntity>> getAllSeat(GetAllSeatRequest file) async {
    try {
      final requests = await _seatImpl.getAllSeat(file);

      return requests.fold(
        (error) => Left(error),
        (result) {
          return Right(result);
        },
      );
    } catch (e) {
      log(e.toString());
      return Left(UnknownException(message: e.toString()));
    }
  }

  @override
  Future<Either<DomainException, GetHistoryEntity>> getHistory(GetHistoryRequest request) async {
    try {
      final requests = await _seatImpl.getHistory(request);

      return requests.fold(
        (error) => Left(error),
        (result) {
          return Right(result);
        },
      );
    } catch (e) {
      log(e.toString());
      return Left(UnknownException(message: e.toString()));
    }
  }

  @override
  Future<Either<DomainException, SeatItemEntity>> getSeat(GetSeatRequest request) async {
    try {
      final requests = await _seatImpl.getSeat(request);

      return requests.fold(
        (error) => Left(error),
        (response) {
          final SeatItemEntity result = response;

          return Right(result);
        },
      );
    } catch (e) {
      log(e.toString());
      return Left(UnknownException(message: e.toString()));
    }
  }

  @override
  Future<Either<DomainException, CreateReservationEntity>> createReservation(CreateReservationRequest request) async {
    try {
      final requests = await _seatImpl.createReservation(request);

      return requests.fold(
        (error) => Left(error),
        (result) {
          return Right(result);
        },
      );
    } catch (e) {
      log(e.toString());
      return Left(UnknownException(message: e.toString()));
    }
  }

  @override
  Future<Either<DomainException, GetHistoryEntity>> repeatLast(RepeatLastRequest request) async {
    try {
      final requests = await _seatImpl.repeatLast(request);

      return requests.fold(
        (error) => Left(error),
        (result) {
          return Right(result);
        },
      );
    } catch (e) {
      log(e.toString());
      return Left(UnknownException(message: e.toString()));
    }
  }
}
