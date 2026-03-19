import 'package:dartz/dartz.dart';
import 'package:flutter/rendering.dart';
import 'package:think_and_wash_admin/core/exception.dart';
import 'package:think_and_wash_admin/core/failure.dart';
import 'package:think_and_wash_admin/features/auth/data/auth_datasource.dart';
import 'package:think_and_wash_admin/features/auth/data/auth_model.dart';
import 'package:think_and_wash_admin/features/auth/domain/auth_entity.dart';
import 'package:think_and_wash_admin/features/auth/domain/auth_repository.dart';

import '../../../core/secure_storage.dart';
import '../../../core/shared_preference.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDatasource dataSource;

  AuthRepositoryImpl({required this.dataSource});
  @override
  Future<Either<Failure, String>> getOtp(String phn) async {
    try {
      final result = await dataSource.getOtp(phn);
      return right(result);
    } on ApiException catch (err) {
      return left(ApiFailure(message: err.message));
    } on ServerException {
      return left(const ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AuthModel>> submitOtp(AuthEntity entity) async {
    try {
      final result = await dataSource.submitOtp(entity);
      debugPrint(
        "this is result token in submit otp repository ${result.token}",
      );
      if (result.token != null) {
        await SecureStorageService.writeData(
          key: "auth_token",
          value: result.token!,
        );
        await SharedPreferenceService.setBool("isLoggedIn", true);
        if (result.user?.name != null && result.user!.name!.isNotEmpty) {
          await SharedPreferenceService.setString(
            "userName",
            result.user!.name!,
          );
        } else {
          await SharedPreferenceService.remove("userName");
        }
      }
      return right(result);
    } on ApiException catch (err) {
      return left(ApiFailure(message: err.message));
    } on ServerException {
      return left(const ServerFailure());
    }
  }
}
