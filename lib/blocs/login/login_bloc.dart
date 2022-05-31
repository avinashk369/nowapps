import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
part 'login_state.dart';

class LoginBloc extends Cubit<LoginState> {
  LoginBloc() : super(LoginInitializing());

  Future<void> checkNumber(String mobileNumber) async {
    try {
      bool isValid = mobileNumber.length > 9;
      emit(ValidNumber(isValid: isValid, number: mobileNumber));
    } catch (_) {}
  }

  Future<void> checkOtp(String otp) async {
    try {
      bool isValid = otp.length > 5;
      emit(ValidOtp(isValid: isValid, otp: otp));
    } catch (_) {}
  }
}
