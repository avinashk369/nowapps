// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      prodImage: json['prodImage'] as String?,
      prodId: json['prodId'] as String?,
      prodCode: json['prodCode'] as String?,
      prodName: json['prodName'] as String?,
      prodHsnId: json['prodHsnId'] as String?,
      prodHsnCode: json['prodHsnCode'] as String?,
      prodShortName: json['prodShortName'] as String?,
      prodPrice: json['prod_price'] as String?,
      prodMrp: json['prodMrp'] as String?,
      count: json['count'] as int? ?? 0,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('prodImage', instance.prodImage);
  writeNotNull('prodId', instance.prodId);
  writeNotNull('prodCode', instance.prodCode);
  writeNotNull('prodName', instance.prodName);
  writeNotNull('prodHsnId', instance.prodHsnId);
  writeNotNull('prodHsnCode', instance.prodHsnCode);
  writeNotNull('prodShortName', instance.prodShortName);
  writeNotNull('prod_price', instance.prodPrice);
  writeNotNull('prodMrp', instance.prodMrp);
  val['count'] = instance.count;
  return val;
}
