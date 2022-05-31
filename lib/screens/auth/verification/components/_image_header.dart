part of verification_view;

class ImageHeader extends StatelessWidget {
  const ImageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: CachedNetworkImage(
        imageUrl:
            "https://image.freepik.com/free-vector/secure-login-concept-illustration_114360-4685.jpg",
        fit: BoxFit.cover,
      ),
    );
  }
}
