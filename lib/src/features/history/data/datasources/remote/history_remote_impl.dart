import 'dart:convert';
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
      'http://191.101.218.103:8000/rest/sdu/booking/reservations',
      options: Options(
        headers: {
          'accept': 'application/json',
          'Authorization': 'Bearer ${StorageServiceImpl().getToken()}',
        },
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

          final bookings = historyList.map((item) => GetHistoryEntity.fromJson(item)).toList();
          return Right(GetHistoryList(bookings: bookings));
        }
        if (result.statusCode == 200) {
          try {
            // Ensure data is properly parsed as JSON
            final dynamic responseData = result.data;
            log('Response data: $responseData');

            Map<String, dynamic> jsonData;

            if (responseData == null || responseData.toString().trim().isEmpty) {
              return Left(UnknownException(message: 'Empty response data received'));
            }

            if (responseData is String) {
              try {
                jsonData = json.decode(responseData) as Map<String, dynamic>;
              } catch (e) {
                log('JSON decode error: $e');
                return Left(UnknownException(message: 'Invalid JSON format in response: $e'));
              }
            } else if (responseData is Map<String, dynamic>) {
              jsonData = responseData;
            } else {
              log('Unexpected response type: ${responseData.runtimeType}');
              return Left(UnknownException(message: 'Invalid response data format: ${responseData.runtimeType}'));
            }

            final historyEntity = GetHistoryEntity.fromJson(jsonData);
            return Right(GetHistoryList(bookings: [historyEntity]));
          } catch (e) {
            log('Error processing response: $e');
            return Left(UnknownException(message: 'Failed to parse statistics data: $e'));
          }
        } else {
          final errorMessage = 'Failed to fetch statistics. Status code: ${result.statusCode}';
          return Left(UnknownException(message: errorMessage));
        }
      },
    );
  }
}
