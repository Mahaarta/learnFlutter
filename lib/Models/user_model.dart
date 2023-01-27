part of 'models.dart';

class UserModel extends Equatable {
  final String id;
  final String? email;
  final String? name;
  final List<String> selectedGenres;
  final String? selectedLanguage;
  final String? profilePicture;
  final int? balance;

  const UserModel(
    this.id, {
    this.email,
    this.name,
    this.selectedGenres = const [],
    this.selectedLanguage,
    this.profilePicture = "[]",
    this.balance = 50500,
  });

  UserModel copyWith({
    String? name,
    String? profilePicture,
    int? balance,
  }) =>
      UserModel(
        id,
        email: email,
        name: name ?? this.name,
        selectedGenres: selectedGenres,
        selectedLanguage: selectedLanguage,
        profilePicture: profilePicture,
        balance: balance ?? this.balance,
      );

  @override
  String toString() {
    return "[$id] - [$name] - [$email] - [[$selectedGenres]]";
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
