// ignore_for_file: empty_constructor_bodies

import 'package:flutter/material.dart';
import 'package:app/constants/sizes.dart';
import 'package:app/constants/gaps.dart';
import 'package:app/view/pages/authentication/widgets/form_button.dart';
import 'package:app/view/pages/authentication/widgets/password_screen.dart';
import 'package:app/view_models/signup_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmailScreen extends ConsumerStatefulWidget {
  final String username;

  const EmailScreen({super.key, required this.username});

  @override
  ConsumerState<EmailScreen> createState() => _EmailScreenState();
}

// Define the state for the EmailScreen widget
class _EmailScreenState extends ConsumerState<EmailScreen> {
  final TextEditingController _emailController = TextEditingController();

  String _email = "";

  @override
  void initState() {
    super.initState();
    // Listen to changes in the email text field
    _emailController.addListener(
      () {
        setState(() {
          _email = _emailController.text;
        });
      },
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  // Validate if the email is in a valid format
  String? _isEmailValid() {
    if (_email.isEmpty) return null;
    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(_email)) {
      return "유효한 이메일 주소가 아닙니다.";
    }
    return null;
  }

  // Handle the action when the user taps on the scaffold
  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  // Handle the action when the "다음" button is tapped
  void _onSubmit() {
    if (_email.isEmpty || _isEmailValid() != null) return;
    final state = ref.read(signUpForm.notifier).state;
    ref.read(signUpForm.notifier).state = {"email": _email, ...state};
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PasswordScreen(),
      ),
    );
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
              Text(
                "이메일이 무엇인가요, ${widget.username}님?",
                style: const TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v16,
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                onEditingComplete: _onSubmit,
                decoration: InputDecoration(
                  hintText: "이메일",
                  errorText: _isEmailValid(),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
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
              Gaps.v16,
              GestureDetector(
                onTap: _onSubmit,
                child: FormButton(
                  disabled: _email.isEmpty || _isEmailValid() != null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
