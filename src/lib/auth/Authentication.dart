import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService {
  static final FirebaseAuth auth = FirebaseAuth.instance;

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
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use')
        return 'The account already exists for that email.';
      else if (e.code == 'invalid-email')
        return 'Invalid Email inserted.';
      else if (e.code == 'requires-recent-login')
        return 'requires-recent-login';

      return e.code;
    }
  }

  static Future<String> updatePassword(String newPassword) async {
    await Firebase.initializeApp();
    try {
      await auth.currentUser.updatePassword(newPassword);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password')
        return 'Password too weak. Please insert another.';
      else if (e.code == 'requires-recent-login')
        return 'requires-recent-login';
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
