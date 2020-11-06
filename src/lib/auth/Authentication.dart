import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService {
  static final FirebaseAuth auth = FirebaseAuth.instance;
  static String uEmail, uPassword;

  static Future<String> signUp(String email, String password) async {
    await Firebase.initializeApp();

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
    } catch (e) {
      return e.toString();
    }
  }

  static Future<String> signIn(String email, String password) async {
    await Firebase.initializeApp();
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      uEmail = email;
      uPassword = password;

      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found')
        return 'No user found for that email.';
      else if (e.code == 'wrong-password')
        return 'Wrong password provided for that user.';

      return e.code;
    }

    // print(auth.currentUser.uid);
  }

  static Future<String> updateEmail(String newEmail) async {
    await Firebase.initializeApp();

    try {
      await auth.currentUser.updateEmail(newEmail);
      uEmail = newEmail;
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use')
        return 'The account already exists for that email.';
      else if (e.code == 'invalid-email')
        return 'Invalid Email inserted.';
      else if (e.code == 'requires-recent-login') {
        // print(uEmail);
        // print(uPassword);
        AuthCredential credential =
            EmailAuthProvider.credential(email: uEmail, password: uPassword);

        // print(credential);
        await auth.currentUser.reauthenticateWithCredential(credential);

        await auth.currentUser.updateEmail(newEmail);
        uEmail = newEmail;
        return null;
      }

      return e.code;
    }
  }

  static Future<String> updatePassword(String newPassword) async {
    await Firebase.initializeApp();
    try {
      await auth.currentUser.updatePassword(newPassword);
      uPassword = newPassword;
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password')
        return 'Password too weak. Please insert another.';
      else if (e.code == 'requires-recent-login') {
        // print(uEmail);
        // print(uPassword);
        AuthCredential credential =
            EmailAuthProvider.credential(email: uEmail, password: uPassword);

        // print(credential);
        await auth.currentUser.reauthenticateWithCredential(credential);

        await auth.currentUser.updatePassword(newPassword);
        uPassword = newPassword;
        return null;
      }
      return e.code;
    }
  }

  static Future signOut() async {
    try {
      await auth.signOut();
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
  }
}
