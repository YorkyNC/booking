import 'package:booking/src/core/api/websocket/web_socket_service.dart';
import 'package:booking/src/core/services/auth/i_auth_service.dart';
import 'package:booking/src/core/services/injectable/service_register_proxy.dart';
import 'package:booking/src/core/services/storage/storage_service.dart';
import 'package:booking/src/core/services/storage/storage_service_impl.dart';
import 'package:booking/src/features/login/domain/usecases/register_use_case.dart';
import 'package:dio/dio.dart';

import '../../../features/login/domain/usecases/forgot_password_use_case.dart';
import '../../../features/login/domain/usecases/get_user_use_case.dart';
import '../../../features/login/domain/usecases/login_use_case.dart';
import '../../../features/login/domain/usecases/refresh_token_use_case.dart';
import '../../../features/login/domain/usecases/update_password_use_case.dart';
import '../../../features/login/domain/usecases/verify_user_case.dart';
import '../../../features/login/presentation/bloc/auth_bloc.dart';
import '../../../features/profile_page/data/datasources/profile_data_source.dart';
import '../../../features/profile_page/data/repositories/profile_repository_impl.dart';
import '../../../features/profile_page/domain/repositories/profile_repository.dart';
import '../../../features/profile_page/domain/usecases/get_profile.dart';
import '../../../features/profile_page/domain/usecases/update_current_role.dart' as role_usecase;
import '../../../features/profile_page/domain/usecases/update_notification_settings.dart';
import '../../../features/profile_page/presentation/bloc/profile_bloc.dart';
import '../../../features/settings/presentation/bloc/settings_bloc.dart';
import '../auth/auth_service_impl.dart';
import 'injectable_service.dart';

void manualRegisterServices() {
  getIt.registerFactory(
    () => ProfileBloc(
      getProfile: getIt(),
      updateNotificationSettings: getIt(),
      updateCurrentRole: getIt(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton(() => GetProfile(getIt()));
  getIt.registerLazySingleton(() => UpdateNotificationSettings(getIt()));
  getIt.registerLazySingleton(() => role_usecase.UpdateCurrentRole(getIt()));

  // Repository
  getIt.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(getIt()),
  );

  // Data sources
  getIt.registerLazySingleton<ProfileDataSource>(
    () => ProfileDataSourceImpl(),
  );
  getIt.registerLazySingleton<WebSocketService>(
    () => WebSocketService(),
  );
  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio(BaseOptions(
      baseUrl: 'https://education.greeneye.kz/api',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ));

    // Add logging interceptor if needed
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));

    return dio;
  });

  getIt.registerBloc<AuthBloc>(
    factory: true,
    () => AuthBloc(
      getIt<LoginUseCase>(),
      getIt<GetUserUseCase>(),
      getIt<VerifyUseCase>(),
      getIt<ForgotPasswordUseCase>(),
      getIt<UpdatePasswordUseCase>(),
      getIt<RefreshTokenUseCase>(),
      getIt<RegisterUseCase>(),
    ),
  );

  // Register Storage Service
  getIt.registerLazySingleton<StorageService>(() => StorageServiceImpl());

  // Register IAuthService if needed for other parts of the app
  if (!getIt.isRegistered<IAuthService>(instanceName: 'AuthServiceImpl')) {
    getIt.registerLazySingleton<IAuthService>(
      () => AuthServiceImpl(getIt()),
      instanceName: 'AuthServiceImpl',
    );
  }

  getIt.registerBloc<SettingsBloc>(
    factory: true,
    () => SettingsBloc(),
  );
}
