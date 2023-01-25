part of 'pages.dart';

class AccountConfirmationPage extends StatefulWidget {
  final RegistrationData registrationData;
  const AccountConfirmationPage({super.key, required this.registrationData});

  @override
  State<AccountConfirmationPage> createState() =>
      _AccountConfirmationPageState();
}

class _AccountConfirmationPageState extends State<AccountConfirmationPage> {
  bool isSigningUp = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context
            .read<PageBloc>()
            .add(GoToPreferencePage(widget.registrationData));
        return Future<bool>.value(true);
      },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 90),
                    height: 56,
                    child: Stack(
                      children: <Widget>[
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
                        ),
                        Center(
                          child: Text(
                            "Create New\nAcount",
                            style: blackTextFont.copyWith(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: (widget.registrationData.profilePicture == null)
                            ? const AssetImage("assets/user_pic.png")
                                as ImageProvider
                            : FileImage(
                                widget.registrationData.profilePicture ??
                                    File("")),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    "Welcome",
                    style: blackTextFont.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    widget.registrationData.name,
                    textAlign: TextAlign.center,
                    style: blackTextFont.copyWith(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 110),
                  (isSigningUp)
                      ? const SpinKitFadingCircle(
                          color: Color(0xff3e9d9d),
                          size: 45,
                        )
                      : SizedBox(
                          width: 250,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                isSigningUp = true;
                              });

                              imageFileToUpload =
                                  widget.registrationData.profilePicture;

                              SignInSignUpResult? result =
                                  await AuthServices.signUp(
                                widget.registrationData.email,
                                widget.registrationData.password,
                                widget.registrationData.name,
                                widget.registrationData.selectedGenres,
                                widget.registrationData.language,
                              );

                              if (result?.user == null) {
                                setState(() {
                                  isSigningUp = false;
                                });

                                // ignore: use_build_context_synchronously
                                Flushbar(
                                  duration: const Duration(milliseconds: 1500),
                                  flushbarPosition: FlushbarPosition.TOP,
                                  backgroundColor: const Color(0xffff5c83),
                                  message: result?.message,
                                ).show(context);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff3e9d9d),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              "Create My Account",
                              style: whiteTextFont.copyWith(fontSize: 16),
                            ),
                          ),
                        )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
