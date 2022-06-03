import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobilefirst/db/db_helper.dart';
import 'package:mobilefirst/models/ServerError.dart';
import 'package:mobilefirst/models/product/product_model.dart';
import 'package:mobilefirst/models/response_model.dart';
import 'package:mobilefirst/repository/product/product_repositoryImpl.dart';
import 'package:mobilefirst/utils/utils.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepositoryImpl _productRepositoryImpl;

  ProductBloc(this._productRepositoryImpl) : super(ProductInitializing()) {
    on<LoadPrdoucts>((event, emit) => _loadProducts(event, emit));
    on<RemoveProduct>((event, emit) => _removeProduct(event, emit));
    on<AddProduct>((event, emit) => _addProduct(event, emit));
    on<DeleteProduct>((event, emit) => _deleteFromCart(event, emit));
  }
  Future _addProduct(AddProduct event, Emitter<ProductState> emit) async {
    try {
      final state = this.state;
      if (state is ProductLoaded) {
        List<ProductModel> addedProduct = state.addedProducts ?? [];
        List<ProductModel> cartProducts = addedProduct
            .where((element) => element.prodId != event.productModel.prodId)
            .toList();
        cartProducts.add(event.productModel);
        List<ProductModel> products = state.products
            .map((e) =>
                e.prodId == event.productModel.prodId ? event.productModel : e)
            .toList();
        emit(state.copyWith(products: products, addedProducts: cartProducts));
      }
    } catch (e, stac) {
      print("stack trace ${stac.toString()}");
      emit(ProductError(message: "Something went wrong"));
    }
  }

  Future _removeProduct(RemoveProduct event, Emitter<ProductState> emit) async {
    try {
      final state = this.state;
      if (state is ProductLoaded) {
        List<ProductModel> products = state.products
            .map((e) =>
                e.prodId == event.productModel.prodId ? event.productModel : e)
            .toList();
        List<ProductModel> cartProducts = state.addedProducts!
            .map((e) =>
                e.prodId == event.productModel.prodId ? event.productModel : e)
            .toList();
        emit(state.copyWith(products: products, addedProducts: cartProducts));
      }
    } catch (e) {
      emit(ProductError(message: "Something went wrong"));
    }
  }

  Future _deleteFromCart(
      DeleteProduct event, Emitter<ProductState> emit) async {
    try {
      final state = this.state;
      if (state is ProductLoaded) {
        List<ProductModel> cartProducts = state.addedProducts!
            .where((element) => element.prodId != event.productModel.prodId)
            .toList();

        emit(state.copyWith(
            products: state.products, addedProducts: cartProducts));
      }
    } catch (e) {
      emit(ProductError(message: "Something went wrong"));
    }
  }

  Future _loadProducts(LoadPrdoucts event, Emitter<ProductState> emit) async {
    try {
      bool dbStats = PreferenceUtils.getBool(dbSync);
      if (dbStats) {
        List<ProductModel> products = await DbHeler.instance.getProducts();

        emit(ProductLoaded(products: products, addedProducts: []));
      } else {
        ResponseModel responseModel =
            await _productRepositoryImpl.loadProducts();
        await DbHeler.instance.insertProducts(responseModel.data!.products!);
        PreferenceUtils.putBool(dbSync, true);
        emit(ProductLoaded(
            products: responseModel.data!.products!, addedProducts: []));
      }
    } on ServerError catch (e) {
      emit(ProductError(message: e.getErrorMessage()));
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }
}
