import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:app/constants/gaps.dart';
import 'package:app/constants/sizes.dart';
import 'package:app/pages/authentication/login_screen.dart';
import 'package:app/pages/authentication/widgets/username_screen.dart';
import 'package:app/pages/authentication/widgets/auth_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/resources/authentication_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends ConsumerWidget {
  SignUpScreen({super.key});

  void onLoginTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }

  void _onUserNameTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const UserNameScreen(),
      ),
    );
  }

  void _onEmailTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const UserNameScreen(),
      ),
    );
  }

  final User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("계정 가입하기"),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size40,
          ),
          child: Column(
            children: [
              Gaps.v24,
              const Text(
                'Sign up for EcoTreeGrowing!',
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v20,
              const Text(
                'Create a profile, follow other accounts, make your own videos, and more.',
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Colors.black45,
                ),
                textAlign: TextAlign.center,
              ),
              Gaps.v10,
              GestureDetector(
                onTap: () => {
                  currentUser != null
                      ? {
                          showCupertinoDialog(
                            context: context,
                            builder: (context) {
                              return CupertinoAlertDialog(
                                title: const Text("You're already logged in"),
                                content:
                                    const Text("Please log out and try again"),
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
                        }
                      : _onEmailTap(context),
                },
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
                          onPressed: () => Navigator.of(context).pop(),
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
                'Already have an account?',
              ),
              Gaps.h5,
              GestureDetector(
                onTap: () => onLoginTap(context),
                child: Text(
                  'Log in',
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
