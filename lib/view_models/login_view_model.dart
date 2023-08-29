import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/resources/authentication_repo.dart';
import 'package:app/utils/utils.dart';

class LoginViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _repository;
  int count = 0;

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
      Navigator.of(context).popUntil(
          (_) => count++ >= 3); // pops to settings page when login is completed
      // display popup after login is completed and after 1500 ms, the popup disappears
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

final loginProvider = AsyncNotifierProvider<LoginViewModel, void>(
  () => LoginViewModel(),
);
