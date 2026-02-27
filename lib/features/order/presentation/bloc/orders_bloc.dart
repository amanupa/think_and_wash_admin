import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:think_and_wash_admin/features/order/domain/order_repository.dart';
import 'package:think_and_wash_admin/features/order/presentation/bloc/orders_event.dart';
import 'package:think_and_wash_admin/features/order/presentation/bloc/orders_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository repository;

  OrderBloc(this.repository)
    : super(const OrderState(isLoading: false, allOrders: [])) {
    on<LoadOrders>(_onLoadOrders);
    on<RefreshOrders>(_onLoadOrders);

    on<UpdateOrderStatus>(_onUpdateOrderStatus);
  }

  Future<void> _onUpdateOrderStatus(
    UpdateOrderStatus event,
    Emitter<OrderState> emit,
  ) async {
    try {
      await repository.updateOrderStatus(
        orderId: event.orderId,
        status: event.status,
      );

      final updatedOrders =
          state.allOrders.map((order) {
            if (order.id == event.orderId) {
              return order.copyWith(status: event.status);
            }
            return order;
          }).toList();

      emit(state.copyWith(allOrders: updatedOrders));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> _onLoadOrders(OrderEvent event, Emitter<OrderState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final orders = await repository.getOrders();
      emit(state.copyWith(isLoading: false, allOrders: orders));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
