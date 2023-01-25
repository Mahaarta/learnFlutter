part of 'extensions.dart';

extension FirebaseUserExtension on UserCredential {
  UserModel convertToUserModel({
    String name = "anon",
    String email = "",
    List<String> selectedGenres = const [],
    String selectedLanguage = "en",
    int balance = 50000,
  }) =>
      UserModel(
        user!.uid,
        email: email,
        name: name,
        selectedGenres: selectedGenres,
        selectedLanguage: selectedLanguage,
      );

  Future<UserModel> fromFireStores() async =>
      await UserServices.getUser(user?.uid ?? "");
}
