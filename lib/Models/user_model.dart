part of 'models.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String name;
  final List<String> selectedGenres;
  final String selectedLanguage;
  final String profilePicture;
  final int balance;

  const UserModel(this.id,
      {this.email = "",
      this.name = "noname",
      this.profilePicture = "",
      this.balance = 50000,
      this.selectedGenres = const [],
      this.selectedLanguage = "english"});

  @override
  String toString() {
    return "[$id] - [$name] - [$email]";
  }

  @override
  List<Object?> get props => [
        id,
        email,
        name,
        selectedGenres,
        selectedLanguage,
        profilePicture,
        balance
      ];
}
