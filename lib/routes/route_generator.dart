import 'package:flutter/material.dart';
import 'package:mobilefirst/blocs/product/product_bloc.dart';
import 'package:mobilefirst/models/product/product_model.dart';
import 'package:mobilefirst/screens/auth/verification/screens/user_verification.dart';
import 'package:mobilefirst/screens/cart/cart_list.dart';
import 'package:mobilefirst/screens/home.dart';
import 'package:mobilefirst/screens/product/product_list.dart';
import 'package:mobilefirst/screens/thank_you.dart';
import 'package:mobilefirst/screens/welcome.dart';
import 'package:mobilefirst/utils/slide_right_route.dart';

import 'route_constants.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch (settings.name) {
      case homeRoute:
        return SlideRightRoute(page: const Welcome());
      case dashboardRoute:
        return SlideRightRoute(page: const Home());
      case products:
        return SlideRightRoute(page: const ProductList());
      case cartRoute:
        return SlideRightRoute(
            page: CartList(
          productBloc: args as ProductBloc,
        ));
      case thankYouRoute:
        return SlideRightRoute(page: const ThankYou());
      case otpRoute:
        Map<String, dynamic> data = args as Map<String, dynamic>;

        String mobile = data['mobile'];
        return SlideRightRoute(
          page: UserVerification(
            mobile: mobile,
          ),
        );

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
