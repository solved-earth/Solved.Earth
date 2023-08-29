import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:app/Constants/gaps.dart';
import 'package:app/view/pages/authentication/sign_up_screen.dart';
import 'package:app/view/oss_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:app/resources/pdf_viewer.dart';
import 'package:app/resources/icon_tile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app/view_models/user_view_model.dart';
import 'package:app/constants/sizes.dart';

class SettingsPage extends ConsumerStatefulWidget {
  // ConsumerWidget
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  String termsOfServicePathPDF = "";
  String personalInfoPathPdf = "";

  @override
  void initState() {
    super.initState();

    fromAsset('documents/Terms_Of_Service.pdf', 'Terms_Of_Service.pdf')
        .then((f) {
      setState(() {
        termsOfServicePathPDF = f.path;
      });
    });
    fromAsset('documents/Personal_Info_Process_Policy.pdf',
            'Personal_Info_Process_Policy.pdf')
        .then((f) {
      setState(() {
        personalInfoPathPdf = f.path;
      });
    });
  }

  Future<File> fromAsset(String asset, String filename) async {
    // To open from assets, you can copy them to the app storage folder, and the access them "locally"
    Completer<File> completer = Completer();

    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    /*String currentUserName =
        FirebaseAuth.instance.currentUser?.displayName ?? 'No user signed in';
    // ! Will be null if signing in anonymously or via password authentication. The UserName only shows up with using Social Authentication*/

    final User? currentUser = FirebaseAuth.instance.currentUser;

    return ref.watch(usersProvider).when(
          error: (error, stackTrace) => Center(
            child: Text(error.toString()),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          data: (data) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Gaps.v20,
                //Text("Hello, ${data.name}"),
                currentUser != null
                    ? Text(
                        "안녕하세요, ${data.name}님",
                        style: const TextStyle(
                          fontSize: Sizes.size20,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    : const Text(
                        "챌린지 인증을 위해 로그인이 필요합니다",
                        style: TextStyle(
                          fontSize: Sizes.size20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                Gaps.v16,
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        /*return Scaffold(
                    appBar: AppBar(
                      title: const Text("계정 연결"),
                    ),
                  );*/
                        return SignUpScreen();
                      },
                    ),
                  ),
                  child: const IconTile(
                    icon: Icons.person_outline,
                    color: Colors.purple,
                    text: "계정 연결",
                  ),
                ),
                Gaps.v10,
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Scaffold(
                          appBar: AppBar(
                            title: const Text("공지사항"),
                          ),
                        );
                      },
                    ),
                  ),
                  child: const IconTile(
                    icon: Icons.campaign_outlined,
                    color: Colors.green,
                    text: "공지사항",
                  ),
                ),
                Gaps.v10,
                GestureDetector(
                  onTap: () async {
                    final url = Uri.parse(
                      'https://docs.google.com/forms/d/e/1FAIpQLSckeLnESZUKqdkjAzkRZvKIaqkNC3azNiZ4SVlk6pzcthWbLQ/viewform',
                    );
                    if (await canLaunchUrl(url)) {
                      launchUrl(url, mode: LaunchMode.externalApplication);
                    } else {
                      // ignore: avoid_print
                      print("Can't launch $url");
                    }
                  },
                  child: const IconTile(
                    icon: Icons.bug_report_outlined,
                    color: Colors.redAccent,
                    text: "버그 신고",
                  ),
                ),
                Gaps.v10,
                GestureDetector(
                  onTap: () {
                    if (termsOfServicePathPDF.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PDFScreen(path: termsOfServicePathPDF),
                        ),
                      );
                    }
                  },
                  child: const IconTile(
                    icon: Icons.article_outlined,
                    color: Colors.brown,
                    text: "서비스 이용약관",
                  ),
                ),
                Gaps.v10,
                GestureDetector(
                  onTap: () {
                    if (personalInfoPathPdf.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PDFScreen(path: personalInfoPathPdf),
                        ),
                      );
                    }
                  },
                  child: const IconTile(
                    icon: Icons.apps_outage,
                    color: Colors.teal,
                    text: "개인정보 처리방침",
                  ),
                ),
                Gaps.v10,
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const OSSView();
                      },
                    ),
                  ),
                  child: const IconTile(
                    icon: Icons.policy_outlined,
                    color: Colors.blue,
                    text: "오픈소스 라이선스",
                  ),
                ),
              ],
            ),
          ),
        );
  }
}
