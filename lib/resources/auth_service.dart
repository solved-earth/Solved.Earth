/*
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  // Google Sign In
  signInWithGoogle() async {
    // begin interactive sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    // obtain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // create a new credential for user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    // sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
*/

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Get the UID of the currently signed-in user or show 'No user signed in'.
  String currentUserUid =
      FirebaseAuth.instance.currentUser?.uid ?? 'No user signed in';

  // Sign in using Google authentication.
  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn(); // Start Google sign-in process.
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!
              .authentication; // Get authentication details.
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth
          .signInWithCredential(credential); // Sign in with the credential.
      print('Current user UID: $currentUserUid'); // Display current user's UID.
    } on FirebaseAuthException catch (e) {
      print(e.message); // Print the error message.
      rethrow; // Re-throw the exception for handling at a higher level.
    }
  }

  // Sign out from both Google and Firebase.
  Future<void> signOutFromGoogle() async {
    await _googleSignIn.signOut(); // Sign out from Google.
    await _auth.signOut(); // Sign out from Firebase.
  }
}
