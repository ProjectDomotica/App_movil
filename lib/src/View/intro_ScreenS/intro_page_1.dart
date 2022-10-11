part of intro_screens;

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink[100],
      child: const Center(
        child: Text('Page1'),
      ),
    );
  }
}
