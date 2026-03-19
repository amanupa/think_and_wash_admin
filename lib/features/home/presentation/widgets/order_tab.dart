import 'package:flutter/material.dart';
import 'package:think_and_wash_admin/core/app_colors.dart';

import '../../../order/presentation/screens/delivered.dart';
import '../../../order/presentation/screens/delivery.dart';
import '../../../order/presentation/screens/pickup.dart';

class OrderTab extends StatelessWidget {
  const OrderTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            labelStyle: Theme.of(context).textTheme.bodyMedium,
            indicatorColor: AppColors.primary,
            tabs: const [
              Tab(text: "PickUp"),
              Tab(text: "Delivery"),
              Tab(text: "Delivered"),
            ],
          ),
          const Expanded(
            child: TabBarView(
              children: [Pickup(), Delivery(), Delivered()],
            ),
          ),
        ],
      ),
    );
  }
}
