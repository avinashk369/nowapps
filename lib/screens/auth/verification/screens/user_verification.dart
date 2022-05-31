library verification_view;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilefirst/blocs/login/loginbloc.dart';
import 'package:mobilefirst/blocs/login/timerbloc.dart';
import 'package:mobilefirst/blocs/user/user_bloc.dart';
import 'package:mobilefirst/repository/user/user_repositoryimpl.dart';
import 'package:mobilefirst/routes/route_constants.dart';
import 'package:mobilefirst/styles/styles.dart';
import 'package:mobilefirst/utils/preference_utils.dart';
import 'package:mobilefirst/utils/theme_constants.dart';
import 'package:mobilefirst/utils/utils.dart';
import 'package:mobilefirst/widgets/loading_ui.dart';
import 'package:pinput/pinput.dart';

part 'mobile/otp_contr.dart';

part '../components/_build_small_btn.dart';
part '../components/_build_timer.dart';
part '../components/_image_header.dart';
part '../components/_otp_container.dart';
part '../components/verification_btn.dart';

class UserVerification extends StatefulWidget {
  const UserVerification({Key? key, required this.mobile}) : super(key: key);

  final String mobile;

  @override
  _UserVerificationState createState() => _UserVerificationState();
}

class _UserVerificationState extends State<UserVerification> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<LoginBloc>(
              create: (context) => LoginBloc(),
            ),
            BlocProvider<UserBloc>(
              create: (context) => UserBloc(context.read<UserRepositoryImpl>()),
            ),
            BlocProvider(
                create: (context) =>
                    TimerBloc()..validateCountdownResendCode()),
          ],
          child: OtpContr(
            mobile: widget.mobile,
          ),
        ),
      ),
    );
  }
}
