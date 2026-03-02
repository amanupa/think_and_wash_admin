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
          height: 450,
          width: 380,

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
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/vendor-login.png",
                    fit: BoxFit.cover,
                    height: 300,
                    width: 350,
                  ),
                ],
              ),
              Column(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                      // width: 250,
                      height: 45,
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
                          prefixIcon: Icon(
                            Icons.phone,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: SizedBox(
                      width: 200,
                      height: 45,
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
