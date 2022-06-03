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

class RemoveProduct extends ProductEvent {
  final ProductModel productModel;
  const RemoveProduct(this.productModel);
  @override
  List<Object> get props => [productModel];
}

class AddProduct extends ProductEvent {
  final ProductModel productModel;
  const AddProduct(this.productModel);
  @override
  List<Object> get props => [productModel];
}

class DeleteProduct extends ProductEvent {
  final ProductModel productModel;
  const DeleteProduct(this.productModel);
  @override
  List<Object> get props => [productModel];
}
