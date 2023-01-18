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
        onPressed: () {
          pageBloc.add(GoToLoginPage());
          AuthServices.signOuts();
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        child: const Text("Sign Out"),
      )),
    );
  }
}
