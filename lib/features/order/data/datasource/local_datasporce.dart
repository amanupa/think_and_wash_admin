import 'package:dartz/dartz.dart';
import 'package:think_and_wash_admin/core/failure.dart';
import '../../domain/order_entity.dart';
import '../../domain/order_repository.dart';

/// Mock repository — kept for testing/development only
class MockOrderRepository implements OrderRepository {
  @override
  Future<Either<Failure, List<OrderEntity>>> getVendorOrders() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return right([
      OrderEntity(
        id: "1",
        customerId: "user_01",
        vendorId: "ven_t&w_01",
        itemCount: 5,
        address: "Chandigarh University",
        userName: "Test User",
        userPhone: "9876543210",
        venName: "t&w",
        venPhone: "92****24",
        paymentType: PaymentType.cod,
        items: const [],
        orderDate: DateTime.now(),
        status: OrderStatus.booked,
        totalAmount: 450,
      ),
    ]);
  }

  @override
  Future<Either<Failure, OrderEntity>> updateOrderStatus({
    required String orderId,
    required String status,
  }) async {
    return right(OrderEntity(
      id: orderId,
      customerId: "user_01",
      vendorId: "ven_t&w_01",
      itemCount: 5,
      address: "Chandigarh University",
      userName: "Test User",
      userPhone: "9876543210",
      venName: "t&w",
      venPhone: "92****24",
      paymentType: PaymentType.cod,
      items: const [],
      orderDate: DateTime.now(),
      status: OrderStatus.picked,
      totalAmount: 450,
    ));
  }
}
