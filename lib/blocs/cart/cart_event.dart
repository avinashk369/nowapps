part of 'cart_bloc.dart';

@immutable
abstract class CartEvent extends Equatable {
  const CartEvent();
}

class LoadCart extends CartEvent {
  const LoadCart();
  @override
  List<Object> get props => [];
}

class CartCounter extends CartEvent {
  final int? count;
  const CartCounter({this.count});
  @override
  List<Object> get props => [];
}

class AddToCart extends CartEvent {
  final ProductModel productModel;
  const AddToCart(this.productModel);
  @override
  List<Object> get props => [productModel];
}

class RemoveFromCart extends CartEvent {
  final ProductModel productModel;
  const RemoveFromCart(this.productModel);
  @override
  List<Object> get props => [productModel];
}
