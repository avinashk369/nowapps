import 'package:mobilefirst/apis/ApiClient.dart';
import 'package:mobilefirst/db/db_helper.dart';
import 'package:mobilefirst/models/product/product_model.dart';
import 'package:mobilefirst/models/response_model.dart';
import 'package:mobilefirst/repository/product/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ApiClient apiClient;

  ProductRepositoryImpl({required this.apiClient});

  @override
  Future<ResponseModel> loadProducts() async {
    late ResponseModel response;
    try {
      response = await apiClient.getProducts();
    } catch (error) {
      throw Exception("Something went wrong");
    }
    return response;
  }

  @override
  Future syncDb(List<ProductModel> products) async {
    try {
      await DbHeler.instance.insertProducts(products);
    } catch (e) {
      throw Exception("Data not synced");
    }
  }
}
