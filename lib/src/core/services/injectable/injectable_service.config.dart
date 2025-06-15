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
import 'package:booking/src/features/history/data/datasources/remote/history_remote_impl.dart'
    as _i980;
import 'package:booking/src/features/history/data/datasources/remote/i_history_remote.dart'
    as _i184;
import 'package:booking/src/features/history/data/repositories/history_repository_impl.dart'
    as _i592;
import 'package:booking/src/features/history/domain/enum/repositories/i_history_repository.dart'
    as _i654;
import 'package:booking/src/features/history/domain/use_case/get_history_use_case.dart'
    as _i959;
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
import 'package:booking/src/features/seat/data/datasources/remote/i_seat_remote.dart'
    as _i434;
import 'package:booking/src/features/seat/data/datasources/remote/seat_remote_impl.dart'
    as _i348;
import 'package:booking/src/features/seat/data/repositories/seat_repository_impl.dart'
    as _i579;
import 'package:booking/src/features/seat/domain/repositories/i_seat_repository.dart'
    as _i1017;
import 'package:booking/src/features/seat/domain/usecases/cancel_reservation_use_case.dart'
    as _i261;
import 'package:booking/src/features/seat/domain/usecases/create_reservation_use_case.dart'
    as _i213;
import 'package:booking/src/features/seat/domain/usecases/get_all_seat_use_case.dart'
    as _i888;
import 'package:booking/src/features/seat/domain/usecases/get_history_use_case.dart'
    as _i7;
import 'package:booking/src/features/seat/domain/usecases/get_seat_use_case.dart'
    as _i1013;
import 'package:booking/src/features/seat/domain/usecases/repeat_last_use_case.dart'
    as _i716;
import 'package:booking/src/features/settings/domain/usecases/change_password.dart'
    as _i955;
import 'package:booking/src/features/student/data/datasources/remote/i_stat_remote.dart'
    as _i770;
import 'package:booking/src/features/student/data/datasources/remote/stat_remote_impl.dart'
    as _i297;
import 'package:booking/src/features/student/data/repositories/stat_repository_impl.dart'
    as _i396;
import 'package:booking/src/features/student/domain/repositories/i_stat_repository.dart'
    as _i143;
import 'package:booking/src/features/student/domain/usecases/get_stat_use_case.dart'
    as _i616;
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
    gh.lazySingleton<_i184.IHistoryRemote>(
      () => _i980.HistoryRemoteImpl(),
      instanceName: 'HistoryRemoteImpl',
    );
    gh.lazySingleton<_i770.IStatRemote>(
      () => _i297.StatRemoteImpl(),
      instanceName: 'StatRemoteImpl',
    );
    gh.lazySingleton<_i434.ISeatRemote>(
      () => _i348.SeatRemoteImpl(),
      instanceName: 'SeatRemoteImpl',
    );
    gh.lazySingleton<_i1017.ISeatRepository>(
      () => _i579.SeatRepositoryImpl(
          gh<_i434.ISeatRemote>(instanceName: 'SeatRemoteImpl')),
      instanceName: 'SeatRepositoryImpl',
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
    gh.lazySingleton<_i143.IStatRepository>(
      () => _i396.StatRepositoryImpl(
          gh<_i770.IStatRemote>(instanceName: 'StatRemoteImpl')),
      instanceName: 'StatRepositoryImpl',
    );
    gh.lazySingleton<_i616.GetStatUseCase>(() => _i616.GetStatUseCase(
        gh<_i143.IStatRepository>(instanceName: 'StatRepositoryImpl')));
    gh.lazySingleton<_i654.IHistoryRepository>(
      () => _i592.HistoryRepositoryImpl(
          gh<_i184.IHistoryRemote>(instanceName: 'HistoryRemoteImpl')),
      instanceName: 'HistoryRepositoryImpl',
    );
    gh.lazySingleton<_i385.IAuthRepository>(
      () => _i737.AuthRepositoryImpl(
          gh<_i610.IAuthService>(instanceName: 'AuthServiceImpl')),
      instanceName: 'AuthRepositoryImpl',
    );
    gh.lazySingleton<_i1013.GetSeatUseCase>(() => _i1013.GetSeatUseCase(
        gh<_i1017.ISeatRepository>(instanceName: 'SeatRepositoryImpl')));
    gh.lazySingleton<_i213.CreateReservationUseCase>(() =>
        _i213.CreateReservationUseCase(
            gh<_i1017.ISeatRepository>(instanceName: 'SeatRepositoryImpl')));
    gh.lazySingleton<_i888.GetAllSeatUseCase>(() => _i888.GetAllSeatUseCase(
        gh<_i1017.ISeatRepository>(instanceName: 'SeatRepositoryImpl')));
    gh.lazySingleton<_i7.GetHistoryUseCase>(() => _i7.GetHistoryUseCase(
        gh<_i1017.ISeatRepository>(instanceName: 'SeatRepositoryImpl')));
    gh.lazySingleton<_i716.RepeatLastUseCase>(() => _i716.RepeatLastUseCase(
        gh<_i1017.ISeatRepository>(instanceName: 'SeatRepositoryImpl')));
    gh.lazySingleton<_i261.CancelReservationUseCase>(() =>
        _i261.CancelReservationUseCase(
            gh<_i1017.ISeatRepository>(instanceName: 'SeatRepositoryImpl')));
    gh.lazySingleton<_i568.GetUserUseCase>(() => _i568.GetUserUseCase(
        gh<_i385.IAuthRepository>(instanceName: 'AuthRepositoryImpl')));
    gh.lazySingleton<_i1056.VerifyUseCase>(() => _i1056.VerifyUseCase(
        gh<_i385.IAuthRepository>(instanceName: 'AuthRepositoryImpl')));
    gh.lazySingleton<_i134.RefreshTokenUseCase>(() => _i134.RefreshTokenUseCase(
        gh<_i385.IAuthRepository>(instanceName: 'AuthRepositoryImpl')));
    gh.lazySingleton<_i676.RegisterUseCase>(() => _i676.RegisterUseCase(
        gh<_i385.IAuthRepository>(instanceName: 'AuthRepositoryImpl')));
    gh.lazySingleton<_i785.LoginUseCase>(() => _i785.LoginUseCase(
        gh<_i385.IAuthRepository>(instanceName: 'AuthRepositoryImpl')));
    gh.lazySingleton<_i666.UpdatePasswordUseCase>(() =>
        _i666.UpdatePasswordUseCase(
            gh<_i385.IAuthRepository>(instanceName: 'AuthRepositoryImpl')));
    gh.lazySingleton<_i20.ForgotPasswordUseCase>(() =>
        _i20.ForgotPasswordUseCase(
            gh<_i385.IAuthRepository>(instanceName: 'AuthRepositoryImpl')));
    gh.lazySingleton<_i959.GetHistoryUseCase>(() => _i959.GetHistoryUseCase(
        gh<_i654.IHistoryRepository>(instanceName: 'HistoryRepositoryImpl')));
    return this;
  }
}
