import 'dart:async';

import 'package:app/pages/main_page.dart';
import 'package:app/resources/authentication_repo.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod/riverpod.dart';
import 'package:app/utils/utils.dart';

class SignUpViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _authRepo;

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
    } else {}
  }
}

final signUpForm = StateProvider((ref) => {});

final signUpProvider = AsyncNotifierProvider<SignUpViewModel, void>(
  () => SignUpViewModel(),
);
