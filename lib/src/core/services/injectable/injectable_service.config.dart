// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:booking/src/core/api/client/rest/dio/dio_client.dart' as _i901;
import 'package:booking/src/core/components/events/domain/models/event_entity.dart'
    as _i847;
import 'package:booking/src/core/services/auth/auth_service_impl.dart' as _i558;
import 'package:booking/src/core/services/auth/i_auth_service.dart' as _i610;
import 'package:booking/src/features/actions/presentation/bloc/bloc/action_bloc.dart'
    as _i544;
import 'package:booking/src/features/attachment/data/datasources/remote/attachment_remote_impl.dart'
    as _i136;
import 'package:booking/src/features/attachment/data/datasources/remote/i_attachment_remote.dart'
    as _i423;
import 'package:booking/src/features/attachment/data/repositories/attachment_repository_impl.dart'
    as _i796;
import 'package:booking/src/features/attachment/domain/repositories/i_attachment_repository.dart'
    as _i140;
import 'package:booking/src/features/attachment/domain/usecases/add_attachment_use_case.dart'
    as _i994;
import 'package:booking/src/features/attachment/domain/usecases/get_attachment_use_case.dart'
    as _i933;
import 'package:booking/src/features/camera/presentation/bloc/camera_bloc.dart'
    as _i738;
import 'package:booking/src/features/class/presentation/bloc/class_bloc.dart'
    as _i829;
import 'package:booking/src/features/class_events/presentation/bloc/class_events_bloc.dart'
    as _i397;
import 'package:booking/src/features/detection/presentation/bloc/detection_bloc.dart'
    as _i855;
import 'package:booking/src/features/events/domain/use_cases/get_all_events_use_case.dart'
    as _i19;
import 'package:booking/src/features/events/domain/use_cases/get_events_count_use_case.dart'
    as _i772;
import 'package:booking/src/features/events/presentation/bloc/events_bloc.dart'
    as _i264;
import 'package:booking/src/features/feedback/presentation/bloc/feedback_bloc.dart'
    as _i264;
import 'package:booking/src/features/login/data/repositories/i_auth_repository.dart'
    as _i385;
import 'package:booking/src/features/login/domain/repositories/auth_repository_impl.dart'
    as _i737;
import 'package:booking/src/features/login/domain/usecases/forgot_password_use_case.dart'
    as _i20;
import 'package:booking/src/features/login/domain/usecases/get_user_use_case.dart'
    as _i568;
import 'package:booking/src/features/login/domain/usecases/login_use_case.dart'
    as _i785;
import 'package:booking/src/features/login/domain/usecases/refresh_token_use_case.dart'
    as _i134;
import 'package:booking/src/features/login/domain/usecases/register_use_case.dart'
    as _i676;
import 'package:booking/src/features/login/domain/usecases/update_password_use_case.dart'
    as _i666;
import 'package:booking/src/features/login/domain/usecases/verify_user_case.dart'
    as _i1056;
import 'package:booking/src/features/parent/presentation/bloc/parent_bloc.dart'
    as _i464;
import 'package:booking/src/features/review/presentation/bloc/review_bloc.dart'
    as _i460;
import 'package:booking/src/features/schedule/presentation/bloc/schedule_bloc.dart'
    as _i511;
import 'package:booking/src/features/settings/domain/usecases/change_password.dart'
    as _i955;
import 'package:booking/src/features/student/presentation/bloc/student_bloc.dart'
    as _i447;
