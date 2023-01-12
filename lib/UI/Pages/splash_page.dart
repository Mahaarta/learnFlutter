part of 'pages.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Splash Page")),
      body: Center(
          child: ElevatedButton(
        child: const Text("Go to login page"),
        onPressed: () {
            // context.read<PageBloc>().add(GoToLoginPage());
            BlocProvider.of<PageBloc>(context).add(GoToLoginPage());
        },
      )),
    );
  }
}
