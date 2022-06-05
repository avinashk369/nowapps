import 'package:mobilefirst/apis/ApiClient.dart';
import 'package:mobilefirst/models/ServerError.dart';
import 'package:mobilefirst/models/user/retailer_model.dart';
import 'package:mobilefirst/models/user/user_model.dart';

import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final ApiClient apiClient;

  UserRepositoryImpl({required this.apiClient});

  @override
  Future<UserModel> userLogin(String mobileNumber) async {
    late UserModel userMasters;
    try {
      Map<String, dynamic> body = {"mobile": mobileNumber, "user_type": "user"};
      userMasters = UserModel.fromJson(body);
    } catch (error, stacktrace) {
      print(stacktrace);
      throw Exception("Something went wrong");
    }
    return userMasters;
  }

  @override
  Future<UserModel> verifyOtp(String mobile, String otp) async {
    UserModel userMasters = UserModel();
    try {
      Map<String, dynamic> body = {"otp": otp, "mobile": mobile};
      userMasters = UserModel.fromJson(body);
    } catch (error, stacktrace) {
      print(stacktrace.toString());
      throw ServerError.withError(error: error);
    }
    return userMasters;
  }

  @override
  Future<List<RetailerModel>> getRetailers() async {
    try {
      List<RetailerModel> retailers = [
        RetailerModel()
          ..id = "1"
          ..address = "New Delhi"
          ..city = "Mayur Bihar"
          ..email = "abc@abc.com"
          ..name = "Jumbo Store"
          ..phone = "95426986799",
        RetailerModel()
          ..id = "2"
          ..address = "New Delhi"
          ..city = "Saket"
          ..email = "xyz@xyz.com"
          ..name = "Reliance Store"
          ..phone = "1234567890",
        RetailerModel()
          ..id = "3"
          ..address = "New Delhi"
          ..city = "Malviya Nagar"
          ..email = "qwert@qw.com"
          ..name = "Indus Store"
          ..phone = "9638527410",
        RetailerModel()
          ..id = "4"
          ..address = "New Delhi"
          ..city = "Rohini"
          ..email = "rohini@gmail.com"
          ..name = "in & out"
          ..phone = "9856231470"
      ];
      return retailers;
    } catch (error, stacktrace) {
      throw Exception("Something went wrong");
    }
  }
}
