import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:wakmusic/style/text_styles.dart';

enum HeaderType {
  down(true, 'arrow_bottom'),
  back(true, 'arrow_left'),
  close(false, 'close_header');

  const HeaderType(this.isBtnLeft, this.iconName);
  final bool isBtnLeft;
  final String iconName;
}

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.type,
    this.onTap,
    required this.headerTxt,
  });
  final HeaderType type;
  final void Function()? onTap;
  final String headerTxt;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Stack(
        children: [
          Positioned(
            top: 8,
            left: (type.isBtnLeft) ? 20 : null,
            right: (type.isBtnLeft) ? null : 20,
            child: GestureDetector(
              onTap: () {
                if (onTap != null) onTap!();
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                'assets/icons/ic_32_${type.iconName}.svg',
                width: 32,
                height: 32,
              ),
            ),
          ),
          Center(
            child: Text(
              headerTxt,
              style: const TextStyle(fontWeight: FontWeight.bold), //!
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
