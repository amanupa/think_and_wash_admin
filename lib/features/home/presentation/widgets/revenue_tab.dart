import 'package:flutter/material.dart';
import 'package:think_and_wash_admin/core/app_colors.dart';

class RevenueTab extends StatelessWidget {
  const RevenueTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.bar_chart_rounded,
            size: 64,
            color: AppColors.boxShadowblue,
          ),
          const SizedBox(height: 16),
          Text(
            "Revenue",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            "Revenue analytics coming soon",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
