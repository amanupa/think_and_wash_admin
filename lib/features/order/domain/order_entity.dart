class OrderEntity {
  final String customerId;
  final String vendorId;
  final String id;
  final int itemCount;
  final String address;
  final String userName;
  final String userPhone;
  final PaymentType paymentType;
  final List<OrderItemEntity> items;
  final DateTime orderDate;
  final DateTime deliveryDate;
  final OrderStatus status;
  final double totalAmount;

  const OrderEntity({
    required this.id,
    required this.customerId,
    required this.vendorId,
    required this.itemCount,
    required this.address,
    required this.userName,
    required this.userPhone,
    required this.paymentType,
    required this.items,
    required this.orderDate,
    required this.deliveryDate,
    required this.status,
    required this.totalAmount,
  });

  OrderEntity copyWith({
    OrderStatus? status,
    double? totalAmount, // optional future flexibility
  }) {
    return OrderEntity(
      id: id,
      customerId: customerId,
      vendorId: vendorId,
      itemCount: itemCount,
      address: address,
      userName: userName,
      userPhone: userPhone,
      paymentType: paymentType,
      items: items,
      orderDate: orderDate,
      deliveryDate: deliveryDate,
      status: status ?? this.status,
      totalAmount: totalAmount ?? this.totalAmount, // ✅ NEW
    );
  }
}

class OrderItemEntity {
  final String name;
  final int quantity;

  const OrderItemEntity({required this.name, required this.quantity});
}

enum PaymentType { paid, cod }

enum OrderStatus { pickup, delivery, delivered }
