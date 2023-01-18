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
    auth.FirebaseAuth currentUser = auth.FirebaseAuth.instance;

    return Scaffold(
      appBar: AppBar(title: const Text("Main Page")),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          BlocBuilder<UserBloc, UserState>(
            builder: (_, userState) => (userState is UserLoaded)
                ? FutureBuilder(
                    future: userState.user,
                    builder: (context, snapshot) => Text(
                      snapshot.data?.selectedLanguage ?? "noname",
                    ),
                  )
                : SizedBox(
                    width: 80,
                    child: Text("$userState"),
                  ),
          ),
          ElevatedButton(
            onPressed: () {
              pageBloc.add(GoToLoginPage());
              AuthServices.signOuts();
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text("Sign Out"),
          ),
        ],
      )),
    );
  }
}
