import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:think_and_wash_admin/core/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params entity);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
