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
  }
  int page = 1;
  //load news
  Future _loadProducts(LoadPrdoucts event, Emitter<ProductState> emit) async {
    try {
      bool dbStats = PreferenceUtils.getBool(dbSync);
      if (dbStats) {
        List<ProductModel> products = await DbHeler.instance.getProducts();
        print("product from local db ${products.length}");
        emit(ProductLoaded(products: products));
      } else {
        ResponseModel responseModel =
            await _productRepositoryImpl.loadProducts();
        await DbHeler.instance.insertProducts(responseModel.data!.products!);
        PreferenceUtils.putBool(dbSync, true);
        emit(ProductLoaded(products: responseModel.data!.products!));
      }
    } on ServerError catch (e) {
      emit(ProductError(message: e.getErrorMessage()));
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }
}
