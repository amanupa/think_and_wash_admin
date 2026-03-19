import 'package:flutter/material.dart';
import '../../../../core/app_colors.dart';
import '../../domain/order_entity.dart';

class OrderItemsList extends StatelessWidget {
  final List<OrderItemEntity> items;

  const OrderItemsList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Text("No item details available"),
      );
    }

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
            color: AppColors.boxShadowblue,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Items", style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          ...items.map((item) => _itemRow(context, item)),
        ],
      ),
    );
  }

  Widget _itemRow(BuildContext context, OrderItemEntity item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              "${item.name} × ${item.quantity}",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Text(
            "₹ ${item.subtotal.toStringAsFixed(0)}",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
