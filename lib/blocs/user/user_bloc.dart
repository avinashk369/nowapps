import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mobilefirst/models/ServerError.dart';
import 'package:mobilefirst/models/user/retailer_model.dart';
import 'package:mobilefirst/models/user/user_model.dart';
import 'package:mobilefirst/repository/user/user_repositoryimpl.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepositoryImpl _userRepositoryImpl;

  //UserBloc() : super(UserInitializing());

  UserBloc(this._userRepositoryImpl) : super(UserInitializing()) {
    on<UserLoginEvent>((event, emit) => _mapUserLoginEvent(event, emit));
    on<VerifyOtp>((event, emit) => verifyOtpEvent(event, emit));
    on<LoadRetailers>((event, emit) => loadRetailersEvent(event, emit));
    on<SelectRetailer>((event, emit) => selectRetailerEvent(event, emit));
  }
  Future selectRetailerEvent(
      SelectRetailer event, Emitter<UserState> emit) async {
    emit(RetailerSelected(retailerName: event.retailerName));
  }

  Future loadRetailersEvent(
      LoadRetailers event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      final List<RetailerModel> retailers =
          await _userRepositoryImpl.getRetailers();
      emit(RetailersLoaded(retailers: retailers));
    } on ServerError catch (e) {
      emit(UserError(message: "No retailers found"));
    }
  }

  /// user login event handeling
  Future<void> _mapUserLoginEvent(
      UserLoginEvent event, Emitter<UserState> emit) async {
    UserModel? userModel;
    emit(UserLoading());

    try {
      if (event.mobileNumber == "1234567890") {
        emit(UserError(message: "Invalid user"));
        return;
      }
      userModel = await _userRepositoryImpl.userLogin(event.mobileNumber);
      emit(UserLoaded(userModel: userModel));
    } catch (e) {
      print("app error ${e.toString()}");
      emit(UserError(message: e.toString()));
    }
  }

  /// user otp verification event handeling
  Future<void> verifyOtpEvent(VerifyOtp event, Emitter<UserState> emit) async {
    UserModel? userModel;
    emit(UserLoading());

    try {
      if (event.otp != "123456") {
        emit(UserError(message: "Invalid otp"));
        return;
      }
      userModel = await _userRepositoryImpl.verifyOtp(event.mobile, event.otp);
      emit(OtpVerified(userModel: userModel));
    } catch (e) {
      emit(UserError(message: e.toString()));
    }
  }
}
