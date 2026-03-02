import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/app_colors.dart';

class AppNumberField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;

  const AppNumberField({
    super.key,
    required this.controller,
    required this.label,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        // padding: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.background),
          boxShadow: [
            BoxShadow(
              color: AppColors.boxShadowPink,
              blurRadius: 5,
              spreadRadius: -3,
              offset: Offset(3, 0),
            ),
          ],
        ),
        child: TextFormField(
          style: Theme.of(context).textTheme.titleMedium,
          controller: controller,

          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          validator:
              validator ??
              (value) {
                if (value == null || value.isEmpty) {
                  return "$label is required";
                }
                if (int.tryParse(value) == null) {
                  return "Enter valid number";
                }
                return null;
              },

          decoration: InputDecoration(
            labelText: label,
            labelStyle: Theme.of(context).textTheme.titleMedium,

            border: OutlineInputBorder(borderSide: BorderSide.none),
            //border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}
