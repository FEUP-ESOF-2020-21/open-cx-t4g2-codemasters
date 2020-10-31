import 'package:firebase_auth/firebase_auth.dart' hide UserCredential;

class Auth {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<FirebaseUser> get user {
    return _auth.onAuthStateChanged;
  }

  registration(String email, String password) async {
    // UserCredential userCrendential =
    //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
    //   email: email,
    //   password: password,
    // );

    // FirebaseUser user = userCrendential.user;
  }
}