import 'package:booking/src/features/teacher_review/presentation/bloc/teacher_review_bloc.dart'
    as _i547;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i511.ScheduleBloc>(() => _i511.ScheduleBloc());
    gh.factory<_i547.TeacherReviewBloc>(() => _i547.TeacherReviewBloc());
    gh.factory<_i738.CameraBloc>(() => _i738.CameraBloc());
    gh.factory<_i447.StudentBloc>(() => _i447.StudentBloc());
    gh.factory<_i460.ReviewBloc>(() => _i460.ReviewBloc());
    gh.factory<_i464.ParentBloc>(() => _i464.ParentBloc());
    gh.factory<_i544.ActionBloc>(() => _i544.ActionBloc());
    gh.factory<_i829.ClassBloc>(() => _i829.ClassBloc());
    gh.factory<_i397.ClassEventsBloc>(() => _i397.ClassEventsBloc());
    gh.factory<_i855.DetectionBloc>(() => _i855.DetectionBloc());
    await gh.singletonAsync<_i901.DioRestClient>(
      () {
        final i = _i901.DioRestClient();
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    gh.lazySingleton<_i772.GetEventsCountUseCase>(
        () => _i772.GetEventsCountUseCase());
    gh.lazySingleton<_i19.GetAllEventsUseCase>(
        () => _i19.GetAllEventsUseCase());
    gh.lazySingleton<_i423.IAttachmentRemote>(
      () => _i136.AttachmentRemoteImpl(),
      instanceName: 'AttachmentRemoteImpl',
    );
    gh.lazySingleton<_i955.ChangePassword>(
        () => _i955.ChangePassword(gh<_i385.IAuthRepository>()));
    gh.lazySingleton<_i610.IAuthService>(
      () => _i558.AuthServiceImpl(gh<_i901.DioRestClient>()),
      instanceName: 'AuthServiceImpl',
    );
    gh.factoryParam<_i264.FeedbackBloc, String, _i847.EventEntity?>((
      eventId,
      event,
    ) =>
        _i264.FeedbackBloc(
          eventId: eventId,
          event: event,
        ));
    gh.factory<_i264.EventsBloc>(() => _i264.EventsBloc(
          gh<_i19.GetAllEventsUseCase>(),
          gh<_i772.GetEventsCountUseCase>(),
        ));
    gh.lazySingleton<_i140.IAttachmentRepository>(
      () => _i796.AttachmentRepositoryImpl(
          gh<_i423.IAttachmentRemote>(instanceName: 'AttachmentRemoteImpl')),
      instanceName: 'AttachmentRepositoryImpl',
    );
    gh.lazySingleton<_i933.GetAttachmentUseCase>(() =>
        _i933.GetAttachmentUseCase(gh<_i140.IAttachmentRepository>(
            instanceName: 'AttachmentRepositoryImpl')));
    gh.lazySingleton<_i994.AddAttachmentUseCase>(() =>
        _i994.AddAttachmentUseCase(gh<_i140.IAttachmentRepository>(
            instanceName: 'AttachmentRepositoryImpl')));
    gh.lazySingleton<_i385.IAuthRepository>(
      () => _i737.AuthRepositoryImpl(
          gh<_i610.IAuthService>(instanceName: 'AuthServiceImpl')),
      instanceName: 'AuthRepositoryImpl',
    );
    gh.lazySingleton<_i568.GetUserUseCase>(() => _i568.GetUserUseCase(
        gh<_i385.IAuthRepository>(instanceName: 'AuthRepositoryImpl')));
    gh.lazySingleton<_i1056.VerifyUseCase>(() => _i1056.VerifyUseCase(
        gh<_i385.IAuthRepository>(instanceName: 'AuthRepositoryImpl')));
    gh.lazySingleton<_i134.RefreshTokenUseCase>(() => _i134.RefreshTokenUseCase(
        gh<_i385.IAuthRepository>(instanceName: 'AuthRepositoryImpl')));
    gh.lazySingleton<_i785.LoginUseCase>(() => _i785.LoginUseCase(
        gh<_i385.IAuthRepository>(instanceName: 'AuthRepositoryImpl')));
    gh.lazySingleton<_i666.UpdatePasswordUseCase>(() =>
        _i666.UpdatePasswordUseCase(
            gh<_i385.IAuthRepository>(instanceName: 'AuthRepositoryImpl')));
    gh.lazySingleton<_i20.ForgotPasswordUseCase>(() =>
        _i20.ForgotPasswordUseCase(
            gh<_i385.IAuthRepository>(instanceName: 'AuthRepositoryImpl')));
    gh.lazySingleton<_i676.RegisterUseCase>(() => _i676.RegisterUseCase(
        gh<_i385.IAuthRepository>(instanceName: 'AuthRepositoryImpl')));
    return this;
  }
}
