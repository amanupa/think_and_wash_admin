import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:think_and_wash_admin/core/app_colors.dart';
import 'package:think_and_wash_admin/features/revenue/presentation/bloc/revenue_cubit.dart';
import 'package:think_and_wash_admin/features/revenue/presentation/utils/revenue_analytics.dart';
import 'package:think_and_wash_admin/features/revenue/presentation/widgets/month_picker_sheet.dart';

/// Button at the bottom that shows the current period and opens the month picker.
class MonthPickerButton extends StatelessWidget {
  final DateTime? selectedMonth;

  const MonthPickerButton({super.key, required this.selectedMonth});

  String get _label =>
      selectedMonth == null
          ? 'All Time'
          : RevenueAnalytics.monthLabel(selectedMonth!);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      //top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 8, 30, 0),
        child: GestureDetector(
          onTap: () => _openPicker(context),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 14),

            decoration: BoxDecoration(
              border: Border.all(color: AppColors.seedColor),
              color: AppColors.background,
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(
                colors: [AppColors.background, AppColors.boxShadowblue],
                begin: Alignment.bottomRight,
                end: Alignment.topRight,
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  spreadRadius: -2,
                  color: AppColors.boxShadowPink,
                  offset: Offset(1, 3),
                ),
              ],
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.calendar_month_outlined,
                  color: AppColors.secText,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  'Viewing: $_label  ›',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openPicker(BuildContext context) {
    final months = RevenueAnalytics.lastNMonths(DateTime.now(), 12);
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder:
          (_) => BlocProvider.value(
            value: context.read<RevenueCubit>(),
            child: MonthPickerSheet(
              months: months,
              selectedMonth: selectedMonth,
            ),
          ),
    );
  }
}
