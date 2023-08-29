import 'dart:async';

import 'package:app/resources/authentication_repo.dart';
import 'package:app/view_models/user_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/utils/utils.dart';

// ViewModel responsible for managing the sign-up process.
class SignUpViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _authRepo;
  int count = 0;

  @override
  FutureOr<void> build() {
    _authRepo = ref.read(
        authRepo); // Access the authentication repository from the context.
  }

  // Initiates the sign-up process.
  Future<void> signUp(BuildContext context) async {
    state = const AsyncValue.loading(); // Set loading state.
    final form = ref.read(signUpForm); // Access the sign-up form state.
    final users = ref.read(usersProvider.notifier); // Access the user provider.

    state = await AsyncValue.guard(
      () async {
        final userCredential = await _authRepo.signUp(
          form["email"], // Get email from the form.
          form["password"], // Get password from the form.
        );
        await users.createProfile(
          credential: userCredential,
          email: form['email'],
          name: form['name'],
          birthday: form['birthday'],
        ); // Create a user profile with the obtained credentials and form data.
      },
    );
    if (state.hasError) {
      showFirebaseErrorSnack(
          context, state.error); // Show error snack bar if sign-up fails.
    } else {
      //context.go("/mainpage");
      Navigator.of(context).popUntil((_) =>
          count++ >= 5); // Pops to settings page when signup is completed
      // Display popup after signup is completed and after 1500 ms, the popup disappears
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          Future.delayed(const Duration(milliseconds: 1500), () {
            Navigator.of(context).pop(true);
          });
          return const CupertinoAlertDialog(
            title: Text(
              textAlign: TextAlign.center,
              '로그인 되었습니다!',
            ),
          );
        },
      );
    }
  }
}

// Provider instance that manages the state of the sign-up form.
final signUpForm = StateProvider((ref) => {});

// Provider instance that exposes the SignUpViewModel to the app.
final signUpProvider = AsyncNotifierProvider<SignUpViewModel, void>(
  () => SignUpViewModel(),
);
