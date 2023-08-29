import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
//import 'package:wakmusic/style/colors.dart';
//import 'package:wakmusic/style/text_styles.dart';

class Item extends StatelessWidget {
  const Item({super.key, this.onTap, required this.text});
  final void Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 61,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade100),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.grey.shade900),
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
