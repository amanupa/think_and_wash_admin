import '../../domain/order_entity.dart';
import '../../domain/order_repository.dart';

class MockOrderRepository implements OrderRepository {
  @override
  Future<List<OrderEntity>> getOrders() async {
    await Future.delayed(const Duration(milliseconds: 500));

    return [
      OrderEntity(
        id: "1",
        itemCount: 5,
        address: "Chandigarh University",
        userName: "Aman Upadhyay",
        userPhone: "9876543210",
        paymentType: PaymentType.cod,
        items: const [],
        orderDate: DateTime.now(),
        deliveryDate: DateTime.now().add(const Duration(days: 2)),
        status: OrderStatus.pickup,
        totalAmount: 450,
      ),
      OrderEntity(
        id: "2",
        itemCount: 3,
        address: "CGC Landran",
        userName: "Rahul Verma",
        userPhone: "9123456780",
        paymentType: PaymentType.paid,
        items: const [],
        orderDate: DateTime.now(),
        deliveryDate: DateTime.now().add(const Duration(days: 1)),
        status: OrderStatus.pickup,
        totalAmount: 300,
      ),
      OrderEntity(
        id: "3",
        itemCount: 8,
        address: "Rayat Bahra Univeristy",
        userName: "Kiran Bala",
        userPhone: "9988776655",
        paymentType: PaymentType.cod,
        items: const [],
        orderDate: DateTime.now(),
        deliveryDate: DateTime.now().add(const Duration(days: 3)),
        status: OrderStatus.pickup,
        totalAmount: 600,
      ),
      OrderEntity(
        id: "4",
        itemCount: 8,
        address: "Chandigarh University Kharar",
        userName: "Shubham Singh",
        userPhone: "9988776655",
        paymentType: PaymentType.paid,
        items: const [],
        orderDate: DateTime.now(),
        deliveryDate: DateTime.now().add(const Duration(days: 3)),
        status: OrderStatus.delivery,
        totalAmount: 600,
      ),
      OrderEntity(
        id: "5",
        itemCount: 9,
        address: "Rayat Bahra University",
        userName: "Manik Sharma",
        userPhone: "9988776655",
        paymentType: PaymentType.cod,
        items: const [],
        orderDate: DateTime.now(),
        deliveryDate: DateTime.now().add(const Duration(days: 3)),
        status: OrderStatus.delivery,
        totalAmount: 1600,
      ),
      OrderEntity(
        id: "6",
        itemCount: 5,
        address: "Rayat Bahra University",
        userName: "Saroj Singh",
        userPhone: "9988776655",
        paymentType: PaymentType.paid,
        items: const [],
        orderDate: DateTime.now(),
        deliveryDate: DateTime.now().add(const Duration(days: 3)),
        status: OrderStatus.delivered,
        totalAmount: 550,
      ),
      OrderEntity(
        id: "7",
        itemCount: 7,
        address: "Chandigarh University Kharar",
        userName: "Aman",
        userPhone: "9988776655",
        paymentType: PaymentType.cod,
        items: const [],
        orderDate: DateTime.now(),
        deliveryDate: DateTime.now().add(const Duration(days: 3)),
        status: OrderStatus.delivery,
        totalAmount: 950,
      ),
    ];
  }

  @override
  Future<void> updateOrderStatus({
    required String orderId,
    required OrderStatus status,
  }) async {}
}
