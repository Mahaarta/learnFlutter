part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  final RegistrationData? registrationData;
  const SignUpPage({super.key, this.registrationData});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController retypePasswordController = TextEditingController();

    @override
    // ignore: unused_element
    void initState() {
      super.initState();

      nameController.text = widget.registrationData?.name ?? "";
      emailController.text = widget.registrationData?.email ?? "";
    }

    return WillPopScope(
      onWillPop: () {
        context.read<PageBloc>().add(GoToSplashPage());
        return Future<bool>.value(true);
      },
      child: MaterialApp(
        home: Scaffold(
          body: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 22),
                      height: 56,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: () {
                                context.read<PageBloc>().add(GoToSplashPage());
                              },
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
