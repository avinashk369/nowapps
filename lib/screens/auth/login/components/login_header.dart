part of user_auth;

class RegistrationHeader extends StatelessWidget {
  const RegistrationHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: CachedNetworkImage(
        imageUrl:
            "https://static.vecteezy.com/system/resources/previews/002/836/450/non_2x/app-secure-login-vector.jpg",
        fit: BoxFit.cover,
      ),
    );
    ;
  }
}
