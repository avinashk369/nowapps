import 'package:flutter/material.dart';
import 'package:mobilefirst/screens/home.dart';
import 'package:mobilefirst/utils/utils.dart';

import 'auth/login/screens/user_auth_screen.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  bool dbAvl = false;
  String? userId;
  @override
  void initState() {
    userId = PreferenceUtils.getString(loggedIn);

    dbAvl = PreferenceUtils.getBool(dbSync);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (userId!.isNotEmpty)
          ? const Home() //FireCrud() //Dashboard()
          : const UserAuthScreen(),
    );
  }
}
