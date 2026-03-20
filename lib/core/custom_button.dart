import 'package:flutter/material.dart';

import 'app_colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onpressed;
  final Widget childd;
  const CustomButton({
    super.key,
    required this.onpressed,

    required this.childd,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
            child: childd /*Text(
                btnTitle,
                style: Theme.of(context).textTheme.bodyMedium,
              ),*/,
          ),
        ),
      ),
    );
  }
}
