import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../domain/order_entity.dart';
import '../screens/order_detail_page.dart';

class OrderCard extends StatelessWidget {
  final OrderEntity order;
  final bool showUpdateButton;

  const OrderCard({
    super.key,
    required this.order,
    this.showUpdateButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => OrderDetailPage(
              order: order,
              showUpdateButton: showUpdateButton,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(14),
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
            _buildHeader(context),
            const SizedBox(height: 8),
            Text(order.address,
                style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 8),
            Text("Total Items: ${order.itemCount}",
                style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 8),
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(order.userName,
            style: Theme.of(context).textTheme.bodyLarge),
        Text(order.userPhone,
            style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text("₹ ${order.totalAmount.toStringAsFixed(0)}  ",
                style: Theme.of(context).textTheme.bodyMedium),
            Text(
              order.paymentType == PaymentType.cod ? ".COD" : ".PAID",
              style: TextStyle(
                color: order.paymentType == PaymentType.cod
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
    );
  }
}
