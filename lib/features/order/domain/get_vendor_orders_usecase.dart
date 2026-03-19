import 'package:dartz/dartz.dart';
import 'package:think_and_wash_admin/core/failure.dart';
import 'package:think_and_wash_admin/core/usecase_interfase.dart';
import 'package:think_and_wash_admin/features/order/domain/order_entity.dart';
import 'package:think_and_wash_admin/features/order/domain/order_repository.dart';

class GetVendorOrdersUsecase extends UseCase<List<OrderEntity>, NoParams> {
  final OrderRepository repository;

  GetVendorOrdersUsecase({required this.repository});

  @override
  Future<Either<Failure, List<OrderEntity>>> call(NoParams entity) {
    return repository.getVendorOrders();
  }
}
