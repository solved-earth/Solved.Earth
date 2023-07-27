import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod/riverpod.dart';

class AuthenticationRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  bool get isLoggedIn => user != null;
  User? get user => _firebaseAuth.currentUser;
}

final authRepo = Provider((ref) => AuthenticationRepository());

// Makes the user to be directed to the SignUp&LogIn Page if the user is not Logged In
// Need to configure with GoRouter (https://nomadcoders.co/tiktok-clone/lectures/4338)