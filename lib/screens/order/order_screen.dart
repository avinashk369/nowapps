import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilefirst/blocs/product/productbloc.dart';
import 'package:mobilefirst/repository/product/product_repositoryImpl.dart';
import 'package:mobilefirst/routes/route_constants.dart';
import 'package:mobilefirst/styles/styles.dart';
import 'package:mobilefirst/utils/theme_constants.dart';
import 'package:mobilefirst/utils/utils.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

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
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text(" Order "),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(products);
                },
                child: const Text(
                  "Take Order",
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // check if user has selected any product or not
                  if (PreferenceUtils.getBool(hasProduct)) {
                    Navigator.of(context).pushNamed(products);
                  } else {
                    final snackbar = SnackBar(
                      content: Text(
                        "Please select product first",
                        style: kLabelStyle.copyWith(color: secondaryLight),
                      ),
                      action: SnackBarAction(
                        label: "OK",
                        onPressed: () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        },
                      ),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  }
                },
                child: const Text(
                  "Check out",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
