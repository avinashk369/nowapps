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
