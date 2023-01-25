part of 'services.dart';

class AuthServices {
  static Future<SignInSignUpResult?> signUp(
    String email,
    String password,
    String name,
    List<String> selectedGenres,
    String selectedLanguage,
  ) async {
    try {
      auth.UserCredential result =
          await auth.FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel userModel = result.convertToUserModel(
        name: name,
        email: email,
        selectedGenres: selectedGenres,
        selectedLanguage: selectedLanguage,
      );


      await UserServices.updateUser(userModel);
      return SignInSignUpResult(user: userModel);
    } catch (error) {
      return SignInSignUpResult(message: error.toString());
    }
  }

  static Future<SignInSignUpResult?> signIn(
      String email, String password) async {
    try {
      auth.UserCredential result =
          await auth.FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel user = await result.fromFireStores();

      return SignInSignUpResult(user: user);
    } on FirebaseAuthException catch (error) {
      return SignInSignUpResult(message: error.message);
    }
  }

  static Future<void> signOuts() async {
    try {
      await auth.FirebaseAuth.instance.signOut();
    } catch (error) {
      throw UnimplementedError();
    }
  }

  static Stream<auth.User?> get userStream =>
      auth.FirebaseAuth.instance.authStateChanges();
}

class SignInSignUpResult {
  final UserModel? user;
  final String? message;
  SignInSignUpResult({this.user, this.message});
}
