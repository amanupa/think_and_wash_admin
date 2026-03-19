import 'package:flutter/material.dart';
import 'package:think_and_wash_admin/core/app_colors.dart';

class HomeBottomTabs extends StatelessWidget {
  final TabController tabController;

  const HomeBottomTabs({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: TabBar(
        controller: tabController,
        labelStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: Theme.of(context).textTheme.titleMedium,
        indicatorColor: AppColors.primary,
        indicatorWeight: 3,
        tabs: const [
          Tab(icon: Icon(Icons.shopping_bag_outlined), text: "Orders"),
          Tab(icon: Icon(Icons.monetization_on_outlined), text: "Revenue"),
        ],
      ),
    );
  }
}
