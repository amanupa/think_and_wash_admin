part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent extends Equatable {}

final class OtpRequested extends AuthEvent {
  final String phn;

  OtpRequested({required this.phn});

  @override
  List<Object?> get props => throw UnimplementedError();
}

final class OtpValidationRequested extends AuthEvent {
  final AuthEntity entity;

  OtpValidationRequested({required this.entity});

  @override
  List<Object?> get props => throw UnimplementedError();
}

class UpdateUser extends AuthEvent {
  final User user;

  UpdateUser({required this.user});
  @override
  List<Object?> get props => [user];
}
