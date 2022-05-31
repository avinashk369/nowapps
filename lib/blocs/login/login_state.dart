part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitializing extends LoginState {
  @override
  List<Object> get props => [];
}

class ValidNumber extends LoginState {
  final bool isValid;
  final String number;
  const ValidNumber({
    required this.isValid,
    required this.number,
  });

  @override
  // TODO: implement props
  List<Object> get props => [isValid, number];
}

class ValidOtp extends LoginState {
  final bool isValid;
  final String otp;

  const ValidOtp({required this.isValid, required this.otp});
  @override
  // TODO: implement props
  List<Object?> get props => [isValid, otp];
}
