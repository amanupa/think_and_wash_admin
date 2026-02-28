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
    required super.paymentType,
    required super.items,
    required super.orderDate,
    required super.deliveryDate,
    required super.status,
    required super.totalAmount,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      customerId: json['customerId'],
      vendorId: json['vendorId'],
      itemCount: json['item_count'],
      address: json['address'],
      userName: json['user_name'],
      userPhone: json['user_phone'],
      paymentType:
          json['payment'] == 'paid' ? PaymentType.paid : PaymentType.cod,
      items:
          (json['items'] as List)
              .map(
                (e) =>
                    OrderItemEntity(name: e['name'], quantity: e['quantity']),
              )
              .toList(),
      orderDate: DateTime.parse(json['order_date']),
      deliveryDate: DateTime.parse(json['delivery_date']),
      status: _mapStatus(
        json['status'] is int
            ? json['status']
            : int.parse(json['status'].toString()),
      ),
      totalAmount: (json['total_amount'] as num).toDouble(),
    );
  }
  static OrderStatus _mapStatus(int status) {
    switch (status) {
      case 1:
        return OrderStatus.pickup;
      case 2:
        return OrderStatus.delivery;
      case 3:
        return OrderStatus.delivered;
      default:
        return OrderStatus.pickup;
    }
  }
}
