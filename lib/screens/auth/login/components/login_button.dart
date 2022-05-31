part of user_auth;

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required this.mobileNumber,
    required this.isValid,
  }) : super(key: key);
  final String mobileNumber;
  final bool isValid;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserLoaded) {
          Map<String, dynamic> userData = {"mobile": mobileNumber};
          Navigator.of(context)
              .pushReplacementNamed(otpRoute, arguments: userData);
        }
      },
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return button((state is UserLoading) ? true : false, context);
        },
      ),
    );
  }

  Widget button(bool isLoading, BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size.fromHeight(48),
          // onPrimary: Colors.white,
          // primary: isLoading ? Colors.white24 : const Color(0xff1B5E20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3.0),
          ),
        ),
        child: isLoading
            ? const CircularProgressIndicator.adaptive(
                backgroundColor: secondaryLight,
                valueColor: AlwaysStoppedAnimation<Color>(secondaryLight),
                strokeWidth: 2,
              )
            : const Icon(
                Icons.arrow_forward_ios,
                size: 25,
              ),
        onPressed: isValid
            ? () {
                context
                    .read<UserBloc>()
                    .add(UserLoginEvent(mobileNumber: mobileNumber));
              }
            : null,
      );
}
