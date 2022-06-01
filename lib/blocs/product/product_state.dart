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

  const ProductLoaded({
    required this.products,
  });

  @override
  List<Object> get props => [products];
}
