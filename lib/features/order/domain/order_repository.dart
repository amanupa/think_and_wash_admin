import 'package:think_and_wash_admin/features/order/domain/order_entity.dart';

abstract class OrderRepository {
  Future<List<OrderEntity>> getOrders(String venId);
  Future<void> updateOrderStatus({
    required String orderId,
    required OrderStatus status,
  });
}
