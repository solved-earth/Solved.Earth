import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:app/Constants/gaps.dart';
import 'package:app/pages/authentication/sign_up_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:app/resources/pdf_viewer.dart';
import 'package:app/resources/tile.dart';
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
  String pathPDF = "";
  String landscapePathPdf = "";

  @override
  void initState() {
    super.initState();

    fromAsset('documents/demo.pdf', 'demo.pdf').then((f) {
      setState(() {
        pathPDF = f.path;
      });
    });
    fromAsset('documents/landscape.pdf', 'landscape.pdf').then((f) {
      setState(() {
        landscapePathPdf = f.path;
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

  //final User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    String currentUserName =
        FirebaseAuth.instance.currentUser?.displayName ?? 'No user signed in';
    // ! Will be null if signing in anonymously or via password authentication. The UserName only shows up with using Social Authentication

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
                  child: const Tile(
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
                  child: const Tile(
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
                      // 크롬 브라우저에서 제대로 실행이 안 될 경우, launchUrl(url); 로 수정
                    } else {
                      // ignore: avoid_print
                      print("Can't launch $url");
                    }
                  },
                  child: const Tile(
                    icon: Icons.bug_report_outlined,
                    color: Colors.redAccent,
                    text: "버그 신고",
                  ),
                ),
                Gaps.v10,
                GestureDetector(
                  onTap: () {
                    if (pathPDF.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PDFScreen(path: pathPDF),
                        ),
                      );
                    }
                  },
                  child: const Tile(
                    icon: Icons.article_outlined,
                    color: Colors.brown,
                    text: "서비스 이용약관",
                  ),
                ),
                Gaps.v10,
                GestureDetector(
                  onTap: () {
                    if (landscapePathPdf.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PDFScreen(path: landscapePathPdf),
                        ),
                      );
                    }
                  },
                  child: const Tile(
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
                        return Scaffold(
                          appBar: AppBar(
                            title: const Text("오픈소스 라이선스"),
                          ),
                        );
                      },
                    ),
                  ),
                  child: const Tile(
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
