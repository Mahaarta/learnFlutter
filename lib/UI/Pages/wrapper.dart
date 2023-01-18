part of 'pages.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    PageBloc pageBloc = BlocProvider.of<PageBloc>(context);
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    auth.User? firebaseUser = Provider.of<auth.User?>(context);
    
    print("wrappp");

    if (firebaseUser == null) {
      if (prevPageEventx is! GoToSplashPage) {
        prevPageEventx = GoToSplashPage();
        pageBloc.add(GoToSplashPage());
      }
    } else {
      if (prevPageEventx is! GoToMainPage) {
        userBloc.add(LoadUser(firebaseUser.uid));
        prevPageEventx = GoToMainPage();
        pageBloc.add(GoToMainPage());
      }
    }

    return BlocBuilder<PageBloc, PageState>(
        builder: (_, pageState) => (pageState is OnSplashPage)
            ? const SplashPage()
            : (pageState is OnLoginPage)
                ? const SignInPage()
                : const MainPage());
  }
}
