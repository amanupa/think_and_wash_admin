class OrderEntity {
  final String customerId;
  final String vendorId;
  final String id;
  final int itemCount;
  final String address;
  final String userName;
  final String userPhone;
  final String venName;
  final String venPhone;
  final PaymentType paymentType;
  final List<OrderItemEntity> items;
  final DateTime orderDate;
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
    required this.venName,
    required this.venPhone,
    required this.paymentType,
    required this.items,
    required this.orderDate,
    required this.status,
    required this.totalAmount,
  });

  OrderEntity copyWith({OrderStatus? status, double? totalAmount}) {
    return OrderEntity(
      id: id,
      customerId: customerId,
      vendorId: vendorId,
      itemCount: itemCount,
      address: address,
      userName: userName,
      userPhone: userPhone,
      venName: venName,
      venPhone: venPhone,
      paymentType: paymentType,
      items: items,
      orderDate: orderDate,
      status: status ?? this.status,
      totalAmount: totalAmount ?? this.totalAmount,
    );
  }
}

class OrderItemEntity {
  final String name;
  final int quantity;
  final double price;
  final double subtotal;

  const OrderItemEntity({
    required this.name,
    required this.quantity,
    required this.price,
    required this.subtotal,
  });
}

enum PaymentType { paid, cod }

enum OrderStatus { booked, picked, delivered, cancelled }
//delivery,