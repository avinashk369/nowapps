import 'package:mobilefirst/models/product/product_model.dart';
import 'package:mobilefirst/models/response_model.dart';

abstract class ProductRepository {
  Future<ResponseModel> loadProducts();
  Future syncDb(List<ProductModel> products);
}
