import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:think_and_wash_admin/core/snack_bar_messages.dart';
import 'package:think_and_wash_admin/features/auth/domain/auth_entity.dart';
import 'package:think_and_wash_admin/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:think_and_wash_admin/features/route/app_routes.dart';

import '../widgets/otp_form.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final TextEditingController phnController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  // Store the phone number for OTP validation
  String _currentPhone = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is OtpRequestedFailure) {
            SnackbarService.error(state.msg);
          }
          if (state is OtpRequestedSuccess) {
            _currentPhone = state.phn;
          }
          if (state is OtpValidationFailure) {
            SnackbarService.error(state.msg);
          }
          if (state is OtpValidationRoleError) {
            SnackbarService.error(state.msg);
          }
          if (state is OtpValidationSuccess ||
              state is StaticOtpValidationSuccess) {
            Navigator.of(context).pushNamed(AppRoutes.home);
          }
        },
        builder: (context, state) {
          if (state is OtpRequestedSuccess ||
              state is OtpValidationFailure ||
              state is OtpValidationRoleError) {
            // Get the phone number from the state
            String phone = _currentPhone;
            if (state is OtpValidationFailure) {
              phone = state.phn;
            } else if (state is OtpValidationRoleError) {
              phone = state.phn;
            } else if (state is OtpRequestedSuccess) {
              phone = state.phn;
            }

            return OtpTextFieldForm(
              formController: otpController,
              hintText: "Enter Otp",
              buttonText: "Submit Otp",
              isLoading: state is OtpValidationLoading,
              onPressed: () {
                context.read<AuthBloc>().add(
                  OtpValidationRequested(
                    entity: AuthEntity(
                      otp: otpController.text,
                      phone: phone,
                      role: "vendor",
                    ),
                  ),
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
