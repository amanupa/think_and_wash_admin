import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';

class DateSelector extends StatelessWidget {
  final String selectedDate;
  final VoidCallback onDateChanged;

  const DateSelector({
    super.key,
    required this.selectedDate,
    required this.onDateChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onDateChanged,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.boxShadowPink),
          boxShadow: [
            BoxShadow(
              color: AppColors.boxShadowPink,
              blurRadius: 5,
              spreadRadius: -1,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(selectedDate, style: Theme.of(context).textTheme.titleMedium),
            const Icon(
              Icons.calendar_month,
              size: 24,
              color: AppColors.secText,
            ),
          ],
        ),
      ),
    );
  }
}
