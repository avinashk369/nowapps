import 'package:dio/dio.dart';
import 'package:mobilefirst/models/product/product_model.dart';
import 'package:mobilefirst/models/response_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:mobilefirst/utils/utils.dart';
part 'ApiClient.g.dart';

@RestApi(baseUrl: apiUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("YIDG")
  Future<ResponseModel> getProducts();
}
