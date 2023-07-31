import 'dart:async';

import 'package:app/resources/authentication_repo.dart';
import 'package:riverpod/riverpod.dart';

class SignUpViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _authRepo;

  @override
  FutureOr<void> build() {
    _authRepo = ref.read(authRepo);
  }

  Future<void> signUp() async {
    final form = ref.read(signUpForm);
    _authRepo.signUp(
      form["email"],
      form["password"],
    );
  }
}

final signUpForm = StateProvider((ref) => {});
