import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilefirst/blocs/cart/cartbloc.dart';
import 'package:mobilefirst/blocs/index_toggled.dart';
import 'package:mobilefirst/blocs/product/product_bloc.dart';
import 'package:mobilefirst/blocs/toggle_index_bloc.dart';
import 'package:mobilefirst/models/product/product_model.dart';
import 'package:mobilefirst/repository/product/product_repositoryImpl.dart';
import 'package:mobilefirst/routes/route_constants.dart';
import 'package:mobilefirst/screens/product/product_item.dart';
import 'package:mobilefirst/styles/styles.dart';
import 'package:mobilefirst/utils/theme_constants.dart';
import 'package:mobilefirst/utils/utils.dart';
import 'package:mobilefirst/widgets/custom_appbar.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (context) =>
              ProductBloc(context.read<ProductRepositoryImpl>())
                ..add(
                  const LoadPrdoucts(),
                ),
        ),
        BlocProvider(
            create: (context) =>
                CartBloc(context.read<ProductRepositoryImpl>())),
        BlocProvider(
            create: (context) => ToggleIndexBloc(
                  const IndexToggled(index: -1, isSelected: false),
                ))
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Products"),
          actions: [
            BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
              if (state is ProductLoaded) {
                PreferenceUtils.putBool(
                    hasProduct, state.addedProducts!.isNotEmpty);
              }
              return Badge(
                position: BadgePosition.topEnd(top: 0, end: 5),
                animationDuration: const Duration(milliseconds: 300),
                animationType: BadgeAnimationType.slide,
                badgeContent: Text(
                  (state is ProductLoaded)
                      ? state.addedProducts!.length.toString()
                      : "0",
                  style: kLabelStyle.copyWith(color: secondaryLight),
                ),
                child: IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: (state is ProductLoaded)
                      ? state.addedProducts!.isEmpty
                          ? () {}
                          : () {
                              Navigator.of(context).pushNamed(cartRoute,
                                  arguments: context.read<ProductBloc>());
                            }
                      : () {},
                ),
              );
            }),
          ],
        ),
        body: CustomScrollView(
          slivers: [
            BlocBuilder<ProductBloc, ProductState>(
              builder: ((context, state) {
                if (state is ProductLoaded) {
                  return SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return ProductItem(
                          index: index,
                          productModel: state.products[index],
                          addToCart: (product) {
                            context.read<ProductBloc>().add(AddProduct(
                                productModel: product, isCart: false));
                          },
                          removeFromCart: (product) {
                            context
                                .read<ProductBloc>()
                                .add(RemoveProduct(product));
                          },
                        );
                      },
                      childCount: state.products.length,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 1,
                      crossAxisSpacing: 1,
                      childAspectRatio: .6,
                    ),
                  );
                }
                return const SliverToBoxAdapter(child: SizedBox.shrink());
              }),
            ),
          ],
        ),
      ),
    );
  }
}
