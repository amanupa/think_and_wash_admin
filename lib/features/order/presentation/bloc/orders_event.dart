import 'package:equatable/equatable.dart';

import '../../domain/order_entity.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object?> get props => [];
}

class LoadOrders extends OrderEvent {
  final String venId;

  const LoadOrders({required this.venId});
  @override
  List<Object?> get props => [venId];
}

class RefreshOrders extends OrderEvent {}

class ChangeTab extends OrderEvent {
  final OrderStatus status;

  const ChangeTab(this.status);

  @override
  List<Object?> get props => [status];
}

class UpdateOrderStatus extends OrderEvent {
  final String orderId;
  final OrderStatus status;

  const UpdateOrderStatus({required this.orderId, required this.status});

  @override
  List<Object?> get props => [orderId, status];
}
