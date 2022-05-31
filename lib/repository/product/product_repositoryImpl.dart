import 'package:dio/dio.dart';
import 'package:mobilefirst/apis/ApiClient.dart';
import 'package:mobilefirst/db/db_helper.dart';
import 'package:mobilefirst/models/product/product_model.dart';
import 'package:mobilefirst/models/response_model.dart';
import 'package:mobilefirst/repository/product/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  late Dio dio;
  late ApiClient apiClient;
  ProductRepositoryImpl() {
    dio = Dio();
    //dio.options.headers["Content-Type"] = "application/json";
    //dio.interceptors.add(PrettyDioLogger());
    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      request: true,
      requestBody: true,
    ));
    apiClient = ApiClient(dio);
  }

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
