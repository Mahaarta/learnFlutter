part of 'models.dart';

class RegistrationData {
  String name;
  String email;
  String password;
  List<String> selectedGenres;
  String language;
  int balance;
  File? profilePicture;

  RegistrationData({
    this.name = "",
    this.email = "",
    this.password = "",
    this.selectedGenres = const [],
    this.language = "",
    this.balance = 0,
    this.profilePicture,
  });
}
