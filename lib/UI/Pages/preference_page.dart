part of 'pages.dart';

class PreferencePage extends StatefulWidget {
  final RegistrationData registrationData;

  final List<String> genres = ["Horor", "Action", "Drama", "War", "Comedy"];
  final List<String> languages = [
    "Indonesian",
    "English",
    "Japanese",
    "Korean",
    "Mandarin"
  ];

  PreferencePage({
    required this.registrationData,
    super.key,
  });

  @override
  State<PreferencePage> createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {
  List<String> selectedGenres = [];
  String selectedLanguage = "";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.registrationData.password = "";
        context.read<PageBloc>().add(GoToSignUpPage(widget.registrationData));
        return Future<bool>.value(true);
      },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 56,
                    margin: const EdgeInsets.only(top: 20, bottom: 4),
                    child: GestureDetector(
                      onTap: () {
                        context
                            .read<PageBloc>()
                            .add(GoToSignUpPage(widget.registrationData));
                      },
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),
                  const Text(
                    "Select Your Four\nFavorite Genres",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    children: generatedGenreWidget(context),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Movie Language\nYou Prefer",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    children: generatedLanguageWidget(context),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: FloatingActionButton(
                      elevation: 0,
                      backgroundColor: primaryColor,
                      onPressed: () {
                        if (selectedGenres.length != 4) {
                          Flushbar(
                            duration: const Duration(milliseconds: 1500),
                            flushbarPosition: FlushbarPosition.TOP,
                            backgroundColor: const Color(0xffff5c83),
                            message: "Please select 4 genres",
                          ).show(context);
                        } else {
                          widget.registrationData.selectedGenres =
                              selectedGenres;
                          widget.registrationData.language = selectedLanguage;

                          context.read<PageBloc>().add(
                              GoToAccountConfirmationPage(
                                  widget.registrationData));
                        }
                      },
                      child: const Icon(Icons.arrow_forward),
                    ),
                  ),
                  const SizedBox(height: 20)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> generatedGenreWidget(BuildContext context) {
    double width =
        ((MediaQuery.of(context).size.width / 2) - (2 * defaultMargin));

    return widget.genres
        .map((e) => SelectableBox(e,
            width: width,
            height: 60,
            isSelected: selectedGenres.contains(e),
            onTap: () => _onSelectedGenre(e)))
        .toList();
  }

  void _onSelectedGenre(String genre) {
    if (selectedGenres.contains(genre)) {
      setState(() {
        selectedGenres.remove(genre);
      });
    } else {
      if (selectedGenres.length < 4) {
        setState(() {
          selectedGenres.add(genre);
        });
      }
    }
  }

  List<Widget> generatedLanguageWidget(BuildContext context) {
    double width =
        ((MediaQuery.of(context).size.width / 2) - (2 * defaultMargin));

    return widget.languages
        .map((e) => SelectableBox(
              e,
              width: width,
              height: 60,
              isSelected: selectedLanguage == e,
              onTap: () {
                setState(() {
                  selectedLanguage = e;
                });
              },
            ))
        .toList();
  }
}
