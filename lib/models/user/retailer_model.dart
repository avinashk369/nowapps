import 'package:json_annotation/json_annotation.dart';
part 'retailer_model.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class RetailerModel {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? address;
  String? city;
  RetailerModel();
  factory RetailerModel.fromJson(Map<String, dynamic> json) =>
      _$RetailerModelFromJson(json);
  Map<String, dynamic> toJson() => _$RetailerModelToJson(this);
}
