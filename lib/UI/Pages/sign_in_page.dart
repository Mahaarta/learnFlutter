part of 'pages.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    context.read<ThemeBloc>().add(
          ChangeTheme(
            ThemeData().copyWith(
              inputDecorationTheme: InputDecorationTheme(
                floatingLabelStyle: const TextStyle(color: accentColor2),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(width: 1, color: accentColor2),
                ),
              ),
            ),
          ),
        );

    return WillPopScope(
      onWillPop: () {
        context.read<PageBloc>().add(GoToSplashPage());
        return Future<bool>.value(true);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
            child: ListView(
              children: [
                const SizedBox(height: 30),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 70,
                      child: Image.asset("assets/logo.png"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 70, bottom: 40),
                      child: Text(
                        "Welcome back, \nExplorer!",
                        style: blackTextFont.copyWith(fontSize: 20),
                      ),
                    ),
                    TextField(
                      onChanged: (text) {
                        setState(() {
                          isEmailValid = text.isValidEmail();
                        });
                      },
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Email address",
                        hintText: "Email address",
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      onChanged: (text) {
                        setState(() {
                          isPasswordValid = text.length >= 6;
                        });
                      },
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Password",
                        hintText: "Password",
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Forgot password ?",
                      style: greyTextFont.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: (isSigningIn)
                            ? const SpinKitFadingCircle(color: primaryColor)
                            : FloatingActionButton(
                                backgroundColor:
                                    (isEmailValid && isPasswordValid)
                                        ? primaryColor
                                        : const Color(0xFFbebebe),
                                onPressed: (isEmailValid && isPasswordValid)
                                    ? () async {
                                        setState(() {
                                          isSigningIn = true;
                                        });

                                        SignInSignUpResult? result =
                                            await AuthServices.signIn(
                                                emailController.text,
                                                passwordController.text);

                                        if (result?.user == null) {
                                          setState(() {
                                            isSigningIn = false;
                                          });

                                          if (mounted) {
                                            Flushbar(
                                              duration:
                                                  const Duration(seconds: 4),
                                              flushbarPosition:
                                                  FlushbarPosition.TOP,
                                              backgroundColor:
                                                  const Color(0xffff5c83),
                                              message: result?.message ?? "-",
                                            ).show(context);
                                          }
                                        }
                                      }
                                    : null,
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: (isEmailValid && isPasswordValid)
                                      ? Colors.white
                                      : const Color(0xffe4e4e4),
                                ),
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          Text(
                            "Start fresh now? ",
                            style: greyTextFont.copyWith(
                                fontWeight: FontWeight.w400),
                          ),
                          GestureDetector(
                            onTap: () {
                              context
                                  .read<PageBloc>()
                                  .add(GoToSignUpPage(RegistrationData()));
                            },
                            child: Text(
                              " Sign Up",
                              style: purpleTextFont.copyWith(
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
