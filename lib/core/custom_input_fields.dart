import 'package:flutter/material.dart';

import 'app_colors.dart';

class CustomInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final TextInputType? keyboardType;
  final int maxLines;
  final String? Function(String?)? validator;

  const CustomInputField({
    super.key,
    required this.controller,
    required this.hint,
    this.keyboardType,
    this.maxLines = 1,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: AppColors.background,
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            spreadRadius: -5,
            offset: const Offset(0, 5),
            color: AppColors.boxShadowPink,
          ),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        style: Theme.of(context).textTheme.titleSmall,
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        validator: validator,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          hintStyle: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
