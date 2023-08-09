import 'dart:async';

import 'package:app/resources/authentication_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:app/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _authRepo;
  int count = 0;

  //String currentUserUid = FirebaseAuth.instance.currentUser?.uid ?? 'No user signed in';

  @override
  FutureOr<void> build() {
    _authRepo = ref.read(authRepo);
  }

  Future<void> signUp(BuildContext context) async {
    state = const AsyncValue.loading();
    final form = ref.read(signUpForm);
    state = await AsyncValue.guard(
      () async => await _authRepo.signUp(
        form["email"],
        form["password"],
      ),
    );
    if (state.hasError) {
      showFirebaseErrorSnack(context, state.error);
    } else {
      //context.go("/mainpage");
      Navigator.of(context).popUntil((_) => count++ >= 5);
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
              'You are signed in!',
            ),
          );
        },
      );
      //print('Current user UID: $currentUserUid');
    }
  }
}

final signUpForm = StateProvider((ref) => {});

final signUpProvider = AsyncNotifierProvider<SignUpViewModel, void>(
  () => SignUpViewModel(),
);
