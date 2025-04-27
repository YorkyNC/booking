import 'dart:developer';

import 'package:booking/src/features/history/domain/enum/entities/get_history_entity.dart';
import 'package:booking/src/features/history/domain/enum/requests/get_history_request.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/api/client/rest/dio/dio_client.dart';
import '../../../../../core/exceptions/domain_exception.dart';
import '../../../../../core/services/storage/storage_service_impl.dart';
import 'i_history_remote.dart';

@named
@LazySingleton(as: IHistoryRemote)
class HistoryRemoteImpl implements IHistoryRemote {
  final client = DioRestClient();
  StorageServiceImpl st = StorageServiceImpl();
  Map<String, String> headers = {
    'accept': 'application/json',
    'Authorization': 'Bearer ${StorageServiceImpl().getToken()}',
  };

  @override
  Future<Either<DomainException, GetHistoryList>> getHistory(GetHistoryRequest request) async {
    final String userIdString = request.userId.toString();
    log(userIdString);
    final queryParams = Map<String, dynamic>.from({
      'userId': userIdString,
    });
    if (request.seatId != null) {
      queryParams['seatId'] = request.seatId;
    }
    final Either<DomainException, Response<dynamic>> response = await client.get(
      'http://45.136.56.65:8000/rest/sdu/booking/reservations',
      options: Options(
        headers: headers,
      ),
      queryParameters: queryParams,
    );

    return response.fold(
      (error) => Left(error),
      (result) async {
        if (result.data is List) {
          final List<dynamic> historyList = result.data;
          if (historyList.isEmpty) {
            return Left(UnknownException(message: 'No history found'));
          }
          // Convert each item in the list to GetHistoryEntity
          final bookings = historyList.map((item) => GetHistoryEntity.fromJson(item)).toList();
          return Right(GetHistoryList(bookings: bookings));
        }
        // If it's not a list, wrap the single item in a list
        final booking = GetHistoryEntity.fromJson(result.data);
        return Right(GetHistoryList(bookings: [booking]));
      },
    );
  }
}
