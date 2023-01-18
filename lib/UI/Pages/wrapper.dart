part of 'pages.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    PageBloc pageBloc = BlocProvider.of<PageBloc>(context);

    auth.User? firebaseUser = Provider.of<auth.User?>(context);

    if (firebaseUser == null) {
      if (prevPageEventx is! GoToSplashPage) {
        prevPageEventx = GoToSplashPage();
        pageBloc.add(GoToSplashPage());
      }
    } else {
      if (prevPageEventx is! GoToMainPage) {
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
