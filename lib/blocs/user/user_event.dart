part of 'user_bloc.dart';

@immutable
abstract class UserEvent extends Equatable {
  const UserEvent();
}

class UserLoginEvent extends UserEvent {
  final String mobileNumber;
  const UserLoginEvent({required this.mobileNumber});
  @override
  List<Object> get props => [];
}

class VerifyOtp extends UserEvent {
  final String otp;
  final String mobile;
  const VerifyOtp({
    required this.otp,
    required this.mobile,
  });
  @override
  List<Object> get props => [];
}

class LoadRetailers extends UserEvent {
  const LoadRetailers();
  @override
  List<Object> get props => [];
}

class SelectRetailer extends UserEvent {
  final String retailerName;
  const SelectRetailer({required this.retailerName});
  @override
  List<Object> get props => [];
}
