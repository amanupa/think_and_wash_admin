import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';

class SpacialNote extends StatelessWidget {
  const SpacialNote({super.key, required TextEditingController noteController})
    : _noteController = noteController;

  final TextEditingController _noteController;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        controller: _noteController,
        decoration: const InputDecoration(
          labelText: "Special Note",

          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
