part of verification_view;

class VerificationBtn extends StatelessWidget {
  const VerificationBtn(
      {Key? key,
      required this.isValid,
      required this.otp,
      required this.mobileNumber})
      : super(key: key);
  final bool isValid;
  final String otp;
  final String mobileNumber;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is OtpVerified) {
          PreferenceUtils.putString(
              loggedIn, state.userModel.mobile.toString());

          Navigator.of(context).popAndPushNamed(dashboardRoute,
              arguments: state.userModel.mobile!);
        }
      },
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return otpVerifyBtn(true, otp, context);
          }
          return otpVerifyBtn(false, otp, context);
        },
      ),
    );
  }

  Widget otpVerifyBtn(bool isLoading, String otp, BuildContext context) =>
      ElevatedButton(
        onPressed: isValid
            ? () {
                context
                    .read<UserBloc>()
                    .add(VerifyOtp(otp: otp, mobile: mobileNumber));
                context.read<TimerBloc>().cancelTimer();
              }
            : null,
        child: isLoading
            ? const LoadingUI()
            : const FittedBox(child: Text("Verify OTP")),
        style: ElevatedButton.styleFrom(
          fixedSize: const Size.fromHeight(48),
          // onPrimary: primaryLight,
          primary: isLoading ? Colors.white24 : primaryLight,
          //onSurface: purple100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      );
}
