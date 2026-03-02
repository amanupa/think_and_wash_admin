import 'package:flutter/material.dart';
import 'package:think_and_wash_admin/core/app_colors.dart';

class TimePickerField extends StatelessWidget {
  final TimeOfDay? value;
  final String label;
  final ValueChanged<TimeOfDay> onTimeSelected;

  const TimePickerField({
    super.key,
    required this.value,
    required this.label,
    required this.onTimeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _pickTime(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(12),
          // border: Border.all(color: AppColors.background),
          boxShadow: [
            BoxShadow(
              color: AppColors.boxShadowPink,
              blurRadius: 5,
              spreadRadius: -2,
              offset: Offset(3, 0),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value != null ? value!.format(context) : label,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Icon(Icons.access_time_outlined, color: AppColors.secText),
          ],
        ),
      ),
    );
  }

  Future<void> _pickTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: value ?? TimeOfDay.now(),
    );

    if (picked != null) {
      onTimeSelected(picked);
    }
  }
}
