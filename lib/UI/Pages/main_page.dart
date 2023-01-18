part of 'pages.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    PageBloc pageBloc = BlocProvider.of<PageBloc>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Main Page")),
      body: Center(
          child: ElevatedButton(
        child: const Text("Sign Out"),
        onPressed: () {
          pageBloc.add(GoToLoginPage());
          AuthServices.signOuts();
        },
      )),
    );
  }
}
