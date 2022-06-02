// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_bloc.dart';

@immutable
abstract class ProductState extends Equatable {
  const ProductState();
}

class ProductInitializing extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductLoading extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductError extends ProductState {
  String message;
  ProductError({required this.message});
  @override
  List<Object> get props => [message];
}

class ProductLoaded extends ProductState {
  final List<ProductModel> products;
  final List<ProductModel>? addedProducts;

  const ProductLoaded({
    required this.products,
    this.addedProducts,
  });

  ProductLoaded copyWith({
    List<ProductModel>? products,
    List<ProductModel>? addedProducts,
  }) {
    return ProductLoaded(
      products: products ?? this.products,
      addedProducts: addedProducts ?? this.addedProducts,
    );
  }

  @override
  List<Object> get props => [products, addedProducts!];
}
