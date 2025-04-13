import 'package:booking/src/features/seat/domain/entities/seat_item_entity.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/exceptions/domain_exception.dart';
import '../../../../core/utils/loggers/logger.dart';
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
      Log.e(e);
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
      Log.e(e);
      return Left(UnknownException(message: e.toString()));
    }
  }
}
