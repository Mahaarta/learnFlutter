part of 'pages.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    PageBloc pageBloc = BlocProvider.of<PageBloc>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Splash Page")),
      body: Center(
          child: ElevatedButton(
        child: const Text("Go to login page"),
        onPressed: () {
          pageBloc.add(GoToLoginPage());
        },
      )),
    );
  }
}
