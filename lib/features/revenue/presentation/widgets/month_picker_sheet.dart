import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:think_and_wash_admin/features/revenue/presentation/bloc/revenue_cubit.dart';
import 'package:think_and_wash_admin/features/revenue/presentation/utils/revenue_analytics.dart';
import 'package:think_and_wash_admin/features/revenue/presentation/widgets/month_chip.dart';

class MonthPickerSheet extends StatelessWidget {
  final List<DateTime> months;
  final DateTime? selectedMonth;

  const MonthPickerSheet({
    super.key,
    required this.months,
    required this.selectedMonth,
  });

  bool _isSame(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RevenueCubit>();

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Select Month',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              MonthChip(
                label: 'All',
                isSelected: selectedMonth == null,
                onTap: () {
                  cubit.selectMonth(null);
                  Navigator.pop(context);
                },
              ),
              ...months.map((m) {
                final isSelected =
                    selectedMonth != null && _isSame(m, selectedMonth!);
                return MonthChip(
                  label: RevenueAnalytics.monthLabel(m),
                  isSelected: isSelected,
                  onTap: () {
                    cubit.selectMonth(m);
                    Navigator.pop(context);
                  },
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
