import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobilefirst/models/product/product_model.dart';
import 'package:mobilefirst/styles/styles.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.productModel,
    required this.onTap,
  }) : super(key: key);
  final ProductModel productModel;
  final Function(ProductModel productModel) onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(productModel),
      child: Card(
        color: Colors.grey[50],
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 70,
                width: 70,
                child: Card(
                  elevation: 0,
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: productModel.prodImage ??
                        ' https://picsum.photos/250?image=9 ',
                    errorWidget: (context, url, error) =>
                        Image.asset('assets/images/logo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      productModel.prodName!,
                      style: kLabelStyleBold,
                    ),
                    Text(productModel.prodCode!),
                    Text(productModel.prodMrp!),
                  ],
                ),
              ),
              const SizedBox(
                width: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
