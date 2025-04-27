import 'dart:developer';

import 'package:booking/src/core/services/auth/models/forgot_password_response.dart';
import 'package:booking/src/core/services/auth/models/sign_in_response.dart';
import 'package:booking/src/core/services/auth/models/sign_up_request.dart';
import 'package:booking/src/core/services/auth/models/sign_up_response.dart';
import 'package:booking/src/core/services/auth/models/update_password_request.dart';
import 'package:booking/src/core/services/auth/models/update_password_response.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../api/client/endpoints.dart';
import '../../api/client/rest/dio/dio_client.dart';
import '../../exceptions/domain_exception.dart';
import '../storage/storage_service_impl.dart';
import 'entities/user_entity.dart';
import 'i_auth_service.dart';
import 'models/forgot_password_request.dart';
import 'models/refresh_token_response.dart';
import 'models/sign_in_request.dart';
import 'models/verify_request.dart';
import 'models/verify_response.dart';

@named
@LazySingleton(as: IAuthService)
class AuthServiceImpl implements IAuthService {
  AuthServiceImpl(this.client);

  final DioRestClient client;
  final StorageServiceImpl st = StorageServiceImpl();
  final Map<String, String> headers = {'Content-Type': 'application/json'};

  @override
  Future<Either<DomainException, SignInResponse>> loginUser(SignInRequest request) async {
    st.clear();
    final Either<DomainException, Response<dynamic>> response = await client.post(
      EndPoints.login,
      data: request,
      options: Options(
        method: 'POST',
        headers: headers,
      ),
    );

    return response.fold(
      (error) => Left(error),
      (result) async {
        log(result.statusCode.toString());
        if (result.statusCode == 200) {
          return Right(SignInResponse.fromJson(result.data));
        } else {
          return Left(UnknownException(message: result.statusMessage));
        }
      },
    );
  }

  @override
  Future<Either<DomainException, SignUpResponse>> register(SignUpRequest request) async {
    st.clear();
    final Either<DomainException, Response<dynamic>> response = await client.post(EndPoints.register,
        data: request,
        options: Options(
          method: 'POST',
          headers: headers,
        ));
    return response.fold(
      (error) => Left(error),
      (result) async {
        log(result.statusCode.toString());
        if (result.statusCode == 200) {
          return Right(SignUpResponse.fromJson(result.data));
        } else {
          return Left(UnknownException(message: result.statusMessage));
        }
      },
    );
  }

  @override
  Future<Either<DomainException, UserEntity>> getUser() async {
    log('Attempting to get user data', name: 'AuthService');
    final Either<DomainException, Response<dynamic>> response = await client.get(
      EndPoints.getUser,
      options: Options(
        method: 'GET',
        headers: headers,
      ),
    );

    return response.fold(
      (error) {
        log('Error getting user data: $error', name: 'AuthService');
        return Left(error);
      },
      (response) async {
        log('User data response status: ${response.statusCode}', name: 'AuthService');
        if (response.statusCode == 200) {
          log('Successfully retrieved user data', name: 'AuthService');
          return Right(UserEntity.fromJson(response.data));
        } else {
          log('Failed to get user data: ${response.statusMessage}', name: 'AuthService');
          return Left(UnknownException(message: response.statusMessage));
        }
      },
    );
  }

  @override
  Future<Either<DomainException, VerifyResponse>> verifyUser(VerifyRequest request) async {
    try {
      final Either<DomainException, Response<dynamic>> response = await client.post(
        EndPoints.verify,
        data: VerifyRequest(
          userId: request.userId,
          code: request.code,
        ),
        options: Options(
          method: 'POST',
          headers: headers,
        ),
      );

      return response.fold(
        (error) => Left(error),
        (response) async {
          if (response.statusCode == 200) {
            await st.deleteToken();
            final String token = VerifyResponse.fromJson(response.data).toString();
            await st.setToken(token);
            return Right(VerifyResponse.fromJson(response.data));
          } else {
            return Left(UnknownException(message: response.statusMessage));
          }
        },
      );
    } catch (e) {
      log('Exception caught during verification: $e');
      return Left(e is DomainException ? e : UnknownException(message: e.toString()));
    }
  }

  @override
  Future<Either<DomainException, UpdatePasswordResponse>> updatePassword(UpdatePasswordRequest request) async {
    final Either<DomainException, Response<dynamic>> response = await client.post(
      EndPoints.updatePassword,
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: request,
    );

    return response.fold(
      (error) => Left(error),
      (response) async {
        if (response.statusCode == 200) {
          return Right(UpdatePasswordResponse.fromJson(response.data));
        } else {
          return Left(UnknownException(message: response.statusMessage));
        }
      },
    );
  }

  @override
  Future<Either<DomainException, ForgotPasswordResponse>> forgotPassword(ForgotPasswordRequest request) async {
    st.deleteToken();
    final Either<DomainException, Response<dynamic>> response = await client.post(
      EndPoints.forgotPassword,
      data: request,
      options: Options(
        method: 'POST',
        headers: headers,
      ),
    );
    return response.fold(
      (error) => Left(error),
      (response) async {
        if (response.statusCode == 200) {
          return Right(ForgotPasswordResponse.fromJson(response.data));
        } else {
          return Left(UnknownException(message: response.statusMessage));
        }
      },
    );
  }

  @override
  Future<Either<DomainException, RefreshTokenResponse>> refreshToken() async {
    log('Attempting to refresh token', name: 'AuthService');
    String? refreshToken = st.getRefreshToken();
    if (refreshToken == null) {
      log('No refresh token found', name: 'AuthService');
      return Left(UnknownException(message: "No refresh token found"));
    }

    try {
      log('Sending refresh token request', name: 'AuthService');
      final response = await client.post(
        EndPoints.refreshToken,
        data: {'refreshToken': refreshToken},
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
      return response.fold(
        (error) {
          log('Error refreshing token: $error', name: 'AuthService');
          return Left(error);
        },
        (response) async {
          log('Refresh token response status: ${response.statusCode}', name: 'AuthService');
          if (response.statusCode == 200) {
            log('Successfully refreshed token', name: 'AuthService');
            await st.deleteToken();
            await st.deleteRefreshToken();

            await st.setToken(response.data['accessToken']);
            await st.setRefreshToken(response.data['refreshToken']);
            return Right(RefreshTokenResponse.fromJson(response.data));
          } else {
            log('Failed to refresh token: ${response.statusMessage}', name: 'AuthService');
            return Left(UnknownException(message: response.statusMessage));
          }
        },
      );
    } on DioException catch (e) {
      log('DioError caught during refreshing token: $e', name: 'AuthService');
      return Left(NetworkException(message: e.message!));
    } catch (e) {
      log('Exception caught during refreshing token: $e', name: 'AuthService');
      return Left(e is DomainException ? e : UnknownException(message: e.toString()));
    }
  }
}
