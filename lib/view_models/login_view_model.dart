import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/resources/authentication_repo.dart';
import 'package:app/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _repository;
  int count = 0;

  //String currentUserUid = FirebaseAuth.instance.currentUser?.uid ?? 'No user signed in';

  @override
  FutureOr<void> build() {
    _repository = ref.read(authRepo);
  }

  Future<void> login(
    String email,
    String password,
    BuildContext context,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async => await _repository.signIn(email, password),
    );
    if (state.hasError) {
      showFirebaseErrorSnack(context, state.error);
    } else {
      //context.go("/mainpage");
      Navigator.of(context).popUntil((_) => count++ >= 3);
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

final loginProvider = AsyncNotifierProvider<LoginViewModel, void>(
  () => LoginViewModel(),
);
