part of 'services.dart';

class UserServices {
  static final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection("users");

  static Future<void> updateUser(UserModel user) async {
    _userCollection.doc(user.id).set({
      'email': user.email,
      'name': user.name,
      'balance': user.balance,
      'selectedGenres': user.selectedGenres,
      'selectedLanguage': user.selectedLanguage,
      'profilePicture': user.profilePicture
    });
  }

  static Future<UserModel> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.doc(id).get();

    return UserModel(id,
        email: snapshot.get("email"),
        name: snapshot.get("name"),
        balance: snapshot.get("balance"),
        selectedLanguage: snapshot.get("selectedLanguage"),
        profilePicture: snapshot.get("profilePicture"));
  }
}
