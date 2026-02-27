import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../domain/order_entity.dart';

class OrderCard extends StatelessWidget {
  final OrderEntity order;

  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: -5,
            offset: Offset(2, 5),
            color: AppColors.boxShadowPink,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Name + Phone
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                order.userName,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                order.userPhone,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),

          const SizedBox(height: 8),

          /// Address
          Text(order.address, style: Theme.of(context).textTheme.titleSmall),

          const SizedBox(height: 8),

          /// Total Items
          Text(
            "Total Items: ${order.itemCount}",
            style: Theme.of(context).textTheme.titleSmall,
          ),

          const SizedBox(height: 8),

          /// Payment + Order Date
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "₹ ${order.totalAmount.toStringAsFixed(0)}  ",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    order.paymentType == PaymentType.cod ? ".COD" : ".PAID",
                    style: TextStyle(
                      color:
                          order.paymentType == PaymentType.cod
                              ? Colors.orange
                              : Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text(
                "Order Date: ${order.orderDate.toLocal().toString().split(' ')[0]}",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
