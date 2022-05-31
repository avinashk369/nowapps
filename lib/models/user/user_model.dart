import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class UserModel {
  String? mobile;
  String? otp;

  UserModel();
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
