import 'package:dartz/dartz.dart';
import 'package:think_and_wash_admin/core/failure.dart';
import 'package:think_and_wash_admin/features/order/domain/order_entity.dart';
import 'package:think_and_wash_admin/features/order/domain/order_repository.dart';

class UpdateOrderStatusParams {
  final String orderId;
  final String status;

  UpdateOrderStatusParams({required this.orderId, required this.status});
}

class UpdateOrderStatusUsecase {
  final OrderRepository repository;

  UpdateOrderStatusUsecase({required this.repository});

  Future<Either<Failure, OrderEntity>> call(
    UpdateOrderStatusParams params,
  ) {
    return repository.updateOrderStatus(
      orderId: params.orderId,
      status: params.status,
    );
  }
}
