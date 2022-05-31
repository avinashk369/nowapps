part of verification_view;

class OtpContainer extends StatelessWidget {
  OtpContainer({Key? key}) : super(key: key);

  var defaultPinTheme = PinTheme(
    width: 40,
    height: 40,
    decoration: BoxDecoration(
      border: Border.all(color: primaryLight),
      borderRadius: BorderRadius.circular(25),
    ),
  );

  @override
  Widget build(BuildContext context) {
    var loginBloc = BlocProvider.of<LoginBloc>(context);
    return pinPut(context);
  }

  Widget pinPut(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Pinput(
          length: 6,
          onSubmitted: (String pin) {},
          defaultPinTheme: defaultPinTheme,
          focusNode: FocusNode(),
          controller: TextEditingController(),
          submittedPinTheme: defaultPinTheme.copyWith(
            decoration: BoxDecoration(
              border: Border.all(color: primaryLight),
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
          focusedPinTheme: defaultPinTheme.copyWith(
            decoration: BoxDecoration(
              border: Border.all(color: primaryLight),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          followingPinTheme: defaultPinTheme.copyWith(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(
                color: primaryLight,
              ),
            ),
          ),
          onChanged: (value) => context.read<LoginBloc>().checkOtp(value),
        ),
      );
}
