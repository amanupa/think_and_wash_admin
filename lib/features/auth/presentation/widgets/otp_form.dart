import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';

class OtpTextFieldForm extends StatelessWidget {
  final TextEditingController formController;
  final String buttonText;
  final String hintText;
  final bool isLoading;
  final VoidCallback onPressed;
  const OtpTextFieldForm({
    super.key,
    required this.buttonText,
    required this.formController,
    required this.hintText,
    required this.isLoading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Container(
          height: 400,
          width: 350,

          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                spreadRadius: -10,
                offset: Offset(10, 10),
                color: AppColors.boxShadowblue,
              ),
              BoxShadow(
                blurRadius: 10,
                spreadRadius: -10,
                offset: Offset(-10, -10),
                color: AppColors.boxShadowPink,
              ),
            ],
          ),
          child: Column(
            spacing: 50,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                width: 300,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      spreadRadius: -10,
                      offset: Offset(10, 10),
                      color: AppColors.boxShadowPink,
                    ),
                  ],
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextFormField(
                  controller: formController,
                  style: Theme.of(context).textTheme.bodyMedium,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.phone, color: AppColors.primary),
                  ),
                ),
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                    foregroundColor: AppColors.background,
                    shadowColor: AppColors.boxShadowblue,
                    backgroundColor: AppColors.primary,
                  ),
                  onPressed: isLoading ? null : onPressed,
                  child:
                      isLoading
                          ? CircularProgressIndicator()
                          : Text(buttonText),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
