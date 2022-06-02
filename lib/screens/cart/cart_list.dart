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
  const CartList({Key? key, required this.products}) : super(key: key);
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ProductBloc(context.read<ProductRepositoryImpl>()),
        ),
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
        ),
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return CartCard(
                        productModel: products[index],
                        addToCart: (product) {
                          context.read<ProductBloc>().add(AddProduct(product));
                        },
                        removeFromCart: (product) {
                          context
                              .read<ProductBloc>()
                              .add(RemoveProduct(product));
                        },
                      );
                    },
                    itemCount: products.length,
                  ),
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
                        color: products.isEmpty
                            ? Colors.grey[100]
                            : secondaryLight,
                        fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
