import '../domain/order_entity.dart';

class OrderModel extends OrderEntity {
  const OrderModel({
    required super.id,
    required super.customerId,
    required super.vendorId,
    required super.itemCount,
    required super.address,
    required super.userName,
    required super.userPhone,
    required super.venName,
    required super.venPhone,
    required super.paymentType,
    required super.items,
    required super.orderDate,
    required super.status,
    required super.totalAmount,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['_id'] ?? '',
      customerId: json['customerId'] ?? '',
      vendorId: json['vendorId'] ?? '',
      itemCount: json['itemCount'] ?? 0,
      address: json['address'] ?? '',
      userName: json['userName'] ?? '',
      userPhone: json['userPhone'] ?? '',
      venName: json['venName'] ?? '',
      venPhone: json['venPhone'] ?? '',
      paymentType:
          json['paymentType'] == 'paid' ? PaymentType.paid : PaymentType.cod,
      items: _parseItems(json['items']),
      orderDate: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
      status: _mapStatus(json['status'] ?? 'booked'),
      totalAmount: (json['totalAmount'] as num?)?.toDouble() ?? 0.0,
    );
  }

  static List<OrderItemEntity> _parseItems(dynamic itemsJson) {
    if (itemsJson == null || itemsJson is! List) return [];
    return itemsJson
        .map(
          (e) => OrderItemEntity(
            name: e['itemName'] ?? '',
            quantity: e['quantity'] ?? 0,
            price: (e['price'] as num?)?.toDouble() ?? 0.0,
            subtotal: (e['subtotal'] as num?)?.toDouble() ?? 0.0,
          ),
        )
        .toList();
  }

  static OrderStatus _mapStatus(String status) {
    switch (status) {
      case 'booked':
        return OrderStatus.booked;
      case 'picked':
        return OrderStatus.picked;
      case 'delivered':
        return OrderStatus.delivered;
      case 'cancelled':
        return OrderStatus.cancelled;
      default:
        return OrderStatus.booked;
    }
  }
}

/*        return OrderStatus.delivery;
      case 'delivered': */
