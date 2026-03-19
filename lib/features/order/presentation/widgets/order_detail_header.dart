import 'package:flutter/material.dart';
import '../../../../core/app_colors.dart';
import '../../domain/order_entity.dart';

class OrderDetailHeader extends StatelessWidget {
  final OrderEntity order;

  const OrderDetailHeader({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: -5,
            offset: const Offset(2, 5),
            color: AppColors.boxShadowPink,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _row(context, "Customer", order.userName),
          const SizedBox(height: 8),
          _row(context, "Phone", order.userPhone),
          const SizedBox(height: 8),
          _row(context, "Address", order.address),
          const SizedBox(height: 8),
          _row(context, "Items", "${order.itemCount}"),
          const SizedBox(height: 8),
          _row(context, "Amount", "₹ ${order.totalAmount.toStringAsFixed(0)}"),
          const SizedBox(height: 8),
          _row(
            context,
            "Payment",
            order.paymentType == PaymentType.cod ? "COD" : "PAID",
          ),
          const SizedBox(height: 8),
          _row(context, "Status", order.status.name.toUpperCase()),
          const SizedBox(height: 8),
          _row(
            context,
            "Order Date",
            order.orderDate.toLocal().toString().split(' ')[0],
          ),
        ],
      ),
    );
  }

  Widget _row(BuildContext context, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodyMedium),
        Flexible(
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
