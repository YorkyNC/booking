import 'package:booking/src/features/seat/domain/entities/get_all_seat_entity.dart';
import 'package:booking/src/features/seat/domain/entities/seat_item_entity.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/api/client/rest/dio/dio_client.dart';
import '../../../../../core/exceptions/domain_exception.dart';
import '../../../../../core/services/storage/storage_service_impl.dart';
import '../../../domain/requests/get_all_seat_request.dart';
import '../../../domain/requests/get_seat_request.dart';
import 'i_seat_remote.dart';

@named
@LazySingleton(as: ISeatRemote)
class SeatRemoteImpl implements ISeatRemote {
  final client = DioRestClient();
  StorageServiceImpl st = StorageServiceImpl();
  Map<String, String> headers = {
    'accept': 'application/json',
    'Authorization': 'Bearer ${StorageServiceImpl().getToken()}',
  };

  @override
  Future<Either<DomainException, SeatItemEntity>> getSeat(GetSeatRequest request) async {
    final Either<DomainException, Response<dynamic>> response = await client.get(
      'http://45.136.56.65:8000/rest/sdu/booking/seat/${request.id}',
      options: Options(
        headers: headers,
      ),
    );

    return response.fold(
      (error) => Left(error),
      (result) async {
        return Right(SeatItemEntity.fromJson(result.data));
      },
    );
  }

  @override
  Future<Either<DomainException, GetAllSeatEntity>> getAllSeat(GetAllSeatRequest request) async {
    final Either<DomainException, Response<dynamic>> response = await client.get(
      'http://45.136.56.65:8000/rest/sdu/booking/seat/all',
      options: Options(
        headers: headers,
      ),
    );

    return response.fold(
      (error) => Left(error),
      (result) async {
        return Right(GetAllSeatEntity.fromJson(result.data));
      },
    );
  }
}
