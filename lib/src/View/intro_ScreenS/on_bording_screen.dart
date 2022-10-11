part of intro_screens;

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({Key? key}) : super(key: key);

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  //Controller to keep track of wicht page we're on
  final controller = PageController();

  //Keep track of if we are on the last page or not
  bool onLastPage = false;

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        //Page View
        PageView(
          controller: controller,
          onPageChanged: (value) {
            setState(() => onLastPage = value == 2);
          },
          children: const [
            IntroPage1(),
            IntroPage2(),
            IntroPage3(),
          ],
        ),

        Container(
          alignment: const Alignment(0, 0.70),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //Skip
              GestureDetector(
                onTap: () {
                  controller.jumpToPage(2);
                },
                child: const Text('Skip'),
              ),

              //Dot indicator
              SmoothPageIndicator(
                controller: controller,
                count: 3,
              ),

              //Next or done
              onLastPage
                  ? GestureDetector(
                      onTap: () async {
                        //navigate directly to home page
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setBool('showHome', true);

                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => const Home()),
                        );
                      },
                      child: const Text('Done'),
                    )
                  : GestureDetector(
                      onTap: () {
                        controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                      child: const Text('Next'),
                    ),
            ],
          ),
        ),
      ]),
    );
  }
}
