part of 'pages.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    PageBloc pageBloc = BlocProvider.of<PageBloc>(context);
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    auth.User? firebaseUser = Provider.of<auth.User?>(context);

    if (firebaseUser == null) {
      if (prevPageEvent is! GoToSplashPage) {
        prevPageEvent = GoToSplashPage();
        pageBloc.add(GoToSplashPage());
      }
    } else {
      if (prevPageEvent is! GoToMainPage) {
        userBloc.add(LoadUser(firebaseUser.uid));
        prevPageEvent = GoToMainPage();
        pageBloc.add(GoToMainPage());
      }
    }

    return BlocBuilder<PageBloc, PageState>(
        builder: (_, pageState) => (pageState is OnSplashPage)
            ? const SplashPage()
            : (pageState is OnLoginPage)
                ? const SignInPage()
                : (pageState is OnSignUpPage)
                    ? SignUpPage(registrationData: pageState.registrationData)
                    : const MainPage());
  }
}
