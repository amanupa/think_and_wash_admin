/*import 'package:think_and_wash_admin/features/order/domain/order_entity.dart';
import 'package:think_and_wash_admin/features/order/domain/order_repository.dart';



class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource remoteDataSource;

  OrderRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<OrderEntity>> getOrders() async {
    return await remoteDataSource.getOrders();
  }

  @override
  Future<void> updateOrderStatus({
    required String orderId,
    required OrderStatus status,
  }) async {
    await remoteDataSource.updateOrderStatus(orderId, status.index + 1);
  }
}*/
