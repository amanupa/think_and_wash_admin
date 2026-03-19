import 'package:equatable/equatable.dart';

import '../../domain/order_entity.dart';

class OrderState extends Equatable {
  final bool isLoading;
  final bool isUpdating;
  final List<OrderEntity> allOrders;
  final String? error;
  final String? updateError;
  final String? updateSuccess;

  const OrderState({
    required this.isLoading,
    required this.allOrders,
    this.isUpdating = false,
    this.error,
    this.updateError,
    this.updateSuccess,
  });

  OrderState copyWith({
    bool? isLoading,
    bool? isUpdating,
    List<OrderEntity>? allOrders,
    String? error,
    String? updateError,
    String? updateSuccess,
  }) {
    return OrderState(
      isLoading: isLoading ?? this.isLoading,
      isUpdating: isUpdating ?? this.isUpdating,
      allOrders: allOrders ?? this.allOrders,
      error: error,
      updateError: updateError,
      updateSuccess: updateSuccess,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    isUpdating,
    allOrders,
    error,
    updateError,
    updateSuccess,
  ];
}
