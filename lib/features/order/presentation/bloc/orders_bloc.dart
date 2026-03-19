import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:think_and_wash_admin/core/usecase_interfase.dart';
import 'package:think_and_wash_admin/features/order/domain/get_vendor_orders_usecase.dart';
import 'package:think_and_wash_admin/features/order/domain/update_order_status_usecase.dart';
import 'package:think_and_wash_admin/features/order/presentation/bloc/orders_event.dart';
import 'package:think_and_wash_admin/features/order/presentation/bloc/orders_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final GetVendorOrdersUsecase getVendorOrdersUsecase;
  final UpdateOrderStatusUsecase updateOrderStatusUsecase;

  OrderBloc({
    required this.getVendorOrdersUsecase,
    required this.updateOrderStatusUsecase,
  }) : super(const OrderState(isLoading: false, allOrders: [])) {
    on<LoadOrders>(_onLoadOrders);
    on<UpdateOrderStatusEvent>(_onUpdateOrderStatus);
  }

  Future<void> _onLoadOrders(
    LoadOrders event,
    Emitter<OrderState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));

    final result = await getVendorOrdersUsecase(NoParams());

    result.fold(
      (failure) {
        emit(state.copyWith(
          isLoading: false,
          error: failure.message ?? "Failed to load orders",
        ));
      },
      (orders) {
        emit(state.copyWith(isLoading: false, allOrders: orders));
      },
    );
  }

  Future<void> _onUpdateOrderStatus(
    UpdateOrderStatusEvent event,
    Emitter<OrderState> emit,
  ) async {
    emit(state.copyWith(isUpdating: true, updateError: null));

    final result = await updateOrderStatusUsecase(
      UpdateOrderStatusParams(
        orderId: event.orderId,
        status: event.status,
      ),
    );

    result.fold(
      (failure) {
        debugPrint("Update status failed: ${failure.message}");
        emit(state.copyWith(
          isUpdating: false,
          updateError: failure.message ?? "Failed to update",
        ));
      },
      (updatedOrder) {
        final updatedOrders = state.allOrders.map((order) {
          if (order.id == updatedOrder.id) return updatedOrder;
          return order;
        }).toList();

        emit(state.copyWith(
          isUpdating: false,
          allOrders: updatedOrders,
          updateSuccess: "Order status updated successfully",
        ));
      },
    );
  }
}
