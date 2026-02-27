import 'package:flutter/material.dart';

import 'app_colors.dart';

class CustomCircularButton extends StatelessWidget {
  final String btnTitle;

  final VoidCallback onpressed;
  const CustomCircularButton({
    super.key,
    required this.onpressed,
    required this.btnTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 16,
      right: -250,
      bottom: 16,
      child: SafeArea(
        child: Container(
          height: 80,
          width: 80,

          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.background,

            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                spreadRadius: -2,
                color: AppColors.boxShadowPink,
              ),
            ],
          ),
          child: TextButton(
            onPressed: onpressed, //"Pay ₹ ${total.toStringAsFixed(0)}"
            child: Image.asset(
              "assets/cart.png",
              fit: BoxFit.cover,
              height: 80,
              width: 80,
            ),
          ),
        ),
      ),
    );
  }
}
