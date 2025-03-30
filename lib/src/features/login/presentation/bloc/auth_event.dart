part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.login({
    required String username,
    required String password,
  }) = _Login;
  const factory AuthEvent.register({
    required String firstName,
    required String lastName,
    required String email,
    required String username,
    required String password,
  }) = _Register;

  const factory AuthEvent.getUser() = _GetUser;

  const factory AuthEvent.refreshToken() = _RefreshToken;

  const factory AuthEvent.forgotPassword({
    required String usernameOrEmail,
  }) = _ForgotPassword;

  const factory AuthEvent.updatePassword({
    required String newPassword,
  }) = _UpdatePassword;

  const factory AuthEvent.verify({required String code, required String userId}) = _Verify;
}
