import 'package:flutter/material.dart';

import '../../../core/app_colors.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/home_bottom_tabs.dart';
import 'widgets/order_tab.dart';
import 'widgets/revenue_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const HomeAppBar(),
      body: TabBarView(
        controller: _tabController,
        children: const [OrderTab(), RevenueTab()],
      ),
      bottomNavigationBar: HomeBottomTabs(
        tabController: _tabController,
      ),
    );
  }
}
