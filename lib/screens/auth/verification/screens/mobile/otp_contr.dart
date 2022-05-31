part of verification_view;

class OtpContr extends StatelessWidget {
  const OtpContr({
    Key? key,
    required this.mobile,
  }) : super(key: key);
  final String mobile;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        const ImageHeader(),
        SizedBox(
          height: size.height * .5,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              color: Colors.grey[100],
            ),
            padding: const EdgeInsets.fromLTRB(5, 15, 5, 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "OTP Verification",
                    style: kLabelStyleBold.copyWith(fontSize: 20),
                  ),
                ),
                Divider(
                  endIndent: size.width * .60,
                  color: dividerColor,
                  indent: 15,
                  thickness: 2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Enter the otp sent to ",
                          style: kLabelStyle.copyWith(),
                        ),
                        TextSpan(
                          text: "+91-$mobile",
                          style: kLabelStyleBold.copyWith(),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                OtpContainer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocBuilder<TimerBloc, TimerState>(
                      builder: (context, state) {
                        if (state is CountDownstarted) {
                          return const BuildTimer();
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                    //BuildTimer(),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                    child: SizedBox(
                      width: size.width,
                      child: BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          if (state is ValidOtp) {
                            return VerificationBtn(
                              isValid: state.isValid,
                              otp: state.otp,
                              mobileNumber: mobile,
                            );
                          } else {
                            return VerificationBtn(
                              isValid: false,
                              otp: "",
                              mobileNumber: mobile,
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                BlocBuilder<UserBloc, UserState>(builder: (context, state) {
                  return Center(
                    child: Text((state is UserError) ? state.message : "",
                        style: kLabelStyle.copyWith(
                          color: Colors.red,
                        )),
                  );
                })
              ],
            ),
          ),
        ),
      ],
    );
  }
}
