import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilefirst/blocs/cart/counter_bloc.dart';
import 'package:mobilefirst/models/product/product_model.dart';
import 'package:mobilefirst/repository/product/product_repositoryImpl.dart';
import 'package:mobilefirst/routes/route_constants.dart';
import 'package:mobilefirst/styles/styles.dart';
import 'package:mobilefirst/utils/theme_constants.dart';
import 'package:mobilefirst/utils/utils.dart';

import '../../blocs/product/productbloc.dart';
import 'cart_card.dart';

class CartList extends StatelessWidget {
  const CartList({Key? key, required this.productBloc}) : super(key: key);
  final ProductBloc productBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                BlocBuilder<ProductBloc, ProductState>(
                    bloc: productBloc,
                    builder: (context, state) {
                      if (state is ProductLoaded) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return CartCard(
                              productBloc: productBloc,
                              productModel: state.addedProducts![index],
                              addToCart: (product) {
                                productBloc.add(AddProduct(product));
                              },
                              removeFromCart: (product) {
                                productBloc.add(RemoveProduct(product));
                              },
                            );
                          },
                          itemCount: state.addedProducts!.length,
                        );
                      }
                      return const SizedBox.shrink();
                    }),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: products.isEmpty ? Colors.grey[400] : primaryLight,
        child: SizedBox(
          height: kToolbarHeight,
          child: InkWell(
            onTap: products.isEmpty
                ? null
                : () {
                    Navigator.of(context).pushNamed(thankYouRoute);
                    PreferenceUtils.putString(seletedRetailer, "");
                  },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Check Out".toUpperCase(),
                  textAlign: TextAlign.center,
                  style: kLabelStyleBold.copyWith(
                      color:
                          products.isEmpty ? Colors.grey[100] : secondaryLight,
                      fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
