part of user_auth;

class PhoneNumber extends StatelessWidget {
  const PhoneNumber({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
    var loginBloc = BlocProvider.of<LoginBloc>(context);

    return Form(
      key: loginKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: kToolbarHeight,
                  width: double.infinity,
                  child: CustomInput(
                    focusNode: FocusNode(),
                    hintText: phoneNumber,
                    textController: TextEditingController(text: "954062191"),
                    textInputType: TextInputType.phone,
                    onChanged: (value) => loginBloc.checkNumber(value),
                    validator: (value) =>
                        (value!.length < 10) ? "Invalid mobile number" : null,
                    isPrefix: true,
                    hintTextStyle: kLabelStyle,
                    prefixWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: size.width * .2,
                          child: Row(
                            children: [
                              const SizedBox(width: 12),
                              CachedNetworkImage(
                                height: 25,
                                width: 25,
                                imageUrl:
                                    "https://raw.githubusercontent.com/stevenrskelton/flag-icon/master/png/225/country-4x3/in.png",
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(
                                    strokeWidth: 1,
                                    color: greyColor,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "+91",
                                style: kLabelStyle.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return LoginButton(
                      isValid: (state is ValidNumber) ? state.isValid : false,
                      mobileNumber: (state is ValidNumber) ? state.number : "");
                },
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          BlocBuilder<UserBloc, UserState>(builder: (context, state) {
            return Text((state is UserError) ? state.message : "",
                style: kLabelStyleBold.copyWith(
                  color: Colors.red,
                ));
          })
        ],
      ),
    );
  }
}
