import 'package:flutter/material.dart';
import 'package:think_and_wash_admin/core/app_colors.dart';

class DatePickerField extends StatelessWidget {
  final String? value;
  final String hintText;
  final DateTime firstDate;
  final DateTime lastDate;
  final ValueChanged<DateTime> onDateSelected;

  const DatePickerField({
    super.key,
    required this.value,
    required this.onDateSelected,
    required this.firstDate,
    required this.lastDate,
    this.hintText = "Select Date",
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _pickDate(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.background),
          boxShadow: [
            BoxShadow(
              color: AppColors.boxShadowPink,
              blurRadius: 10,
              spreadRadius: -2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value ?? hintText,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Icon(Icons.calendar_today_outlined, color: AppColors.secText),
          ],
        ),
      ),
    );
  }

  Future<void> _pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (picked != null) {
      onDateSelected(picked);
    }
  }
}
