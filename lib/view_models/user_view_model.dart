import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/resources/authentication_repo.dart';
import 'package:app/models/user_profile_model.dart';
import 'package:app/resources/user_repo.dart';

// ViewModel responsible for managing user profiles and authentication state.
class UsersViewModel extends AsyncNotifier<UserProfileModel> {
  late final UserRepository _usersRepository;
  late final AuthenticationRepository _authenticationRepository;

  @override
  FutureOr<UserProfileModel> build() async {
    _usersRepository =
        ref.read(userRepo); // Access the user repository from the context.
    _authenticationRepository = ref.read(
        authRepo); // Access the authentication repository from the context.

    if (_authenticationRepository.isLoggedIn) {
      final profile = await _usersRepository.findProfile(
          _authenticationRepository
              .user!.uid); // Retrieve user profile from the repository.
      if (profile != null) {
        return UserProfileModel.fromJson(
            profile); // Convert profile data to a UserProfileModel instance.
      }
    }

    return UserProfileModel
        .empty(); // Return an empty user profile if not logged in or no profile found.
  }

  // Creates a user profile using the provided user credential and additional information.
  Future<void> createProfile({
    required UserCredential credential,
    String email = "",
    String name = "",
    String birthday = "",
  }) async {
    if (credential.user == null) {
      throw Exception("계정이 생성되지 않았습니다");
    }
    state = const AsyncValue.loading(); // Set loading state.
    final profile = UserProfileModel(
      email: credential.user!.email ?? email,
      name: credential.user!.displayName ?? name,
      uid: credential.user!.uid,
      birthday: birthday,
    ); // Create a UserProfileModel instance.
    await _usersRepository
        .createProfile(profile); // Store the user profile in the repository.
    state = AsyncValue.data(profile); // Set the state to the created profile.
  }
}

// Provider instance that exposes the UsersViewModel to the app.
final usersProvider = AsyncNotifierProvider<UsersViewModel, UserProfileModel>(
  () => UsersViewModel(),
);
