part of verification_view;

class BuildTimer extends StatelessWidget {
  const BuildTimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int timeLeft = 0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text("Didn't receive the code ? "),
        // TweenAnimationBuilder(
        //   tween: Tween(begin: 10.0, end: 0.0),
        //   duration: const Duration(seconds: 10),
        //   builder: (_, double value, child) {
        //     timeLeft = value.toInt();

        //     return Text(
        //       "00:${value.toInt()}",
        //     );
        //   },
        // ),
        BlocBuilder<TimerBloc, TimerState>(
          builder: (context, state) {
            if (state is CountDownstarted) {
              print("i am here ${state.canResend}");
              return TextButton(
                onPressed: (state.canResend)
                    ? () => BlocProvider.of<TimerBloc>(context)
                        .validateCountdownResendCode()
                    : null,
                child: Text(
                  (state.countdown) > 0 ? "${state.countdown}" : "Resend OTP",
                  style: kLabelStyleBold.copyWith(
                    color: redColor,
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
