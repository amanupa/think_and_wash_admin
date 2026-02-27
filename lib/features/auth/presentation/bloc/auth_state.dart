part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

// otp requested state

final class OtpRequestedLoading extends AuthState {}

final class OtpRequestedFailure extends AuthState {
  final String msg;

  OtpRequestedFailure({required this.msg});
}

final class OtpRequestedSuccess extends AuthState {
  final String otp;

  OtpRequestedSuccess({required this.otp});
}

//otp validation states

final class OtpValidationLoading extends AuthState {}

final class OtpValidationFailure extends AuthState {
  OtpValidationFailure();
}

final class OtpValidationSuccess extends AuthState {
  final String usrId;

  OtpValidationSuccess({required this.usrId});
}
