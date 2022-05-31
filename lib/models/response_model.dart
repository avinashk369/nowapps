import 'package:json_annotation/json_annotation.dart';

import 'data.dart';
part 'response_model.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class ResponseModel {
  bool? status;
  String? message;
  Data? data;
  ResponseModel();
  factory ResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseModelToJson(this);
}
