import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod/riverpod.dart';

class AuthenticationRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Getter to check if a user is logged in.
  bool get isLoggedIn => user != null;
  User? get user =>
      _firebaseAuth.currentUser; // Get the currently logged-in user.

  // Stream of authentication state changes.
  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  // Method to sign up a new user with email and password.
  Future<UserCredential> signUp(String email, String password) async {
    return _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // Method to sign out the currently logged-in user.
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  // Method to sign in a user with email and password.
  Future<void> signIn(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}

// Create a provider for AuthenticationRepository.
final authRepo = Provider((ref) => AuthenticationRepository());

// Create a StreamProvider for authentication state changes.
final authState = StreamProvider((ref) {
  final repo =
      ref.read(authRepo); // Read the AuthenticationRepository provider.
  return repo
      .authStateChanges(); // Return the stream of authentication state changes.
});
