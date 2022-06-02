library user_auth;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mobilefirst/blocs/login/loginbloc.dart';
import 'package:mobilefirst/blocs/user/userbloc.dart';
import 'package:mobilefirst/repository/user/user_repositoryimpl.dart';
import 'package:mobilefirst/routes/route_constants.dart';
import 'package:mobilefirst/styles/styles.dart';
import 'package:mobilefirst/utils/form_validator.dart';
import 'package:mobilefirst/utils/theme_constants.dart';
import 'package:mobilefirst/utils/utils.dart';
import 'package:mobilefirst/widgets/custom_input.dart';

part '../components/login_button.dart';

part '../components/phone_number.dart';
part '../components/login_header.dart';

class UserAuthScreen extends StatefulWidget {
  const UserAuthScreen({Key? key}) : super(key: key);

  @override
  _UserAuthScreenState createState() => _UserAuthScreenState();
}

class _UserAuthScreenState extends State<UserAuthScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(context.read<UserRepositoryImpl>()),
        ),
      ],
      child: Scaffold(
        body: Column(
          children: [
            const RegistrationHeader(),
            SizedBox(
              height: size.height * .45,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  color: Colors.grey[100],
                ),
                padding: const EdgeInsets.fromLTRB(15, 15, 10, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      "Please login to continue",
                      style: kLabelStyleBold.copyWith(fontSize: 20),
                    ),
                    Divider(
                      endIndent: size.width * .60,
                      color: dividerColor,
                      indent: 0,
                      thickness: 2,
                    ),
                    Text(
                      "",
                      style: kLabelStyle.copyWith(),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    const PhoneNumber(),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
