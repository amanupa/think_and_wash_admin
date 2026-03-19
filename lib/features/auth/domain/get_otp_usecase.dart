import 'package:dartz/dartz.dart';
import 'package:think_and_wash_admin/core/failure.dart';
import 'package:think_and_wash_admin/core/usecase_interfase.dart';
import 'package:think_and_wash_admin/features/auth/domain/auth_repository.dart';

class GetOtpUsecase extends UseCase<String, String> {
  final AuthRepository repository;

  GetOtpUsecase({required this.repository});
  @override
  Future<Either<Failure, String>> call(String entity) {
    return repository.getOtp(entity);
  }
}
