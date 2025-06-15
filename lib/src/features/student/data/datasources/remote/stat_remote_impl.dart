import 'dart:developer' as developer;

import 'package:booking/src/core/api/client/rest/dio/dio_client.dart';
import 'package:booking/src/features/student/domain/entities/get_stat_entity.dart';
import 'package:booking/src/features/student/domain/requests/get_stat_request.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/exceptions/domain_exception.dart';
import '../../../../../core/services/storage/storage_service_impl.dart';
import 'i_stat_remote.dart';

@named
@LazySingleton(as: IStatRemote)
class StatRemoteImpl implements IStatRemote {
  final client = DioRestClient();
  StorageServiceImpl st = StorageServiceImpl();
  Map<String, String> headers = {
    'accept': 'application/json',
    'Authorization': 'Bearer ${StorageServiceImpl().getToken()}',
  };

  @override
  Future<Either<DomainException, GetStatEntity>> getStat(GetStatRequest request) async {
    final String userId = request.userId.toString();
    final queryParams = Map<String, dynamic>.from({
      'userId': userId,
    });
    developer.log('Fetching statistics for user: $userId', name: 'StatRemoteImpl');

    try {
      final Either<DomainException, Response<dynamic>> response = await client.get(
        'http://191.101.218.103:8000/rest/sdu/booking/user/statistics',
        options: Options(
          headers: headers,
        ),
        queryParameters: queryParams,
      );

      return response.fold(
        (error) {
          developer.log('Error fetching statistics: ${error.message}', name: 'StatRemoteImpl', error: error);
          return Left(error);
        },
        (result) async {
          if (result.statusCode == 200) {
            try {
              final statEntity = GetStatEntity.fromJson(result.data);
              developer.log('Successfully fetched statistics: $statEntity', name: 'StatRemoteImpl');
              return Right(statEntity);
            } catch (e) {
              developer.log('Error parsing statistics response: $e', name: 'StatRemoteImpl', error: e);
              return Left(UnknownException(message: 'Failed to parse statistics data: $e'));
            }
          } else {
            final errorMessage = 'Failed to fetch statistics. Status code: ${result.statusCode}';
            developer.log(errorMessage, name: 'StatRemoteImpl');
            return Left(UnknownException(message: errorMessage));
          }
        },
      );
    } catch (e) {
      developer.log('Unexpected error while fetching statistics: $e', name: 'StatRemoteImpl', error: e);
      return Left(UnknownException(message: 'Unexpected error: $e'));
    }
  }
}
