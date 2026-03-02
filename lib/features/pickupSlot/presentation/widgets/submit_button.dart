import 'package:flutter/material.dart';
import 'package:think_and_wash_admin/core/app_colors.dart';

class AppSubmitButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onPressed;
  final String text;

  const AppSubmitButton({
    super.key,
    required this.isLoading,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
              blurRadius: 10,
              spreadRadius: -2,
              color: AppColors.boxShadowPink,
            ),
          ],
        ),
        child: TextButton(
          onPressed: isLoading ? null : onPressed,
          child:
              isLoading
                  ? const CircularProgressIndicator()
                  : Text(text, style: Theme.of(context).textTheme.bodyMedium),
        ),
      ),
    );
  }
}
