import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/resources/authentication_repo.dart';
import 'package:app/utils/utils.dart';

// ViewModel responsible for managing the login process.
class LoginViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _repository;
  int count = 0;

  @override
  FutureOr<void> build() {
    _repository = ref.read(authRepo);
  }

  // Initiates the login process with the provided email and password.
  Future<void> login(
    String email,
    String password,
    BuildContext context,
  ) async {
    state = const AsyncValue.loading(); // Set loading state.
    state = await AsyncValue.guard(
      () async =>
          await _repository.signIn(email, password), // Attempt to sign in.
    );
    if (state.hasError) {
      showFirebaseErrorSnack(
          context, state.error); // Show error snack bar if login fails.
    } else {
      //context.go("/mainpage");
      Navigator.of(context).popUntil(
          (_) => count++ >= 3); // Pops to settings page when login is completed
      // Display popup after login is completed and after 1500 ms, the popup disappears
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

// Provider instance that exposes the LoginViewModel to the app.
final loginProvider = AsyncNotifierProvider<LoginViewModel, void>(
  () => LoginViewModel(),
);
