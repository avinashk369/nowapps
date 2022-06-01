import 'package:flutter/material.dart';
import 'package:mobilefirst/routes/route_constants.dart';
import 'package:mobilefirst/styles/styles.dart';
import 'package:mobilefirst/utils/theme_constants.dart';

class ThankYou extends StatelessWidget {
  const ThankYou({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenColor,
      appBar: AppBar(
        backgroundColor: greenColor,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: secondaryLight,
          ),
          onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
              dashboardRoute, (Route<dynamic> route) => false),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Order has been placed",
            textAlign: TextAlign.center,
            style:
                kLabelStyleBold.copyWith(color: secondaryLight, fontSize: 25),
          )
        ],
      ),
    );
  }
}
