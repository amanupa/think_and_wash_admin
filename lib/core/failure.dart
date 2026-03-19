import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? message;

  const Failure({this.message});
}

// General Failures
class ServerFailure extends Failure {
  const ServerFailure({super.message});

  @override
  List<Object?> get props => [message];
}

class CacheFailure extends Failure {
  @override
  const CacheFailure({super.message});

  @override
  List<Object?> get props => [message];
}

class InternetFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ApiFailure extends Failure {
  @override
  const ApiFailure({required super.message});
  @override
  List<Object?> get props => [message];
}

class NormalFailure extends Failure {
  const NormalFailure({required super.message});

  @override
  List<Object?> get props => [message];
}

class ValidationFailure extends Failure {
  const ValidationFailure({required super.message});

  @override
  List<Object?> get props => [message];
}
