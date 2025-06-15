import 'package:booking/src/features/history/domain/enum/entities/get_history_entity.dart';
import 'package:booking/src/features/history/domain/enum/requests/get_history_request.dart';
import 'package:booking/src/features/seat/domain/entities/create_reservation_entity.dart';
import 'package:booking/src/features/seat/domain/entities/get_all_seat_entity.dart';
import 'package:booking/src/features/seat/domain/entities/seat_item_entity.dart';
import 'package:booking/src/features/seat/domain/requests/cancel_reservation_request.dart';
import 'package:booking/src/features/seat/domain/requests/create_reservation_request.dart';
import 'package:booking/src/features/seat/domain/requests/repeat_last_request.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
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
      'http://191.101.218.103:8000/rest/sdu/booking/seat/${request.id}',
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
  Future<Either<DomainException, GetHistoryEntity>> getHistory(GetHistoryRequest request) async {
    final queryParameters = <String, dynamic>{
      'userId': request.userId,
    };
    if (request.seatId != null) {
      queryParameters['seatId'] = request.seatId;
    }
    final Either<DomainException, Response<dynamic>> response = await client.get(
      'http://191.101.218.103:8000/rest/sdu/booking/reservations',
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
    );

    return response.fold(
      (error) => Left(error),
      (result) async {
        return Right(GetHistoryEntity.fromJson(result.data));
      },
    );
  }

  @override
  Future<Either<DomainException, GetAllSeatEntity>> getAllSeat(GetAllSeatRequest request) async {
    final queryParameters = <String, dynamic>{
      'floor': request.floor,
      'date': request.date,
      'startTime': request.startTime,
      'endTime': request.endTime,
    };
    final Either<DomainException, Response<dynamic>> response = await client.get(
      'http://191.101.218.103:8000/rest/sdu/booking/seat/all',
      queryParameters: queryParameters,
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

  @override
  Future<Either<DomainException, CreateReservationEntity>> createReservation(CreateReservationRequest request) async {
    final Either<DomainException, Response<dynamic>> response = await client.post(
      'http://191.101.218.103:8000/rest/sdu/booking/reservations/create',
      data: request.toJson(),
      options: Options(
        headers: headers,
      ),
    );

    return response.fold(
      (error) => Left(error),
      (result) async {
        if (result.statusCode == 200 || result.statusCode == 201) {
          try {
            return Right(CreateReservationEntity.fromJson(result.data));
          } catch (e) {
            return Left(UnknownException(message: 'Failed to parse response: $e'));
          }
        } else {
          return Left(UnknownException(message: result.statusMessage ?? 'Unknown error'));
        }
      },
    );
  }

  @override
  Future<Either<DomainException, GetHistoryEntity>> repeatLast(RepeatLastRequest request) async {
    debugPrint('🔁 Starting repeatLast request for userId: ${request.userId}');
    debugPrint('🔑 Using token: ${st.getToken()}');
    debugPrint('📤 Request headers: $headers');

    try {
      final Either<DomainException, Response<dynamic>> response = await client.post(
        'http://191.101.218.103:8000/rest/sdu/booking/reservations/repeat-last',
        data: {
          'userId': request.userId,
        },
        options: Options(
          headers: headers,
          validateStatus: (status) => status! < 500,
        ),
      );

      return response.fold(
        (error) {
          debugPrint('❌ Error in repeatLast: ${error.message}');
          return Left(error);
        },
        (result) async {
          debugPrint('📥 Response status: ${result.statusCode}');
          debugPrint('📦 Response data: ${result.data}');
          debugPrint('📋 Response headers: ${result.headers}');

          if (result.statusCode == 200 || result.statusCode == 201) {
            try {
              final history = GetHistoryEntity.fromJson(result.data);
              debugPrint('✅ Successfully parsed history: ${history.toString()}');
              return Right(history);
            } catch (e) {
              debugPrint('❌ Failed to parse response: $e');
              return Left(UnknownException(message: 'Failed to parse response: $e'));
            }
          } else if (result.statusCode == 401) {
            debugPrint('🔒 Authentication failed');
            debugPrint('🔍 Error details: ${result.data}');
            // Try to refresh token if available
            final refreshToken = st.getRefreshToken();
            if (refreshToken != null && refreshToken.isNotEmpty) {
              debugPrint('🔄 Attempting to refresh token...');
              // TODO: Implement token refresh logic
            }
            return Left(UnknownException(message: 'Authentication failed. Please login again.'));
          } else {
            debugPrint('❌ Unknown error: ${result.data?['message'] ?? result.statusMessage}');
            return Left(UnknownException(message: result.data?['message'] ?? result.statusMessage ?? 'Unknown error'));
          }
        },
      );
    } catch (e) {
      debugPrint('❌ Exception in repeatLast: $e');
      return Left(UnknownException(message: e.toString()));
    }
  }

  @override
  Future<Either<DomainException, GetHistoryEntity>> cancelReservation(CancelReservationRequest request) async {
    try {
      debugPrint('🔍 Starting cancel reservation for ID: ${request.id}');
      debugPrint('🔑 Using headers: $headers');

      final Either<DomainException, Response<dynamic>> response = await client.delete(
        'http://191.101.218.103:8000/rest/sdu/booking/reservations/${request.id}/cancel',
        options: Options(
          headers: headers,
          validateStatus: (status) => status != null && status < 500,
        ),
      );

      return response.fold(
        (error) {
          debugPrint('❌ Error in cancelReservation: ${error.toString()}');
          if (error is AuthenticationException) {
            debugPrint('🔒 Authentication error detected');
            return Left(error);
          }
          return Left(UnknownException(message: error.toString()));
        },
        (result) async {
          debugPrint('📥 Response status: ${result.statusCode}');
          debugPrint('📥 Response data: ${result.data}');

          if (result.statusCode == 200 || result.statusCode == 201) {
            try {
              // If the response is a single object
              if (result.data is Map<String, dynamic>) {
                final history = GetHistoryEntity.fromJson(result.data);
                debugPrint('✅ Successfully cancelled reservation: ${history.toString()}');
                return Right(history);
              }
              // If the response is a list with one item
              else if (result.data is List && (result.data as List).isNotEmpty) {
                final history = GetHistoryEntity.fromJson((result.data as List).first);
                debugPrint('✅ Successfully cancelled reservation from list: ${history.toString()}');
                return Right(history);
              } else {
                debugPrint('❌ Unexpected response format: ${result.data}');
                return Left(UnknownException(message: 'Unexpected response format'));
              }
            } catch (e) {
              debugPrint('❌ Failed to parse response: $e');
              return Left(UnknownException(message: 'Failed to parse response: $e'));
            }
          } else {
            final errorMessage = result.data?['message'] ?? result.statusMessage ?? 'Unknown error';
            debugPrint('❌ Server error: $errorMessage');
            return Left(UnknownException(message: errorMessage));
          }
        },
      );
    } catch (e, stackTrace) {
      debugPrint('❌ Exception in cancelReservation: $e');
      debugPrint('📚 Stack trace: $stackTrace');
      return Left(UnknownException(message: e.toString()));
    }
  }
}
