import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                              deleteFromCart: (product) {
                                productBloc.add(DeleteProduct(product));
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
      bottomNavigationBar: BlocBuilder<ProductBloc, ProductState>(
          bloc: productBloc,
          builder: (context, state) {
            return BottomAppBar(
              color: (state is ProductLoaded)
                  ? state.addedProducts!.isEmpty
                      ? Colors.grey[400]
                      : primaryLight
                  : Colors.grey[400],
              child: SizedBox(
                height: kToolbarHeight,
                child: InkWell(
                  onTap: (state is ProductLoaded)
                      ? state.addedProducts!.isEmpty
                          ? null
                          : () {
                              Navigator.of(context).pushNamed(thankYouRoute);
                              PreferenceUtils.putString(seletedRetailer, "");
                            }
                      : null,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Check Out".toUpperCase(),
                        textAlign: TextAlign.center,
                        style: kLabelStyleBold.copyWith(
                            color: products.isEmpty
                                ? Colors.grey[100]
                                : secondaryLight,
                            fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
