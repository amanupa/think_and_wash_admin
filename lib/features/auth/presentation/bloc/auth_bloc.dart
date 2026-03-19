import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:think_and_wash_admin/features/auth/data/auth_model.dart';
import 'package:think_and_wash_admin/features/auth/domain/auth_entity.dart';
import 'package:think_and_wash_admin/features/auth/domain/get_otp_usecase.dart';
import 'package:think_and_wash_admin/features/auth/domain/submit_otp_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GetOtpUsecase getOtpUsecase;
  final SubmitOtpUsecase submitOtpUsecase;

  AuthBloc({required this.getOtpUsecase, required this.submitOtpUsecase})
    : super(AuthInitial()) {
    on<OtpRequested>(_otpRequested);
    on<OtpValidationRequested>(_otpValidation);
    on<UpdateUser>(_updateUser);
  }

  FutureOr<void> _otpRequested(
    OtpRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(OtpRequestedLoading());
    try {
      if (event.phn == "9999999999") {
        emit(OtpRequestedSuccess(otp: "1234", phn: event.phn));
      } else {
        debugPrint("this is the phn for otp request: ${event.phn}");
        final result = await getOtpUsecase(event.phn);
        result.fold(
          (failure) {
            emit(OtpRequestedFailure(msg: failure.message ?? "otp failure"));
          },
          (success) {
            emit(OtpRequestedSuccess(otp: success, phn: event.phn));
          },
        );
      }
    } catch (err) {
      emit(OtpRequestedFailure(msg: "server error"));
    }
  }

  FutureOr<void> _otpValidation(
    OtpValidationRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(OtpValidationLoading());
    if (event.entity.otp == "1234" && event.entity.phone == "9999999999") {
      emit(StaticOtpValidationSuccess(userId: "Demo"));
    } else {
      debugPrint(
        "this is the entity body for otp validation: ${event.entity.otp}, ${event.entity.phone},${event.entity.role} ",
      );
      final result = await submitOtpUsecase(event.entity);

      result.fold(
        (failure) {
          emit(
            OtpValidationFailure(
              msg: failure.message ?? "validation failed...",
              phn: event.entity.phone,
            ),
          );
        },
        (success) {
          // Check if the user role is vendor
          if (success.user?.role != "vendor") {
            emit(OtpValidationRoleError(
              msg: "User role not valid",
              phn: event.entity.phone,
            ));
          } else {
            emit(
              OtpValidationSuccess(
                userMOdel: success.user!,
                token: success.token!,
              ),
            );
          }
        },
      );
    }
  }

  FutureOr<void> _updateUser(UpdateUser event, Emitter<AuthState> emit) {
    final currentState = state;

    if (currentState is OtpValidationSuccess) {
      emit(
        OtpValidationSuccess(userMOdel: event.user, token: currentState.token),
      );
    }
  }
}
