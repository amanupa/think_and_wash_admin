import 'package:dartz/dartz.dart';
import 'package:think_and_wash_admin/core/failure.dart';
import 'package:think_and_wash_admin/features/order/domain/order_entity.dart';

abstract class OrderRepository {
  Future<Either<Failure, List<OrderEntity>>> getVendorOrders();
  Future<Either<Failure, OrderEntity>> updateOrderStatus({
    required String orderId,
    required String status,
  });
}
