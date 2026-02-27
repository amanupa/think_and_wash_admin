part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class OtpRequested extends AuthEvent {
  final String phn;

  OtpRequested({required this.phn});
}

final class OtpValidationRequested extends AuthEvent {
  final String otp;

  OtpValidationRequested({required this.otp});
}
