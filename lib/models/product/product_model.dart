import 'package:json_annotation/json_annotation.dart';
part 'product_model.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class ProductModel {
  @JsonKey(name: 'prodImage')
  String? prodImage;
  @JsonKey(name: 'prodId')
  String? prodId;
  @JsonKey(name: 'prodCode')
  String? prodCode;
  String? barCode;
  @JsonKey(name: 'prodName')
  String? prodName;
  String? uOM;
  String? unitId;
  String? prodCombo;
  String? isFocused;
  String? groupIds;
  String? categoryIds;
  String? unitFromValue;
  String? unitToValue;
  String? uomAlternateName;
  String? uomAlternateId;
  String? underWarranty;
  String? groupId;
  String? catId;
  @JsonKey(name: 'prodHsnId')
  String? prodHsnId;
  @JsonKey(name: 'prodHsnCode')
  String? prodHsnCode;
  @JsonKey(name: 'prodShortName')
  String? prodShortName;
  String? prodPrice;
  @JsonKey(name: 'prodMrp')
  String? prodMrp;
  String? prodBuy;
  String? prodSell;
  String? prodFreeItem;
  String? prodRkPrice;
  ProductModel();
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
