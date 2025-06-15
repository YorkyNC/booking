import 'package:booking/src/features/history/domain/enum/entities/get_history_entity.dart';
import 'package:booking/src/features/history/domain/enum/requests/get_history_request.dart';
import 'package:booking/src/features/seat/domain/entities/create_reservation_entity.dart';
import 'package:booking/src/features/seat/domain/entities/get_all_seat_entity.dart';
import 'package:booking/src/features/seat/domain/entities/seat_item_entity.dart';
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
  Map<String, String> get headers {
    final token = st.getToken();
    debugPrint('🔍 Token validation:');
    debugPrint('   - Token exists: ${token != null && token.isNotEmpty}');
    debugPrint('   - Token length: ${token?.length}');
    debugPrint('   - Token starts with Bearer: ${token?.startsWith('Bearer ')}');

    return {
      'Authorization': token?.startsWith('Bearer ') == true ? token! : 'Bearer $token',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

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
}
