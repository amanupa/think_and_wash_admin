import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:think_and_wash_admin/core/snack_bar_messages.dart';
import 'package:think_and_wash_admin/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:think_and_wash_admin/features/route/app_routes.dart';

import '../widgets/otp_form.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final TextEditingController phnController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is OtpRequestedFailure) {
            SnackbarService.error("Otp request fail, Try again...");
          }
          if (state is OtpValidationFailure) {
            SnackbarService.error(
              "Otp validation fail wrong otp, Try again...",
            );
          }
          if (state is OtpValidationSuccess) {
            Navigator.of(context).pushNamed(AppRoutes.home);
          }
        },
        builder: (context, state) {
          if (state is OtpRequestedSuccess || state is OtpValidationFailure) {
            return OtpTextFieldForm(
              formController: otpController,
              hintText: "Enter Otp",
              buttonText: "Submit Otp",
              isLoading: state is OtpValidationLoading,
              onPressed: () {
                context.read<AuthBloc>().add(
                  OtpValidationRequested(otp: otpController.text),
                );
                otpController.text = "";
              },
            );
          }
          if (state is OtpRequestedFailure || state is AuthInitial) {
            return OtpTextFieldForm(
              formController: phnController,
              hintText: "Phone number for otp",
              buttonText: "Request Otp",
              isLoading: state is OtpRequestedLoading,
              onPressed: () {
                context.read<AuthBloc>().add(
                  OtpRequested(phn: phnController.text),
                );
                phnController.text = "";
              },
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
