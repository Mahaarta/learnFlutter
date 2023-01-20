part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  final RegistrationData? registrationData;
  const SignUpPage({super.key, this.registrationData});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController retypePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    context.read<ThemeBloc>().add(
          ChangeTheme(
            ThemeData().copyWith(
              inputDecorationTheme: InputDecorationTheme(
                floatingLabelStyle: const TextStyle(color: accentColor1),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: const BorderSide(width: 10, color: accentColor1),
                ),
              ),
            ),
          ),
        );

    @override
    // ignore: unused_element
    void initState() {
      super.initState();

      nameController.text = widget.registrationData?.name ?? "";
      emailController.text = widget.registrationData?.email ?? "";
    }

    return WillPopScope(
      onWillPop: () {
        context.read<PageBloc>().add(GoToLoginPage());
        return Future<bool>.value(true);
      },
      child: MaterialApp(
        home: Scaffold(
          body: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 22),
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
                              "Create New\n Account",
                              style: blackTextFont.copyWith(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 90,
                      height: 104,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: widget
                                            .registrationData?.profilePicture ==
                                        null
                                    ? const AssetImage("assets/user_pic.png")
                                        as ImageProvider
                                    : FileImage(widget
                                            .registrationData?.profilePicture ??
                                        File("")),
                              ),
                            ),
                          ),
                          Align(
                            alignment: FractionalOffset.bottomCenter,
                            child: GestureDetector(
                              onTap: () async {
                                if (widget.registrationData?.profilePicture == null) {
                                    //widget.registrationData?.profilePicture = await getImageFromGallery();
                                    ImagePicker().pickImage(source: ImageSource.gallery);
                                } else {
                                    widget.registrationData?.profilePicture = null;
                                }
                              },
                              child: Container(
                                height: 28,
                                width: 28,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage((widget.registrationData
                                                ?.profilePicture ==
                                            null)
                                        ? "assets/btn_add_photo.png"
                                        : "assets/btn_del_photo.png"),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 36),
                    TextField(
                      onChanged: (value) {},
                      controller: nameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: "Full Name",
                          hintText: "Full Name"),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      onChanged: (value) {},
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Email Address",
                        hintText: "Email Address",
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
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
                    const SizedBox(height: 16),
                    TextField(
                      controller: retypePasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Confirm Password",
                        hintText: "Confirm Password",
                      ),
                    ),
                    const SizedBox(height: 30),
                    FloatingActionButton(
                      onPressed: () {},
                      elevation: 0,
                      backgroundColor: primaryColor,
                      child: const Icon(Icons.arrow_forward),
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
