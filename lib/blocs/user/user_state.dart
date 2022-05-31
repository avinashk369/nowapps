part of 'user_bloc.dart';

@immutable
abstract class UserState extends Equatable {
  const UserState();
}

class UserInitializing extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoading extends UserState {
  @override
  List<Object> get props => [];
}

class UserError extends UserState {
  String message;
  UserError({required this.message});
  @override
  // TODO: implement props
  List<Object> get props => [message];
}

class UserLoaded extends UserState {
  @override
  // TODO: implement props
  final UserModel userModel;

  const UserLoaded({required this.userModel});

  @override
  // TODO: implement props
  List<Object> get props => [userModel];
}

class OtpVerified extends UserState {
  final UserModel userModel;

  const OtpVerified({required this.userModel});

  @override
  // TODO: implement props
  List<Object> get props => [userModel];
}

class RetailersLoaded extends UserState {
  final List<RetailerModel> retailers;

  const RetailersLoaded({required this.retailers});

  @override
  // TODO: implement props
  List<Object?> get props => [retailers];
}
