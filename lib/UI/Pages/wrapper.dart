part of 'pages.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    auth.User? firebaseUser = Provider.of<auth.User?>(context);
    PageState? pageStates;

    if (kDebugMode) {
      print("firebaseUser == $firebaseUser");
    }

    if (firebaseUser == null) {
      if (kDebugMode) {
        print("prevPageEventx == $prevPageEventx");
      }

      if (prevPageEventx is! GoToSplashPage) {
        prevPageEventx = GoToSplashPage();
        context.read<PageBloc>().add(GoToSplashPage());
        // BlocProvider.of<PageBloc>(context).add(GoToSplashPage());
        BlocProvider.of<PageBloc>(context).add(GoToSplashPage());
      }
    } else {
      if (prevPageEventx is! GoToMainPage) {
        prevPageEventx = GoToMainPage();
        context.read<PageBloc>().add(GoToMainPage());
        if (kDebugMode) {
          print("HAHHA");
        }
       // BlocProvider.of<PageBloc>(context).add(GoToSplashPage());
      }
    }

    if (kDebugMode) {
      print("pageStates == $pageStates");
    }

    return BlocBuilder<PageBloc, PageState>(
        builder: (_, pageState) => (pageState is OnSplashPage)
            ? const SplashPage()
            : (pageState is OnLoginPage)
                ? const SignInPage()
                : const SplashPage());
  }
}
