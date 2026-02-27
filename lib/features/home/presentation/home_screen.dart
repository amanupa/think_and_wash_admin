import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:think_and_wash_admin/features/order/presentation/screens/delivered.dart';
import 'package:think_and_wash_admin/features/order/presentation/screens/delivery.dart';
import 'package:think_and_wash_admin/features/order/presentation/screens/pickup.dart';

import '../../../core/app_colors.dart';
import '../../order/data/datasource/local_datasporce.dart';
import '../../order/presentation/bloc/orders_bloc.dart';
import '../../order/presentation/bloc/orders_event.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OrderBloc(MockOrderRepository())..add(LoadOrders()),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor: AppColors.background,
            title: Text(
              "Think & Wash Admin",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            bottom: TabBar(
              labelStyle: Theme.of(context).textTheme.bodyMedium,
              indicatorColor: AppColors.primary,
              tabs: const [
                Tab(text: "PickUp"),
                Tab(text: "Delivery"),
                Tab(text: "Delivered"),
              ],
            ),
          ),
          body: const TabBarView(children: [Pickup(), Delivery(), Delivered()]),
        ),
      ),
    );
  }
}
