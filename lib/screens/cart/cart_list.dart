import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilefirst/repository/product/product_repositoryImpl.dart';
import 'package:mobilefirst/styles/styles.dart';
import 'package:mobilefirst/utils/theme_constants.dart';
import 'package:mobilefirst/widgets/custom_appbar.dart';

import '../../blocs/product/productbloc.dart';
import 'cart_card.dart';

class CartList extends StatelessWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(context.read<ProductRepositoryImpl>())
        ..add(const LoadPrdoucts()),
      child: Scaffold(
        appBar: const CustomAppBar(
          title: "Cart",
        ),
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  BlocBuilder<ProductBloc, ProductState>(
                    builder: ((context, state) {
                      if (state is ProductLoaded) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return CartCard(
                              productModel: state.products[index],
                            );
                          },
                          itemCount: state.products.length,
                        );
                      }
                      return const SizedBox.shrink();
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: primaryLight,
          child: SizedBox(
            height: kToolbarHeight,
            child: InkWell(
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Check Out".toUpperCase(),
                    textAlign: TextAlign.center,
                    style: kLabelStyleBold.copyWith(
                        color: secondaryLight, fontSize: 18),
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
