import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mobilefirst/models/product/product_model.dart';
import 'package:mobilefirst/repository/product/product_repositoryImpl.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ProductRepositoryImpl _productRepositoryImpl;

  CartBloc(this._productRepositoryImpl) : super(CartInitializing()) {
    on<LoadCart>((event, emit) => loadCart(event, emit));
  }

  Future loadCart(LoadCart event, Emitter<CartState> emit) async {
    // try {
    //   final List<RetailerModel> retailers =
    //       await _userRepositoryImpl.getRetailers();
    //   emit(RetailersLoaded(retailers: retailers));
    // } on ServerError catch (e) {
    //   emit(UserError(message: "No retailers found"));
    // }
  }
}
