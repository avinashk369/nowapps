import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilefirst/blocs/product/productbloc.dart';
import 'package:mobilefirst/models/product/product_model.dart';
import 'package:mobilefirst/styles/styles.dart';
import 'package:mobilefirst/utils/theme_constants.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(
      {Key? key,
      required this.productModel,
      required this.addToCart,
      required this.removeFromCart,
      required this.index})
      : super(key: key);
  final ProductModel productModel;
  final int index;
  final Function(ProductModel product) addToCart;
  final Function(ProductModel product) removeFromCart;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.grey[50],
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .24,
            width: double.infinity,
            child: Card(
              elevation: 0,
              margin: EdgeInsets.zero,
              semanticContainer: true,
              color: secondaryLight,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
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
            height: 5,
          ),
          Flexible(
              child: Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModel.prodName!,
                  style: kLabelStyleBold,
                ),
                Text(productModel.prodCode!),
                Text(productModel.prodMrp!),
              ],
            ),
          )),
          BlocBuilder<ProductBloc, ProductState>(
            builder: ((context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    child: IconButton(
                      onPressed: () {
                        removeFromCart(productModel.copyWith(
                            count: productModel.count > 1
                                ? productModel.count - 1
                                : 0));
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
                      onPressed: () => addToCart(
                          productModel.copyWith(count: productModel.count + 1)),
                      icon: const Icon(Icons.add_circle_outline),
                    ),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
