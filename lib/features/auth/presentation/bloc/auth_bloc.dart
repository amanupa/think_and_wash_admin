import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<OtpRequested>(_otpRequested);
    on<OtpValidationRequested>(_otpValidation);
  }

  FutureOr<void> _otpRequested(OtpRequested event, Emitter<AuthState> emit) {
    emit(OtpRequestedLoading());
    emit(OtpRequestedSuccess(otp: "1234"));
  }

  FutureOr<void> _otpValidation(
    OtpValidationRequested event,
    Emitter<AuthState> emit,
  ) {
    emit(OtpValidationLoading());
    if (event.otp == "1234") {
      emit(OtpValidationSuccess(usrId: "Demo"));
    } else {
      emit(OtpValidationFailure());
    }
  }
}
