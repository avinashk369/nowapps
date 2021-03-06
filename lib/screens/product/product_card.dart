import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobilefirst/models/product/product_model.dart';
import 'package:mobilefirst/styles/styles.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.productModel}) : super(key: key);
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  StatefulBuilder(builder: (context, setter) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
                          child: IconButton(
                            onPressed: () {
                              setter(() {
                                productModel.count > 0
                                    ? productModel.count--
                                    : 0;
                              });
                            },
                            icon: const Icon(Icons.remove_circle_outline),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            productModel.count.toString(),
                            style: kLabelStyleBold.copyWith(
                              fontSize: 22,
                            ),
                          ),
                        ),
                        Flexible(
                          child: IconButton(
                            onPressed: () {
                              setter(() {
                                productModel.count++;
                              });
                            },
                            icon: const Icon(Icons.add_circle_outline),
                          ),
                        ),
                      ],
                    );
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
