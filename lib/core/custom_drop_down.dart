import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

class CustomDropdownField extends StatelessWidget {
  final String? value;
  final String hint;
  final List<String> items;
  final Function(String?) onChanged;

  const CustomDropdownField({
    super.key,
    required this.value,
    required this.hint,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        value: value,

        hint: Text(hint, style: Theme.of(context).textTheme.titleSmall),

        isExpanded: true,

        iconStyleData: IconStyleData(
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.boxShadowblue,
            size: 30,
          ),
        ),

        buttonStyleData: ButtonStyleData(
          height: 55,
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                spreadRadius: -5,
                offset: const Offset(0, 5),
                color: AppColors.boxShadowPink,
              ),
            ],
          ),
        ),

        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: AppColors.boxShadowPink,
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
        ),

        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        ),

        items:
            items
                .map(
                  (e) => DropdownMenuItem<String>(
                    value: e,
                    child: Text(
                      e,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                )
                .toList(),

        onChanged: onChanged,
      ),
    );
  }
}
