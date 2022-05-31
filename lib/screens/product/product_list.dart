import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilefirst/blocs/product/product_bloc.dart';
import 'package:mobilefirst/repository/product/product_repositoryImpl.dart';
import 'package:mobilefirst/routes/route_constants.dart';
import 'package:mobilefirst/widgets/custom_appbar.dart';

import 'product_card.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(context.read<ProductRepositoryImpl>())
        ..add(const LoadPrdoucts()),
      child: Scaffold(
        appBar: const CustomAppBar(
          title: "Products",
        ),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: ((context, state) {
            if (state is ProductLoaded) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return ProductCard(
                    productModel: state.products[index],
                    onTap: (product) {},
                  );
                },
                itemCount: state.products.length,
              );
            }
            return const SizedBox.shrink();
          }),
        ),
      ),
    );
  }
}
