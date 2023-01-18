part of 'pages.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Sign In Page")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: ElevatedButton(
            child: const Text("Sign In "),
            onPressed: () {
              AuthServices.signIn("minataoffice2@gmail.com", "1234567");
            },
          )),
        ],
      ),
    );
  }
}
