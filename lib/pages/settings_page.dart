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

import 'package:firebase_auth/firebase_auth.dart';

class SettingsPage extends StatefulWidget {
  // ConsumerWidget
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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

  @override
  Widget build(BuildContext context) {
    String currentUserName =
        FirebaseAuth.instance.currentUser?.displayName ?? 'No user signed in';

    return Column(
      children: [
        Gaps.v10,
        Text("Hello, $currentUserName"),
        Gaps.v10,
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
                return const SignUpScreen();
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
                  builder: (context) => PDFScreen(path: landscapePathPdf),
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
    );
  }
}
