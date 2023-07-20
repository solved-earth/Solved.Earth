import 'package:app/Constants/gaps.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Gaps.v10,
        Tile(
          icon: Icons.person_outline,
          color: Colors.purple,
          text: "계정 연결",
        ),
        Gaps.v10,
        Tile(
          icon: Icons.bug_report_outlined,
          color: Colors.green,
          text: "버그 신고",
        ),
        Gaps.v10,
        Tile(
          icon: Icons.policy_outlined,
          color: Colors.blue,
          text: "라이선스",
        ),
        Gaps.v10,
        Tile(
          icon: Icons.campaign_outlined,
          color: Colors.brown,
          text: "공지사항",
        )
      ],
    );
  }
}

class Tile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const Tile({
    required this.icon,
    required this.color,
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Icon(
          icon,
          color: color,
        ),
      ),
      title: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 17,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_outlined,
        color: Colors.black,
        size: 20,
      ),
    );
  }
}
