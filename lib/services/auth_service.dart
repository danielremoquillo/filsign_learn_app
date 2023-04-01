import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _gAuth = GoogleSignIn();

  // Sign in with email and password
  signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return e.code;
      } else if (e.code == 'wrong-password') {
        return e.code;
      }
    }
    return 'success';
  }

  signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    try {
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print('tite');
      if (e.code == 'user-not-found') {
        return e.code;
      } else if (e.code == 'wrong-password') {
        return e.code;
      }
    }
    return 'success';
  }

  // Register with email and password

  registerWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      return (e.toString());
    }

    return 'success';
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await _gAuth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
