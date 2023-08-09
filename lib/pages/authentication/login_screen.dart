import 'package:flutter/material.dart';
import 'package:app/constants/gaps.dart';
import 'package:app/constants/sizes.dart';
import 'package:app/pages/authentication/widgets/auth_button.dart';
import 'package:app/pages/authentication/widgets/login_form_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app/resources/auth_service.dart';

import 'package:flutter/cupertino.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/resources/authentication_repo.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  void onSignUpTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onEmailLoginTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginFormScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("계정 로그인하기"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size40,
          ),
          child: Column(
            children: [
              Gaps.v24,
              const Text(
                'Log in to EcoTreeGrowing!',
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v20,
              const Text(
                'Manage yout account, check notifications, comment on videos, and more.',
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Colors.black45,
                ),
                textAlign: TextAlign.center,
              ),
              Gaps.v10,
              GestureDetector(
                onTap: () => _onEmailLoginTap(context),
                child: const AuthButton(
                  icon: FaIcon(FontAwesomeIcons.user),
                  text: "Use email & password",
                ),
              ),
              Gaps.v16,
              /*const AuthButton(
                icon: FaIcon(
                  size: 30,
                  FontAwesomeIcons.apple,
                ),
                text: "Continue with Apple",
              ),
              Gaps.v16,*/
              GestureDetector(
                onTap: () => {
                  showCupertinoDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: const Text("This method isn't available yet"),
                        content: const Text("Will be updated"),
                        actions: [
                          CupertinoDialogAction(
                              isDefaultAction: true,
                              child: const Text("확인"),
                              onPressed: () {
                                Navigator.pop(context);
                              })
                        ],
                      );
                    },
                  ),
                },
                // AuthService().signInWithGoogle(),
                child: const AuthButton(
                  icon: FaIcon(
                    FontAwesomeIcons.google,
                  ),
                  text: "Continue with Google",
                ),
              ),
              Gaps.v16,
              GestureDetector(
                onTap: () => {
                  showCupertinoDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: const Text("This method isn't available yet"),
                        content: const Text("Will be updated"),
                        actions: [
                          CupertinoDialogAction(
                              isDefaultAction: true,
                              child: const Text("확인"),
                              onPressed: () {
                                Navigator.pop(context);
                              })
                        ],
                      );
                    },
                  ),
                },
                child: const AuthButton(
                  icon: FaIcon(
                    FontAwesomeIcons.facebook,
                  ),
                  text: "Continue with Facebook",
                ),
              ),
              Gaps.v16,
              ListTile(
                title: const Text("Log out (Android)"),
                textColor: Colors.red,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      icon: const FaIcon(FontAwesomeIcons.skull),
                      title: const Text("Are you sure?"),
                      content: const Text("Plx dont go"),
                      actions: [
                        IconButton(
                          onPressed: () => {
                            Navigator.of(context).pop(),
                            //ref.read(authRepo).signOut(),
                            //context.go("/"),
                          },
                          icon: const FaIcon(FontAwesomeIcons.car),
                        ),
                        TextButton(
                          onPressed: () => ref
                              .read(authRepo)
                              .signOut(), //Navigator.of(context).pop(),
                          child: const Text("Yes"),
                        ),
                      ],
                    ),
                  );
                },
              ),
              Gaps.v5,
              ListTile(
                title: const Text("Log out (iOS / Bottom)"),
                textColor: Colors.red,
                onTap: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) => CupertinoActionSheet(
                      title: const Text("Are you sure?"),
                      message: const Text("Please dooooont gooooo"),
                      actions: [
                        CupertinoActionSheetAction(
                          isDefaultAction: true,
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("Not log out"),
                        ),
                        CupertinoActionSheetAction(
                          isDestructiveAction: true,
                          onPressed: () => ref
                              .read(authRepo)
                              .signOut(), //Navigator.of(context).pop(),
                          child: const Text("Yes plz."),
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey.shade50,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size32,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have an account?",
                style: TextStyle(
                  fontSize: Sizes.size16,
                ),
              ),
              Gaps.h5,
              GestureDetector(
                onTap: () => onSignUpTap(context),
                child: Text(
                  'Sign up',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
