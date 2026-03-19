import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/order_entity.dart';

import '../bloc/orders_bloc.dart';
import '../bloc/orders_state.dart';
import '../widgets/order_card.dart';

class Delivery extends StatelessWidget {
  const Delivery({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        //e.status == OrderStatus.delivery ||
        final orders =
            state.allOrders
                .where((e) => e.status == OrderStatus.picked)
                .toList();

        if (orders.isEmpty) {
          return const Center(child: Text("No Delivery Orders"));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            return OrderCard(order: order);
          },
        );
      },
    );
  }
}
