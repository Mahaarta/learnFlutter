part of 'pages.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 136,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/logo.png"),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 70),
            child: const Text(
              "New Experience",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: 190,
            margin: const EdgeInsets.only(top: 16),
            child: const Text(
              "Watch a new movie much easier than any before",
              style: TextStyle(
                color: accentColor3,
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: 250,
            height: 46,
            margin: const EdgeInsets.only(top: 70, bottom: 19),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
              child: const Text(
                "Get Started",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account ? ",
                style: greyTextFont.copyWith(fontWeight: FontWeight.w400),
              ),
              GestureDetector(
                onTap: () {
                  context.read<PageBloc>().add(GoToLoginPage());
                },
                child: Text(
                  "Sign In",
                  style: purpleTextFont.copyWith(fontWeight: FontWeight.w500),
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}
