part of 'cart_bloc.dart';

@immutable
abstract class CartState extends Equatable {
  const CartState();
}

class CartInitializing extends CartState {
  @override
  List<Object> get props => [];
}

class CartError extends CartState {
  String message;
  CartError({required this.message});
  @override
  // TODO: implement props
  List<Object> get props => [message];
}

class CartLoaded extends CartState {
  final List<ProductModel> products;

  const CartLoaded({required this.products});

  @override
  // TODO: implement props
  List<Object> get props => [products];
}

class CartCountUpdated extends CartState {
  final int count;
  const CartCountUpdated({required this.count});

  @override
  List<Object?> get props => [];
}
