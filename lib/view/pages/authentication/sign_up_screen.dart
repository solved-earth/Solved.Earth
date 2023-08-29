import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:app/constants/gaps.dart';
import 'package:app/constants/sizes.dart';
import 'package:app/view/pages/authentication/login_screen.dart';
import 'package:app/view/pages/authentication/widgets/username_screen.dart';
import 'package:app/view/pages/authentication/widgets/auth_button.dart';
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
                'Solved.Earth에 가입하세요!',
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v20,
              const Text(
                '계정을 만들어 다양한 환경 챌린지들을 수행하고 나만의 나무를 키워보세요!',
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Colors.black45,
                ),
                textAlign: TextAlign.center,
              ),
              Gaps.v20,
              GestureDetector(
                onTap: () => {
                  currentUser != null
                      ? {
                          showCupertinoDialog(
                            context: context,
                            builder: (context) {
                              return CupertinoAlertDialog(
                                title: const Text("이미 로그인 되어 있습니다."),
                                content: const Text("로그아웃하고 나서 다시 시도해주세요."),
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
                  text: "이메일과 비밀번호로 가입하기",
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
                        title: const Text("현재 지원되지 않는 방법입니다."),
                        content: const Text("빠른 시일 내에 업데이트 하겠습니다."),
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
                  text: "구글로 계속하기",
                ),
              ),
              Gaps.v16,
              GestureDetector(
                onTap: () => {
                  showCupertinoDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: const Text("현재 지원되지 않는 방법입니다."),
                        content: const Text("빠른 시일 내에 업데이트 하겠습니다."),
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
                  text: "페이스북으로 계속하기",
                ),
              ),
              Gaps.v16,
              /*ListTile(
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
              Gaps.v5,*/
              ListTile(
                title: const Text(
                  "로그아웃",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                textColor: Colors.red,
                onTap: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) => CupertinoActionSheet(
                      title: const Text("정말 로그아웃 하시겠습니까?"),
                      message: const Text("챌린지 인증은 로그인 상태에서만 가능합니다."),
                      actions: [
                        CupertinoActionSheetAction(
                          isDefaultAction: true,
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("취소"),
                        ),
                        CupertinoActionSheetAction(
                          isDestructiveAction: true,
                          onPressed: () => ref
                              .read(authRepo)
                              .signOut(), //Navigator.of(context).pop(),
                          child: const Text("확인"),
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
                '이미 계정이 있으신가요?',
                style: TextStyle(
                  fontSize: Sizes.size16,
                ),
              ),
              Gaps.h5,
              GestureDetector(
                onTap: () => onLoginTap(context),
                child: Text(
                  '로그인',
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
