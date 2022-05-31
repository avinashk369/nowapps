// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel()
  ..prodImage = json['prodImage'] as String?
  ..prodId = json['prodId'] as String?
  ..prodCode = json['prodCode'] as String?
  ..barCode = json['bar_code'] as String?
  ..prodName = json['prodName'] as String?
  ..uOM = json['u_o_m'] as String?
  ..unitId = json['unit_id'] as String?
  ..prodCombo = json['prod_combo'] as String?
  ..isFocused = json['is_focused'] as String?
  ..groupIds = json['group_ids'] as String?
  ..categoryIds = json['category_ids'] as String?
  ..unitFromValue = json['unit_from_value'] as String?
  ..unitToValue = json['unit_to_value'] as String?
  ..uomAlternateName = json['uom_alternate_name'] as String?
  ..uomAlternateId = json['uom_alternate_id'] as String?
  ..underWarranty = json['under_warranty'] as String?
  ..groupId = json['group_id'] as String?
  ..catId = json['cat_id'] as String?
  ..prodHsnId = json['prodHsnId'] as String?
  ..prodHsnCode = json['prodHsnCode'] as String?
  ..prodShortName = json['prodShortName'] as String?
  ..prodPrice = json['prod_price'] as String?
  ..prodMrp = json['prodMrp'] as String?
  ..prodBuy = json['prod_buy'] as String?
  ..prodSell = json['prod_sell'] as String?
  ..prodFreeItem = json['prod_free_item'] as String?
  ..prodRkPrice = json['prod_rk_price'] as String?;

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
  writeNotNull('bar_code', instance.barCode);
  writeNotNull('prodName', instance.prodName);
  writeNotNull('u_o_m', instance.uOM);
  writeNotNull('unit_id', instance.unitId);
  writeNotNull('prod_combo', instance.prodCombo);
  writeNotNull('is_focused', instance.isFocused);
  writeNotNull('group_ids', instance.groupIds);
  writeNotNull('category_ids', instance.categoryIds);
  writeNotNull('unit_from_value', instance.unitFromValue);
  writeNotNull('unit_to_value', instance.unitToValue);
  writeNotNull('uom_alternate_name', instance.uomAlternateName);
  writeNotNull('uom_alternate_id', instance.uomAlternateId);
  writeNotNull('under_warranty', instance.underWarranty);
  writeNotNull('group_id', instance.groupId);
  writeNotNull('cat_id', instance.catId);
  writeNotNull('prodHsnId', instance.prodHsnId);
  writeNotNull('prodHsnCode', instance.prodHsnCode);
  writeNotNull('prodShortName', instance.prodShortName);
  writeNotNull('prod_price', instance.prodPrice);
  writeNotNull('prodMrp', instance.prodMrp);
  writeNotNull('prod_buy', instance.prodBuy);
  writeNotNull('prod_sell', instance.prodSell);
  writeNotNull('prod_free_item', instance.prodFreeItem);
  writeNotNull('prod_rk_price', instance.prodRkPrice);
  return val;
}
