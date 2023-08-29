import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app/constants/sizes.dart';

class AuthButton extends StatelessWidget {
  final String text; // The text to be displayed on the button
  final FaIcon icon; // The icon to be displayed on the button

  // Constructor for the AuthButton
  const AuthButton({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        padding: const EdgeInsets.all(Sizes.size14),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade300,
            width: Sizes.size1,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Display the icon aligned to the center left of the container
            Align(
              alignment: Alignment.centerLeft,
              child: icon,
            ),
            // Display the text in the center of the container
            Text(
              text,
              style: const TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
