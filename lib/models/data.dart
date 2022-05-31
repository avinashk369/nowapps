import 'package:json_annotation/json_annotation.dart';
import 'package:mobilefirst/models/product/product_model.dart';
part 'data.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class Data {
  List<ProductModel>? products;
  Data();
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}
