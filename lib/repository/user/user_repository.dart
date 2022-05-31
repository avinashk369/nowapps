import 'package:mobilefirst/models/user/retailer_model.dart';
import 'package:mobilefirst/models/user/user_model.dart';

abstract class UserRepository {
  Future<UserModel> userLogin(String mobileNumber);
  Future<UserModel> verifyOtp(String mobile, String otp);
  Future<List<RetailerModel>> getRetailers();
}
