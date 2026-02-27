import 'package:equatable/equatable.dart';

import '../../domain/order_entity.dart';

class OrderState extends Equatable {
  final bool isLoading;
  final List<OrderEntity> allOrders;
  final String? error;

  const OrderState({
    required this.isLoading,
    required this.allOrders,
    this.error,
  });

  OrderState copyWith({
    bool? isLoading,
    List<OrderEntity>? allOrders,
    String? error,
  }) {
    return OrderState(
      isLoading: isLoading ?? this.isLoading,
      allOrders: allOrders ?? this.allOrders,
      error: error,
    );
  }

  @override
  List<Object?> get props => [isLoading, allOrders, error];
}
