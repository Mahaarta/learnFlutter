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
          body: Container(child: Center(child: Text("ad")),),
        ),
      ),
    );
  }
}
