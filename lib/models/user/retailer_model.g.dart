// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retailer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RetailerModel _$RetailerModelFromJson(Map<String, dynamic> json) =>
    RetailerModel()
      ..id = json['id'] as String?
      ..name = json['name'] as String?
      ..email = json['email'] as String?
      ..phone = json['phone'] as String?
      ..address = json['address'] as String?
      ..city = json['city'] as String?;

Map<String, dynamic> _$RetailerModelToJson(RetailerModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('email', instance.email);
  writeNotNull('phone', instance.phone);
  writeNotNull('address', instance.address);
  writeNotNull('city', instance.city);
  return val;
}
