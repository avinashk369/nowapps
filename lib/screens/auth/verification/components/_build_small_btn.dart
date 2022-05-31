part of verification_view;

class BuildSmallBtn extends StatelessWidget {
  const BuildSmallBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const color = true ? Colors.green : Colors.deepPurple;
    return Container(
      height: 52,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: true ? Colors.green : Colors.deepPurple,
      ),
      child: const Center(
        child: true
            ? Icon(
                Icons.done,
                size: 52,
                color: Colors.white,
              )
            : const CircularProgressIndicator(
                color: Colors.white,
              ),
      ),
    );
  }
}
