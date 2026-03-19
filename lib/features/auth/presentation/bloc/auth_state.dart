part of 'auth_bloc.dart';

@immutable
sealed class AuthState extends Equatable {}

final class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

// otp requested state

final class OtpRequestedLoading extends AuthState {
  @override
  List<Object?> get props => [];
}

final class OtpRequestedFailure extends AuthState {
  final String msg;

  OtpRequestedFailure({required this.msg});

  @override
  List<Object?> get props => [msg];
}

final class OtpRequestedSuccess extends AuthState {
  final String otp;
  final String phn;

  OtpRequestedSuccess({required this.otp, required this.phn});

  @override
  List<Object?> get props => [otp];
}

//otp validation states

final class OtpValidationLoading extends AuthState {
  @override
  List<Object?> get props => [];
}

final class OtpValidationFailure extends AuthState {
  final String msg;
  final String phn;
  OtpValidationFailure({required this.msg, required this.phn});

  @override
  List<Object?> get props => [msg, phn];
}

final class OtpValidationSuccess extends AuthState {
  final User userMOdel;
  final String token;

  OtpValidationSuccess({required this.userMOdel, required this.token});

  @override
  List<Object?> get props => [userMOdel, token];
}

final class StaticOtpValidationSuccess extends AuthState {
  final String userId;

  StaticOtpValidationSuccess({required this.userId});

  @override
  List<Object?> get props => [userId];
}

// Role validation error - when user role is not "vendor"
final class OtpValidationRoleError extends AuthState {
  final String msg;
  final String phn;

  OtpValidationRoleError({required this.msg, required this.phn});

  @override
  List<Object?> get props => [msg, phn];
}
