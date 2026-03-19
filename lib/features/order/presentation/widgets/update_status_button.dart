import 'package:flutter/material.dart';
import '../../../../core/app_colors.dart';

class UpdateStatusButton extends StatelessWidget {
  final String nextStatus;
  final bool isLoading;
  final VoidCallback onPressed;

  const UpdateStatusButton({
    super.key,
    required this.nextStatus,
    required this.isLoading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.background,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: -2,
            offset: const Offset(0, -3),
            color: AppColors.boxShadowPink,
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: TextButton(
          onPressed: isLoading ? null : onPressed,

          child:
              isLoading
                  ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                  : Text(
                    "Mark as ${nextStatus.toUpperCase()}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
        ),
      ),
    );
  }
}
