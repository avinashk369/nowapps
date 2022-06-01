// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilefirst/blocs/index_toggled.dart';
import 'package:mobilefirst/blocs/product/product_bloc.dart';
import 'package:mobilefirst/blocs/toggle_index_bloc.dart';
import 'package:mobilefirst/blocs/user/user_bloc.dart';
import 'package:mobilefirst/repository/product/product_repositoryImpl.dart';
import 'package:mobilefirst/repository/user/user_repositoryimpl.dart';
import 'package:mobilefirst/routes/route_constants.dart';
import 'package:mobilefirst/screens/retailers/retailer_list.dart';
import 'package:mobilefirst/styles/styles.dart';
import 'package:mobilefirst/utils/preference_utils.dart';
import 'package:mobilefirst/utils/theme_constants.dart';
import 'package:mobilefirst/utils/utils.dart';
import 'package:mobilefirst/widgets/custom_appbar.dart';
import 'package:mobilefirst/widgets/loading_ui.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String retailerId;

  @override
  void initState() {
    retailerId = PreferenceUtils.getString(seletedRetailer);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (context) =>
              ProductBloc(context.read<ProductRepositoryImpl>())
                ..add(const LoadPrdoucts()),
        ),
        BlocProvider<UserBloc>(
            create: (context) => UserBloc(context.read<UserRepositoryImpl>())
              ..add(const LoadRetailers())),
        BlocProvider<ToggleIndexBloc>(
          create: (context) => ToggleIndexBloc(
            const IndexToggled(index: -1, isSelected: false),
          ),
        ),
      ],
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Home',
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () async {
                await PreferenceUtils.clear();
                Navigator.of(context).pushNamedAndRemoveUntil(
                    homeRoute, (Route<dynamic> route) => false);
              },
            ),
          ],
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is RetailersLoaded) {
              return RetailerList(
                retailers: state.retailers,
                onTap: (retailer) {
                  retailerId = retailer.id!;
                },
              );
            }
            if (state is UserInitializing) {
              return const LoadingUI();
            }
            if (state is UserError) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  state.message,
                  style: kLabelStyleBold.copyWith(color: redColor),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
        bottomNavigationBar: Builder(builder: (context) {
          final state = context.watch<ToggleIndexBloc>().state;
          print("state ${state.isSelected}");
          return BottomAppBar(
            color: state.isSelected ||
                    PreferenceUtils.getString(seletedRetailer).isNotEmpty
                ? primaryLight
                : Colors.grey[400],
            child: SizedBox(
              height: kToolbarHeight,
              child: InkWell(
                onTap: state.isSelected ||
                        PreferenceUtils.getString(seletedRetailer).isNotEmpty
                    ? () {
                        PreferenceUtils.putString(seletedRetailer, retailerId);

                        Navigator.of(context).pushNamed(
                          products,
                        );
                      }
                    : null,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Check In".toUpperCase(),
                      textAlign: TextAlign.center,
                      style: kLabelStyleBold.copyWith(
                          color: state.isSelected ||
                                  PreferenceUtils.getString(seletedRetailer)
                                      .isNotEmpty
                              ? secondaryLight
                              : Colors.grey[100],
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
