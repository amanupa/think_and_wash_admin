import 'package:flutter/material.dart';

import 'app_colors.dart';

class CustomButton extends StatelessWidget {
  final String btnTitle;
  final VoidCallback onpressed;
  const CustomButton({
    super.key,
    required this.onpressed,
    required this.btnTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 16,
      right: 16,
      bottom: 16,
      child: SafeArea(
        child: Center(
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.8,
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
              onPressed: onpressed, //"Pay ₹ ${total.toStringAsFixed(0)}"
              child: Text(
                btnTitle,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
