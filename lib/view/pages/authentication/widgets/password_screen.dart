// ignore_for_file: empty_constructor_bodies

import 'package:flutter/material.dart';
import 'package:app/constants/sizes.dart';
import 'package:app/constants/gaps.dart';
import 'package:app/view/pages/authentication/widgets/form_button.dart';
import 'package:app/view/pages/authentication/widgets/birthday_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app/view_models/signup_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Screen for entering a password during the signup process.
class PasswordScreen extends ConsumerStatefulWidget {
  const PasswordScreen({super.key});

  @override
  ConsumerState<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends ConsumerState<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  String _password = "";

  bool _obscureText = true;

  @override
  void initState() {
    super.initState();

    // Listener to update the password text when the controller value changes.
    _passwordController.addListener(
      () {
        setState(
          () {
            _password = _passwordController.text;
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  // Check if the entered password is valid.
  bool _isPasswordValid() {
    return _password.isNotEmpty && _password.length > 8;
  }

  // Close the keyboard when the scaffold is tapped.
  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  // Handle the action when the "다음" button is tapped
  void _onSubmit() {
    if (!_isPasswordValid()) return;
    final state = ref.read(signUpForm.notifier).state;
    ref.read(signUpForm.notifier).state = {
      ...state,
      "password": _password,
    };
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BirthdayScreen(),
      ),
    );
  }

  // Handle the action when the solidCircleXmark icon is tapped
  void _onClearTap() {
    _passwordController.clear();
  }

  // Toggle the visibility of the password text
  void _toggleObscureText() {
    _obscureText = !_obscureText;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "가입하기",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v40,
              const Text(
                "비밀번호를 입력해주세요",
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v16,
              TextField(
                controller: _passwordController,
                autocorrect: false,
                onEditingComplete: _onSubmit,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: _onClearTap,
                        child: FaIcon(
                          FontAwesomeIcons.solidCircleXmark,
                          color: Colors.grey.shade500,
                          size: Sizes.size20,
                        ),
                      ),
                      Gaps.h16,
                      GestureDetector(
                        onTap: _toggleObscureText,
                        child: FaIcon(
                          _obscureText
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                          color: Colors.grey.shade500,
                          size: Sizes.size20,
                        ),
                      ),
                    ],
                  ),
                  hintText: "강력하게 만드세요!",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade500,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
                cursorColor: Theme.of(context).primaryColor,
              ),
              Gaps.v10,
              const Text(
                '비밀번호는 반드시:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.v10,
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.circleCheck,
                    size: Sizes.size20,
                    color: _isPasswordValid() ? Colors.green : Colors.grey,
                  ),
                  Gaps.h5,
                  const Text("8 ~ 20 자여야 합니다"),
                ],
              ),
              Gaps.v16,
              GestureDetector(
                onTap: _onSubmit,
                child: FormButton(
                  disabled: !_isPasswordValid(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
