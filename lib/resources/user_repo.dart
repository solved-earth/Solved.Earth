import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/models/user_profile_model.dart';

// This class handles interactions with the user data in Firestore.
class UserRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Creates a new user profile in Firestore.
  Future<void> createProfile(UserProfileModel profile) async {
    await _db.collection("users").doc(profile.uid).set(profile.toJson());
  }

  // Retrieves the user profile data from Firestore based on UID.
  Future<Map<String, dynamic>?> findProfile(String uid) async {
    final doc = await _db.collection("users").doc(uid).get();
    return doc.data();
  }

  // Updates the user data in Firestore with new information.
  Future<void> updateUser(String uid, Map<String, dynamic> data) async {
    await _db.collection("users").doc(uid).update(data);
  }
}

// A provider instance that exposes the UserRepository to the app.
final userRepo = Provider(
  (ref) => UserRepository(),
);
