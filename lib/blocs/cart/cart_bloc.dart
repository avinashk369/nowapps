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
    on<AddToCart>((event, emit) => _addToCart(event, emit));
    on<RemoveFromCart>((event, emit) => _removeFromCart(event, emit));
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

  Future _removeFromCart(RemoveFromCart event, Emitter<CartState> emit) async {
    try {
      final state = this.state;
      if (state is CartCountUpdated) {
        List<ProductModel> products = state.products
            .where((pro) => pro.prodId != event.productModel.prodId)
            .toList();
        emit(CartCountUpdated(products: products));
      }
    } catch (e, stack) {
      print("somethign wrong ${stack.toString()}");
    }
  }

  Future _addToCart(AddToCart event, Emitter<CartState> emit) async {
    try {
      final state = this.state;
      if (state is CartCountUpdated) {
        emit(CartCountUpdated(
            products: [...state.products, event.productModel]));
      } else {
        emit(CartCountUpdated(products: [event.productModel]));
      }
    } catch (e, stack) {
      print("somethign wrong ${stack.toString()}");
    }
  }
}
