import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:think_and_wash_admin/core/app_colors.dart';
import 'package:think_and_wash_admin/core/custom_button.dart';
import 'package:think_and_wash_admin/core/snack_bar_messages.dart';
import 'package:think_and_wash_admin/features/order/domain/order_entity.dart';
import 'package:think_and_wash_admin/features/order/presentation/bloc/orders_bloc.dart';
import 'package:think_and_wash_admin/features/order/presentation/bloc/orders_event.dart';
import 'package:think_and_wash_admin/features/order/presentation/bloc/orders_state.dart';
import 'package:think_and_wash_admin/features/order/presentation/widgets/order_detail_header.dart';
import 'package:think_and_wash_admin/features/order/presentation/widgets/order_items_list.dart';

class OrderDetailPage extends StatelessWidget {
  final OrderEntity order;
  final bool showUpdateButton;

  const OrderDetailPage({
    super.key,
    required this.order,
    this.showUpdateButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderBloc, OrderState>(
      listener: (context, state) {
        if (state.updateSuccess != null) {
          SnackbarService.success(state.updateSuccess!);
          Navigator.pop(context);
        }
        if (state.updateError != null) {
          SnackbarService.error(state.updateError!);
        }
      },
      builder: (context, state) {
        final nextStatus = _getNextStatus(order.status);
        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            backgroundColor: AppColors.background,
            title: Text(
              "Order Details",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    OrderDetailHeader(order: order),
                    const SizedBox(height: 16),
                    OrderItemsList(items: order.items),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [_buildBottomBar(context, state)!],
              ),
            ],
          ),

          //bottomNavigationBar: _buildBottomBar(context, state),
        );
      },
    );
  }

  Widget? _buildBottomBar(BuildContext context, OrderState state) {
    if (!showUpdateButton) return null;

    final nextStatus = _getNextStatus(order.status);
    if (nextStatus == null) return null;

    return CustomButton(
      onpressed: () {
        context.read<OrderBloc>().add(
          UpdateOrderStatusEvent(orderId: order.id, status: nextStatus),
        );
      },
      childd:
          state.isUpdating
              ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
              : Text(
                "Mark as ${nextStatus.toUpperCase()}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
    );
  }

  String? _getNextStatus(OrderStatus current) {
    switch (current) {
      case OrderStatus.booked:
        return "picked";
      case OrderStatus.picked:
        return "delivered";
      case OrderStatus.delivered:
      case OrderStatus.cancelled:
        return null;
    }
  }
}

/*      case OrderStatus.delivery:
        return "delivered"; */
