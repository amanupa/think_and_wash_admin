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
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.7,
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
          child: TextButton(
            onPressed: isLoading ? null : onPressed,
            child:
                isLoading
                    ? const CircularProgressIndicator()
                    : Text(text, style: Theme.of(context).textTheme.bodyMedium),
          ),
        ),
      ),
    );
  }
}
