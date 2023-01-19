part of 'pages.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            color: accentColor1,
          ),
          SafeArea(
            bottom: false,
            child: Container(
              color: const Color(0xfff6f7f9),
            ),
          ),
          ListView(),
          createCustomBottomNavigation(),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 46,
                width: 46,
                margin: const EdgeInsets.only(bottom: 42 + 16), // 16 adalah margin dari safe area
                child: FloatingActionButton(
                  elevation: 0,
                  backgroundColor: accentColor2,
                  onPressed: () {},
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: Icon(
                      MdiIcons.walletPlus,
                      color: Colors.black.withOpacity(0.54),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Widget createCustomBottomNavigation() => Align(
        alignment: Alignment.bottomCenter,
        child: ClipPath(
          clipper: BottomNavBarClipper(),
          child: Container(
            height: 70 + 16, // 16 adalah margin dari safe area
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
          ),
        ),
      );
}

class BottomNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(size.width / 2 - 28, 0);
    path.quadraticBezierTo(size.width / 2 - 28, 33, size.width / 2, 33);
    path.quadraticBezierTo(size.width / 2 + 28, 33, size.width / 2 + 28, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    throw UnimplementedError();
  }
}
