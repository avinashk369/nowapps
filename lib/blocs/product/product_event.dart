part of 'product_bloc.dart';

@immutable
abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class LoadPrdoucts extends ProductEvent {
  const LoadPrdoucts();
  @override
  List<Object> get props => [];
}
