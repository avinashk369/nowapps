// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseModel _$ResponseModelFromJson(Map<String, dynamic> json) =>
    ResponseModel()
      ..status = json['status'] as bool?
      ..message = json['message'] as String?
      ..data = json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>);

Map<String, dynamic> _$ResponseModelToJson(ResponseModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', instance.status);
  writeNotNull('message', instance.message);
  writeNotNull('data', instance.data);
  return val;
}
