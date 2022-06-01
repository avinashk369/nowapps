import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product_model.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class ProductModel extends Equatable {
  @JsonKey(name: 'prodImage')
  String? prodImage;
  @JsonKey(name: 'prodId')
  String? prodId;
  @JsonKey(name: 'prodCode')
  String? prodCode;
  @JsonKey(name: 'prodName')
  String? prodName;
  @JsonKey(name: 'prodHsnId')
  String? prodHsnId;
  @JsonKey(name: 'prodHsnCode')
  String? prodHsnCode;
  @JsonKey(name: 'prodShortName')
  String? prodShortName;
  String? prodPrice;
  @JsonKey(name: 'prodMrp')
  String? prodMrp;
  @JsonKey(ignore: true)
  int count = 0;
  ProductModel({
    this.prodImage,
    this.prodId,
    this.prodCode,
    this.prodName,
    this.prodHsnId,
    this.prodHsnCode,
    this.prodShortName,
    this.prodPrice,
    this.prodMrp,
    this.count = 0,
  });
  ProductModel copyWith({
    String? prodImage,
    String? prodId,
    String? prodCode,
    String? prodName,
    String? prodHsnId,
    String? prodHsnCode,
    String? prodShortName,
    String? prodPrice,
    String? prodMrp,
    int count = 0,
  }) =>
      ProductModel(
        prodImage: prodImage ?? this.prodImage,
        prodId: prodId ?? this.prodId,
        prodCode: prodCode ?? this.prodCode,
        prodName: prodName ?? this.prodName,
        prodHsnId: prodHsnId ?? this.prodHsnId,
        prodHsnCode: prodHsnCode ?? this.prodHsnCode,
        prodShortName: prodShortName ?? this.prodShortName,
        prodPrice: prodPrice ?? this.prodPrice,
        prodMrp: prodMrp ?? this.prodMrp,
        count: count,
      );

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
